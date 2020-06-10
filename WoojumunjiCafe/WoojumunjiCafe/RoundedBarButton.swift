//
//  RoundedBarButton.swift
//  WoojumunjiCafe
//
//  Created by hryang on 2020/06/10.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import UIKit

class RoundedBarButton: UIBarButtonItem {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        //self.layer.cornerRadius = 5.0
        //self.backgroundColor = UIColor(red: 177/255, green: 147/255, blue: 108/255, alpha: 1)
        self.tintColor = UIColor.brown
    }
}
