//
//  ViewController.swift
//  simpleGeoCoding
//
//  Created by D7702_09 on 2019. 10. 11..
//  Copyright © 2019년 csd5766. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var MKMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pins = [MKPointAnnotation]()
        
        let addr01 = "부산시 양정동 429-10"
        
        
        let addr02 = "부산시 전포동 818"
        
        //GeoCoder 클래스 객체 하나 생성
        let fGeoCoder = CLGeocoder()
        
        //Closure
//        fGeoCoder.geocodeAddressString(addr, completionHandler: {
//            (placemarks: [CLPlacemark]? , error: Error?) in
//
//            if error != nil {
//                print("Ubable to geocoding \(error!)")
//            }
//
//            if let myPlacemark = placemarks {
//                let placemark = myPlacemark[0]
//
//                print(placemark.location?.coordinate)
//            }
//        })
        
        //trailing closure
        fGeoCoder.geocodeAddressString(addr01){
            placemarks , error in
            
            if error != nil {
                print("Ubable to geocoding \(error!)")
            }
            
            if let myPlacemark0 = placemarks {
                let placemark = myPlacemark0[0]
                let pin = MKPointAnnotation()
                pin.coordinate = placemark.location!.coordinate
                pin.title = "동의과학대학교"
                pin.subtitle = "학교"
                pins.append(pin)
                self.MKMapView.showAnnotations(pins, animated: true)
            }
        }
        
        fGeoCoder.geocodeAddressString(addr02){
            placemarks , error in
            
            if error != nil {
                print("Ubable to geocoding \(error!)")
            }
            
            if let myPlacemark = placemarks {
                let placemark = myPlacemark[0]
                let pin = MKPointAnnotation()
                pin.coordinate = placemark.location!.coordinate
                pin.title = "송상현광장"
                pin.subtitle = "학교 근처 공원"
                pins.append(pin)
                self.MKMapView.showAnnotations(pins, animated: true)
            }
        }
        
    }


}

