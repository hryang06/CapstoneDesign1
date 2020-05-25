//
//  Model.swift
//  WoojumunjiCafe
//
//  Created by hryang on 2020/05/06.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import Foundation

class Cafe {
    var cafeName: String
    //var insertDate: Date
    var americano: Int
    var latitude: Double
    var longitude: Double
    
    init(content: String) {
        self.cafeName = content
        //insertDate = Date()
        americano = 4000
        latitude = 37.550950
        longitude = 126.941017
    }
    
    static var dummyCafeList = [
        Cafe(content: "비로소 커피"),
        Cafe(content: "브로일링 컴퍼니 커피"),
        Cafe(content: "왓코 커피"),
        Cafe(content: "스타벅스 서강대점"),
        Cafe(content: "스타벅스 서강대프라자점"),
        Cafe(content: "스타벅스 대흥점"),
        Cafe(content: "카페1"),
        Cafe(content: "카페2"),
        Cafe(content: "카페3"),
        Cafe(content: "카페4"),
        Cafe(content: "카페5"),
        Cafe(content: "카페6"),
        Cafe(content: "카페7")
    ]
}
