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
    var locationmanager = CLLocationManager()
    
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
        let current = locations.first
        let region = MKCoordinateRegion(center: current!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)) // Zoom
        mainMapDetail.setRegion(region, animated: true)
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
