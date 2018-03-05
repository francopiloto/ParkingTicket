//
//  LocationViewController.swift
//  FinalProject
//
//  Created by Franco on 3/5/18.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController
{
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segMapType: UISegmentedControl!
    
    private var locationManager:CLLocationManager!;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();

        mapView.mapType = MKMapType.standard;
        mapView.showsUserLocation = true;
        mapView.userTrackingMode = MKUserTrackingMode.follow;
        
        locationManager = CLLocationManager();
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestWhenInUseAuthorization();
        locationManager.requestLocation();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    @IBAction func segMapTypeChanged(_ sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex
        {
            case 0: mapView.mapType = MKMapType.standard; break;
            case 1: mapView.mapType = MKMapType.satellite; break;
            case 2: mapView.mapType = MKMapType.hybrid; break;
            
            default:
                break;
        }
    }
}

extension LocationViewController : CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("New location found!");
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)");
    }
}
