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
        
        let foodStoreAddress = ["부산광역시 부산진구 양정1동 350-1",
                                "부산광역시 부산진구 양정동 418-282",
                                "부산광역시 부산진구 양정동 393-18",
                                "부산광역시 부산진구 양정1동 356-22",
                                "부산광역시 부산진구 양정1동 산19-8",
                                "부산광역시 부산진구 양정동 353-38",
                                "부산광역시 부산진구 양정동 429-19"]
        let foodStoreNames = ["늘해랑", "번개반점", "아딸", "왕짜장", "토마토 도시락", "홍콩반점","동의과학대학교"]
        for addr in foodStoreAddress{
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(addr){
                (placemarks: [CLPlacemark]?, error : Error?) -> Void in
                if let myError = error{
                    print(myError)
                    return
                }
                if let myPlacemarks = placemarks{
                    let myPlacemark = myPlacemarks[0]
                    let loc = myPlacemark.location?.coordinate
                    
                    let anno = MKPointAnnotation()
                    anno.coordinate = loc!
                    anno.title = foodStoreNames[self.count]
                    self.count = self.count + 1
                    anno.subtitle = addr
                    self.annotations.append(anno)
                    self.myMapView.addAnnotations(self.annotations)
                    self.myMapView.showAnnotations(self.annotations, animated: true)
                }
                else{
                    print("오류")
                }
            }
        }
        
    }

}



