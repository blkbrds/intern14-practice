//
//  SearchMapViewController.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/23/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit
import MapKit

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class SearchMapViewController: UIViewController {

    @IBOutlet weak var locationSearchBar: UISearchBar!
    @IBOutlet weak var localtionMapView: MKMapView!
    @IBOutlet weak var locationSearchTable: UITableView!
    
    let locationmanager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    var searchLocation: CLLocationCoordinate2D?
    let myIdentity = "identity"
    
    var matchingItems:[MKMapItem] = []
    var selectedPin:MKPlacemark?
    var handleMapSearchDelegate:HandleMapSearch? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationSearchBar.returnKeyType = .done
        locationmanager.delegate = self

        // Config location service.
        locationSearchBar.delegate = self
        startStandarLocationService()
        
        locationSearchTable.register(UITableViewCell.self, forCellReuseIdentifier: myIdentity)
        locationSearchTable.dataSource = self
        locationSearchTable.delegate = self
    }
    
    /**
     * Display current location.
     */
    private func startStandarLocationService() {
        locationmanager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationmanager.distanceFilter = 500
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
    }
    
    /**
     * Search location by name.
     */
    private func search(named: String) {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = locationSearchBar.text
        request.region = localtionMapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }
            self.matchingItems = response.mapItems
            self.locationSearchTable.reloadData()
        }

//        print("Search location with name: \(named)")
//        // Add annotation.
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 16.044, longitude: 108.172)
//        annotation.title = "Point Annotation"
//        annotation.subtitle = "Point annotation information"
//        localtionMapView.addAnnotation(annotation)
    }
    
    /**
     * Draw short way between 2 locations.
     */
    private func drawLineTwoLocation(source: CLLocationCoordinate2D, target: CLLocationCoordinate2D) {

        // Get begin and end point
        let sourcePlaceMark = MKPlacemark(coordinate: source)
        let targetPlaceMark = MKPlacemark(coordinate: target)
        
        // Get Map Item.
        let sourceMapItem = MKMapItem(placemark: sourcePlaceMark)
        let targetMapItem = MKMapItem(placemark: targetPlaceMark)
        
        // Create direct request.
        let directRequest = MKDirections.Request()
        directRequest.transportType = .automobile
        directRequest.source = sourceMapItem
        directRequest.destination = targetMapItem
        
        let directions = MKDirections(request: directRequest)
        directions.calculate { (response, error) in
            if (error == nil) {
                // Have a lot of routes. But let choose minimum way.
                if let route = response?.routes.first {
                    self.localtionMapView.addOverlay(route.polyline, level: .aboveRoads)
                    let rect = route.polyline.boundingMapRect
                    self.localtionMapView.setVisibleMapRect(rect, edgePadding: UIEdgeInsets(top: 40, left: 40, bottom: 20, right: 20), animated: true)
                }
            }
        }
    }
    
    /**
     * Convert address when select cell.
     */
    func parseAddress(selectedItem:MKPlacemark) -> String {
        // put a space between "4" and "Melrose Place"
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
        // put a comma between street and city/state
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
        // put a space between "Washington" and "DC"
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        let addressLine = String(
            format:"%@%@%@%@%@%@%@",
            // street number
            selectedItem.subThoroughfare ?? "",
            firstSpace,
            // street name
            selectedItem.thoroughfare ?? "",
            comma,
            // city
            selectedItem.locality ?? "",
            secondSpace,
            // state
            selectedItem.administrativeArea ?? ""
        )
        return addressLine
    }
    
    @objc func getDirections(){
        if let selectedPin = selectedPin {
            let mapItem = MKMapItem(placemark: selectedPin)
            let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
            mapItem.openInMaps(launchOptions: launchOptions)
        }
    }
}

extension SearchMapViewController: UISearchBarDelegate, MKMapViewDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchText = searchBar.text {
            search(named: searchText)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        let reuseId = "pin"
        var pinView = localtionMapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        pinView?.pinTintColor = UIColor.orange
        pinView?.canShowCallout = true
        let smallSquare = CGSize(width: 30, height: 30)
        let button = UIButton(frame: CGRect(origin: CGPoint.zero, size: smallSquare))
        button.setBackgroundImage(UIImage(named: "car"), for: .normal)
        button.addTarget(self, action: #selector(getDirections), for: .touchUpInside)
        pinView?.leftCalloutAccessoryView = button
        return pinView
    }
}

extension SearchMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let center = CLLocationCoordinate2D(latitude: 16.0472484, longitude: 108.1716005)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: center, span: span) // Zoom
        localtionMapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted, .denied:
            print("Restricted or denied.")
            locationmanager.stopUpdatingLocation()
        case .authorizedAlways, .authorizedWhenInUse:
            print("Authorized always or authorized when in used.")
            CLLocationManager.locationServicesEnabled()
            startStandarLocationService()
        default:
            print("Not determined.")
        }
    }
    
    /**
     * Check if case error happen.
     */
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: (error)")
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        let lineRenderer = MKPolylineRenderer(overlay: overlay)
        lineRenderer.fillColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 0.3)
        lineRenderer.strokeColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 0.7)
        lineRenderer.lineWidth = 3
        return lineRenderer
    }
}

extension SearchMapViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myIdentity, for: indexPath)
        let selectedItem = matchingItems[indexPath.row].placemark
        cell.textLabel?.text = selectedItem.name
        cell.detailTextLabel?.text = ""
        return cell
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
        dismiss(animated: true, completion: nil)
    }
}

extension SearchMapViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        localtionMapView.removeAnnotations(localtionMapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
        let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        localtionMapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        localtionMapView.setRegion(region, animated: true)
    }
}
