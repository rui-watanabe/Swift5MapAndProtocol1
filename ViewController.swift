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
            
            //get latitude and longitude from tapPoint
            let center = mapView.convert(tapPoint, toCoordinateFrom: mapView)
            
            let lat = center.latitude
            let long = center.longitude
            
            convert(lat: lat, long: long)
            
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
    
    @IBAction func goToSearchVC(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"
        {
            let nextC = segue.destination as! NextViewController
            
        }
    }
}

