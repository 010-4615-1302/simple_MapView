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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let center = CLLocationCoordinate2D(latitude: 35.166043, longitude: 129.072564)
//        //위도, 경도 표시
//        let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
//        //확대 거리
//        let region = MKCoordinateRegion(center: center,span: span)
//
//        myMapView.setRegion(region, animated: true)
        let region = MKCoordinateRegionMakeWithDistance(center, 2000,2000)
        myMapView.setRegion(region, animated: true)
        //핀생성
//        let loc01 = CLLocationCoordinate2D(latitude: 35.167809, longitude: 129.070555)
//        let anno1 = MKPointAnnotation()
//        anno1.coordinate = loc01
//        anno1.title = "번개반점"
//        anno1.subtitle = "부산광역시 부산진구 양정 1동 418-260"
//        myMapView.addAnnotation(anno1)
//
//        let anno2 = MKPointAnnotation()
//        anno2.coordinate = center;
//        anno2.title = "동의과학대"
//        anno2.subtitle = "부산광역시 부산진구 양정동 429-19"
//        myMapView.addAnnotation(anno2)
//
//        let loc02 = CLLocationCoordinate2D(latitude: 35.170117, longitude: 129.070341)
//        let anno3 = MKPointAnnotation()
//        anno3.coordinate = loc02;
//        anno3.title = "토마토도시락"
//        anno3.subtitle = "부산광역시 부산진구 양정1동 양지로11번길"
//        myMapView.addAnnotation(anno3)
        
        //번개 반점의 주소를 위도, 경도로 변환
        
        let addr = "부산광역시 부산진구 양정1동 418-260"
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(addr) {
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if let error = error {
                print(error)
                return
            }
            if placemarks != nil {
                let placemark = placemarks![0]
                
                
                let loc1 = placemark.location?.coordinate
                let anno1 = MKPointAnnotation()
                anno1.coordinate = loc1!
                anno1.title = "번개반점"
                anno1.subtitle = "부산광역시 부산진구 양정 1동 418-260"
                self.myMapView.addAnnotation(anno1)
            }
            else{
                print("nil 발생")
        }
    }

}
}


