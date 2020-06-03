//
//  ViewController.swift
//  WoojumunjiCafe
//
//  Created by hryang on 2020/05/06.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, MTMapViewDelegate {
    var mapView: MTMapView?
    var mapPoint: MTMapPoint?
    var locationMarkerItem: MTMapLocationMarkerItem?
    //var cafes: Cafe?

    override func viewDidLoad() {
        super.viewDidLoad()

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
        print("testing")
        var cafeList = [MTMapPOIItem] ()
        
        for cafe in Cafe.dummyCafeList {
            if cafe.radius <= 350 {
                cafeList.append(poiItem(name: cafe.name, latitude: cafe.latitude, longitude: cafe.longitude))
            }
        }
        
        mapView?.addPOIItems(cafeList)
        mapView?.fitAreaToShowAllPOIItems()
    }
    
    @IBAction func onCurrentLocationClick(_ sender: Any) {
        print("current location button")
    }
    
    /*
    override func viewDidAppear(_ animated: Bool) {

        //mapView?.addPOIItems(cafes)
        //mapView?.fitAreaToShowAllPOIItems()
    }
     */
    
    func poiItem(name: String, latitude: Double, longitude: Double) -> MTMapPOIItem {
        let item = MTMapPOIItem()
        item.itemName = name
        item.markerType = .redPin
        item.markerSelectedType = .redPin
        item.mapPoint = MTMapPoint(geoCoord: .init(latitude: latitude, longitude: longitude))
        item.showAnimationType = .noAnimation
        item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)    // 마커 위치조정
        
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
