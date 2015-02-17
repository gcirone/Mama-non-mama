//
//  SettingsApp.swift
//  M'ama non m'ama
//
//  Created by Gianluca, Cirone on 10/11/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit

var instacesVC : [String:Any] = [
    "AppDelegate":UIApplication.sharedApplication().delegate
]
var configItems : [String:AnyObject] = [
    "woman-color":"fe3983", "man-color":"329ae5"
]

class SettingsApp {
    
    class var IS_IPHONE : Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Phone
    }
    
    class var IS_IPAD : Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Pad
    }
    
    class var IS_IPHONE4 : Bool {
        return (SettingsApp.IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 480)
    }
    
    class var IS_IPHONE5 : Bool {
        return (SettingsApp.IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 568)
    }
    
    class var IS_IPHONE6 : Bool {
        return (SettingsApp.IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 667)
    }
    
    class var IS_IPHONE6PLUS : Bool {
        return (SettingsApp.IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 736)
    }
    
    class var appDomain : String {
        return NSBundle.mainBundle().bundleIdentifier!
    }
    
    class var hasLaunchedSettings : Bool {
        get {
            return NSUserDefaults.standardUserDefaults().boolForKey("HasLaunchedSettings")
        }
        set {
            NSUserDefaults.standardUserDefaults().setBool(newValue, forKey:"HasLaunchedSettings")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    class var VC: [String:Any] {
        get { return instacesVC }
        set { instacesVC = newValue }
    }
    
    class var CNF: [String:AnyObject] {
        get {
            if let oldValue = NSUserDefaults.standardUserDefaults().objectForKey("configItems") as? [String:AnyObject] {
                configItems = oldValue
            }
            //for (itemName,itemValue) in configItems {
                //println("config: \(itemName)  value: \(itemValue)")
            //}
            return configItems
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "configItems")
            NSUserDefaults.standardUserDefaults().synchronize()
            configItems = newValue
        }
    }
    
}
