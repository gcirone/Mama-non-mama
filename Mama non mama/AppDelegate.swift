//
//  AppDelegate.swift
//  Mama non mama
//
//  Created by freshdev on 22/11/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //NSThread.sleepForTimeInterval(1);
        
        //iap helper init
        MamaIAPHelper.sharedInstance
        
        //facebook init
        FBLoginView.self
        FBProfilePictureView.self
        
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: NSString?, annotation: AnyObject) -> Bool {
        var wasHandled:Bool = FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication)
        return wasHandled
    }
    
    func applicationWillResignActive(application: UIApplication) {
        //println("applicationWillResignActive")
        NSNotificationCenter.defaultCenter().postNotificationName("stopBgMusic", object:self)
        AVAudioSession.sharedInstance().setActive(false, error: nil)
    }

    func applicationDidEnterBackground(application: UIApplication) {
        //println("applicationDidEnterBackground")
        NSNotificationCenter.defaultCenter().postNotificationName("stopBgMusic", object:self)
        AVAudioSession.sharedInstance().setActive(false, error: nil)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        //println("applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        //println("applicationDidBecomeActive")
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        NSNotificationCenter.defaultCenter().postNotificationName("playBgMusic", object:self)
    }

    func applicationWillTerminate(application: UIApplication) {
        //println("applicationWillTerminate")
    }

}

