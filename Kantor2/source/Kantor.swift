//
//  Kantor.swift
//  Kantor2
//
//  Created by Slawek Kurczewski on 20.11.2016.
//  Copyright © 2016 Slawomir Kurczewski. All rights reserved.
//

import UIKit

struct Currency {
    var code:String
    var name : String
    var buy : Float
    var sell: Float
    var conversion: Float
    

}



class Kantor: NSObject {
    var currencies: [String : Currency]=[:]
    
    
    override init()
    {
        let path = Bundle.main.path(forResource: "currencies", ofType:"plist")
            if path != nil
            {
                print("path\(path)")
                if let list=NSArray(contentsOfFile: path!) as? Array<AnyObject>
                {
                    for item in list
                    {   print("item:\(item)")
                        
                        let name = item["name"] as! String
                        let code = item["code"] as! String
                        let buy = item["buy"] as! Float
                        let sell = item["sell"] as! Float
                        let conversion = item["conversion"] as! Float
                        
                        let curr = Currency(code: code, name: name, buy: buy, sell: sell, conversion: conversion)
                        
                        currencies.updateValue(curr, forKey: code)
                    
                    
                    }
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
        if let selected = currencies[currencyCode]
        {
            let buy = amount*selected.buy
            let sell = amount*selected.sell
            return (buy, sell)

        }
        print("Currency data is missing for code \(currencyCode)")
        return (0.0,0.0)
    }
}
