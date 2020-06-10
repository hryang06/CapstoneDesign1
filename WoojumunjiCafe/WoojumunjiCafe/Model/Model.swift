//
//  Model.swift
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

    init(name: String) {
        self.name = name
        price = 4000
        latitude = 37.550950
        longitude = 126.941017
        radius = 100
    }
    
    //var dummyCafeList = [Cafe]()

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
