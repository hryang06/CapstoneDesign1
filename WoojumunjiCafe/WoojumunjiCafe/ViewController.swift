//
//  ViewController.swift
//  WoojumunjiCafe
//
//  Created by hryang on 2020/05/06.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase

@available(iOS 13.0, *)
class ViewController: UIViewController, MTMapViewDelegate {
    var ref: DatabaseReference!
    var cafelist = CafeList()
    //@IBOutlet weak var cafelist: CafeList!
    var mapView: MTMapView?
    var mapPoint: MTMapPoint?
    var locationMarkerItem: MTMapLocationMarkerItem?
    //var cafes: Cafe?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* load data */
        for idx in Range(0...14) {
            let root = "data/" + String(idx)
            ref = Database.database().reference()
            ref.child(root).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                let cafename = value?["place_name"] as? String ?? ""
                let latitude = value?["y"] as? String ?? ""
                let longitude = value?["x"] as? String ?? ""
                let radius = value?["distance"] as? String ?? ""
                let price = value?["price"] as? Int ?? 0
                
                //print(cafename)
                let cafe = Cafe(name: cafename, latitude: latitude, longitude: longitude, radius: radius, price: price)
                print(cafe.name)
                self.cafelist.dummyCafeList.append(cafe)
                print(self.cafelist.dummyCafeList.count)
            })
        }

        /* map view */
        // Do any additional setup after loading the view.
        mapView = MTMapView(frame: self.view.bounds)
        
        // set center point to 서강대학교
        mapPoint = MTMapPoint.init(geoCoord: MTMapPointGeo.init(latitude: 37.550950, longitude: 126.941017))
        mapView?.setMapCenter(mapPoint, animated: true)
        
        // set center point to current location
        // mapView?.currentLocationTrackingMode = .onWithoutHeading

        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
            self.view.sendSubviewToBack(mapView)
            print("map view")
        }
    }
    
    @IBAction func onClick(_ sender: Any) {
        // searchButton
        // 현재 지도 중심점을 갖고온다
        // 현재 지도를 중심으로 카페를 검색한다. (반경 500m)
        // 그 해당 카페를 마커 item에 집어 넣는다.
        var cafeList = [MTMapPOIItem] ()
        
        for cafe in self.cafelist.dummyCafeList {
            if cafe.radius <= 350 {
                cafeList.append(poiItem(name: cafe.name, latitude: cafe.latitude, longitude: cafe.longitude))
            }
        }
        mapView?.addPOIItems(cafeList)
        mapView?.fitAreaToShowAllPOIItems()
        
        // dummyCafeList 데이터 갱신
        
        //print("onClick")
        //print(self.cafelist.dummyCafeList.count)
    }
    
    @IBAction func onCurrentLocationClick(_ sender: Any) {
        print("current location button")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        // 여기서 map view가 고쳐질 때마다 새로 화면 load
        //mapView?.addPOIItems(cafes)
        //mapView?.fitAreaToShowAllPOIItems()
    }
     
    
    func poiItem(name: String, latitude: Double, longitude: Double) -> MTMapPOIItem {
        let item = MTMapPOIItem()
        item.itemName = name
        item.markerType = .redPin
        item.markerSelectedType = .redPin
        item.mapPoint = MTMapPoint(geoCoord: .init(latitude: latitude, longitude: longitude))
        item.showAnimationType = .noAnimation
        item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)    // 마커 위치
        
        return item
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
