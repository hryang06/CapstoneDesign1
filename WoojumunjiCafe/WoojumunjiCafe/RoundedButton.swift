//
//  RoundedButton.swift
//  WoojumunjiCafe
//
//  Created by hryang on 2020/05/20.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0
        self.backgroundColor = UIColor(red: 177/255, green: 147/255, blue: 108/255, alpha: 1)
        self.tintColor = UIColor.white
    }
}
