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
    var insertDate: Date
    
    init(content: String) {
        self.cafeName = content
        insertDate = Date()
    }
    
    static var dummyCafeList = [
        Cafe(content: "비로소 커피"),
        Cafe(content: "브로일링 컴퍼니 커피"),
        Cafe(content: "스타벅스"),
        Cafe(content: "스타벅스"),
        Cafe(content: "스타벅스"),
        Cafe(content: "스타벅스"),
        Cafe(content: "스타벅스"),
        Cafe(content: "스타벅스"),
        Cafe(content: "스타벅스")
    ]
}
