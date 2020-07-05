//
//  ViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by watar on 2020/07/04.
//  Copyright © 2020 rui watanabe. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locManager:CLLocationManager!
    
    var addressString = ""
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var settingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingButton.backgroundColor = .white
        settingButton.layer.cornerRadius = 20.0
    }

    @IBAction func longPressTap(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began
        {//start tapping
            
        }
        else if sender.state == .ended
        {//finished tapp
            //get latitude and longitude
            
            //chenge address
            let tapPoint = sender.location(in: view)
        }
    }
    
    func convert(lat: CLLocationDegrees, long:CLLocationDegrees)
    {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: long)
        
        //closure
        geocoder.reverseGeocodeLocation(location)
        { (placeMark, error) in
            if let placeMark = placeMark
            {//not nil placeMark
                if let pm = placeMark.first
                {//not nil placeMark.first
                    if pm.administrativeArea != nil || pm.locality != nil
                    {
                        self.addressString = pm.name! + pm.administrativeArea! + pm.locality!
                    }
                    else
                    {
                        self.addressString = pm.name!
                    }
                    
                    self.addressLabel.text = self.addressString
                }
            }
        }
    }
    
}

