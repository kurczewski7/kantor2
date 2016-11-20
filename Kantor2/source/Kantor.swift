//
//  Kantor.swift
//  Kantor2
//
//  Created by Slawek Kurczewski on 20.11.2016.
//  Copyright © 2016 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class Kantor: NSObject {
    func exchange(amount:Float, currencyCode:String) -> (buy:Float, sell:Float) {
        
        let buy = amount*4.21
        let sell = amount*3.58
    
        return (buy, sell)
    }
}
