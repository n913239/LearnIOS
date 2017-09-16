//
//  ViewController.swift
//  HelloCLLocationManager
//
//  Created by mikewang on 2017/9/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var map: MKMapView!
    var locationManager:CLLocationManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.activityType = .automotiveNavigation
        locationManager?.startUpdatingLocation()
        
        if let coordinate = locationManager?.location?.coordinate {
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan = MKCoordinateSpanMake(yScale, xScale)
            
            let region = MKCoordinateRegionMake(coordinate, span)
            map.setRegion(region, animated: true)
        }
        
        // 追蹤使用者模式
        map.userTrackingMode = .followWithHeading
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        // 停止追蹤使用者
        locationManager?.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate = locations[0].coordinate
        print("-------------------------------")
        print(coordinate.latitude)
        print(coordinate.longitude)
    }


}

