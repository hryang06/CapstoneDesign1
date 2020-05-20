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
    var searchButton: RoundedButton?

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
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //searchButton
        
        var cafes = [MTMapPOIItem] ()
        cafes.append(poiItem(name: "하나", latitude: 37.4981688, longitude: 127.0484572))
        cafes.append(poiItem(name: "둘", latitude: 37.4987963, longitude: 127.0415946))
        cafes.append(poiItem(name: "셋", latitude: 37.5025612, longitude: 127.0415946))
        cafes.append(poiItem(name: "넷", latitude: 37.5037539, longitude: 127.0426469))
        
        // 현재 지도 중심점을 갖고온다
        // 현재 지도를 중심으로 카페를 검색한다. (반경 500m)
        // 그 해당 카페를 마커 item에 집어 넣는다.
        /* mark
        mapItem?.mapPoint = mapPoint
        mapItem?.markerType = MTMapPOIItemMarkerType.redPin
        mapItem?.showAnimationType = MTMapPOIItemShowAnimationType.springFromGround
        */

        mapView?.addPOIItems(cafes)
        mapView?.fitAreaToShowAllPOIItems()
    }
    
    func poiItem(name: String, latitude: Double, longitude: Double) -> MTMapPOIItem {
        let item = MTMapPOIItem()
        item.itemName = name
        item.markerType = .bluePin
        item.markerSelectedType = .bluePin
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
