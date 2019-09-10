//
//  ViewController.swift
//  MapsProject
//
//  Created by MCS on 9/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

  @IBOutlet weak var theMapView: MKMapView!
  let locationManager = CLLocationManager()
  
  var currentLocation: CLLocation? {
    didSet {
      guard let unwrappedLocation = currentLocation else { return }
      theMapView.setCenter(unwrappedLocation.coordinate, animated: true)
      let mapPoint = MKMapPoint(unwrappedLocation.coordinate)
      let mapSize = MKMapSize(width: 200000, height: 200000)
      let mapRect = MKMapRect(origin: mapPoint, size: mapSize)
      theMapView.setVisibleMapRect(mapRect, animated: true)
      let annotation = MKPointAnnotation()
      annotation.coordinate = unwrappedLocation.coordinate
      theMapView.addAnnotation(annotation)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    
  }
}

extension ViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print(locations)
    currentLocation = locations.first
    CLGeocoder().reverseGeocodeLocation(locations.first!) { (placemarks, error) in
      print(placemarks)
      print(error?.localizedDescription)
    }
  }
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error.localizedDescription)
  }
}
