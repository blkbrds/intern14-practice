//
//  MapDetailViewController.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit
import MapKit

class MapDetailViewController: UIViewController {

    @IBOutlet weak var mainMapDetail: MKMapView!
    let locationmanager = CLLocationManager()
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationmanager.delegate = self
        startStandarLocationService()
        mainMapDetail.showsUserLocation = true
    }
    
    private func startStandarLocationService() {
        locationmanager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationmanager.distanceFilter = 500
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
    }
}

extension MapDetailViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let latitude = latitude, let longitude = longitude {
            let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: center, span: span) // Zoom
            mainMapDetail.setRegion(region, animated: true)
        }
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
}
