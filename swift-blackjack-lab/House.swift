//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Raquel Rahmey on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class House: Player{
    
    var mustHit: Bool {
        if handscore >= 17 {
            stayed = true
            return false
        } else {
            return true
        }
    }
    
    
    override init(name:String) {
        super.init(name: name)
        tokens = 1000
    }
    
    
    
    
    
}
