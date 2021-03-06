//
//  Cafe.swift
//  WoojumunjiCafe
//
//  Created by hryang on 2020/05/06.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import Foundation

class Cafe : NSObject {
    var name: String
    //var insertDate: Date
    var price: Int
    var latitude: Double
    var longitude: Double
    var radius: Int
    var address: String
    var url: String
    var phone: String
    
    var checked: Bool

    init(name: String, latitude: String, longitude: String, radius: String, price: Int, address: String, url: String, phone: String) {
        self.name = name
        self.price = price
        self.latitude = Double(latitude) ?? 37.550950
        self.longitude = Double(longitude) ?? 126.941017
        self.radius = Int(radius) ?? 100
        self.address = address
        self.url = url
        self.phone = phone
        self.checked = false
        
        if price == 0 {
            self.price = 10000 // price의 max 설정
        }
    }
    
    var dummyCafeList = [Cafe]()
    
    /* for toggling */
    func toggleChecked() {
        checked = !checked
    }

    /*
    static var dummyCafeList = [
        Cafe(content: "비로소 커피"),
        Cafe(content: "브로일링 컴퍼니 커피"),
        Cafe(content: "왓코 커피"),
        Cafe(content: "스타벅스 서강대점"),
        Cafe(content: "스타벅스 서강대프라자점"),
        Cafe(content: "스타벅스 대흥점")
    ]*/
}
