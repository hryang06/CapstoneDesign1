//
//  ViewController.swift
//  WoojumunjiCafe
//
//  Created by hryang on 2020/05/06.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MTMapViewDelegate {
    var mapView: MTMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MTMapView(frame: self.view.bounds)
        
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
        }
        // Do any additional setup after loading the view.
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
