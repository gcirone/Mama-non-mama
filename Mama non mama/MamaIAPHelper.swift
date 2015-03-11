//
//  MamaIAPHelper.swift
//  Mama non mama
//
//  Created by freshdev on 10/03/15.
//  Copyright (c) 2015 Gianluca Cirone. All rights reserved.
//

import UIKit
import StoreKit

let IdentifierBannerRemove = "com.flashdevit.adremoval"
let IdentifierAddFlowers = "com.flashdevit.flowers"

class MamaIAPHelper: IAPHelper {
    
    var bannerProduct: SKProduct!
    var flowersProduct: SKProduct!
    
    class var sharedInstance: MamaIAPHelper {
        struct Static {
            static var instance: MamaIAPHelper?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = MamaIAPHelper(productIdentifiers: NSSet(array:[
                IdentifierBannerRemove,
                IdentifierAddFlowers
            ]))
        }
        
        return Static.instance!
    }
    
    class var bannerPurchased: Bool {
        return MamaIAPHelper.sharedInstance.productPurchased(IdentifierBannerRemove)!
    }
        
    class var flowersPurchased: Bool {
        return MamaIAPHelper.sharedInstance.productPurchased(IdentifierAddFlowers)!
    }
    
    override init(productIdentifiers: NSSet) {
        super.init(productIdentifiers: productIdentifiers)
        //println("MamaIAPHelper.init")
    }
    
}
