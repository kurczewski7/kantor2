//
//  Kantor.swift
//  Kantor2
//
//  Created by Slawek Kurczewski on 20.11.2016.
//  Copyright © 2016 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class Kantor: NSObject {
    override init()
    {
        let path = Bundle.main.path(forResource: "currencies", ofType:"plist")
            if path != nil
            {
                print("path\(path)")
                if let list=NSArray(contentsOfFile: path!) as? Array<AnyObject>
                {
                    for item in list
                    {   print("item:\(item)") }
                }
            }
            else
            {
                print("Currencies file not found")
                abort()
            }
    }
        
        
        
        
        //NSBundle.mainBundle().pathForResource("currencies", ofType:"plist"?)
    func exchange(amount:Float, currencyCode:String) -> (buy:Float, sell:Float) {
        
        let buy = amount*4.21
        let sell = amount*3.58
    
        return (buy, sell)
    }
}
