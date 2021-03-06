//
//  ViewController.swift
//  simple_MapView
//
//  Created by D7703_06 on 2018. 6. 4..
//  Copyright © 2018년 IceArrow. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    var annotations = [MKPointAnnotation]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let addr = "부산광역시 부산진구 양정동 350-1"
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(addr) {
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if let error = error {
                print(error)
                return
            }
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                //
                let loc = placemark.location?.coordinate
                //                let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                //                let region = MKCoordinateRegionMake(loc!, span)
                let region = MKCoordinateRegionMakeWithDistance(loc!, 0.05, 0.05)
                self.myMapView.setRegion(region, animated: true)
                
                // annoation
                let annotation = MKPointAnnotation()
                annotation.coordinate = loc!
                annotation.title = addr
                
                self.myMapView.addAnnotation(annotation)
                
                self.navigationController?.navigationBar.topItem?.title="늘해랑"
            
                
            }
        }
    }

}



