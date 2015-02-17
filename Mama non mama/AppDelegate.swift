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
        FBLoginView.self
        FBProfilePictureView.self        
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: NSString?, annotation: AnyObject) -> Bool {
        var wasHandled:Bool = FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication)
        return wasHandled
    }
    
    func applicationWillResignActive(application: UIApplication) {
        AVAudioSession.sharedInstance().setActive(false, error: nil)
    }

    func applicationDidEnterBackground(application: UIApplication) {
        AVAudioSession.sharedInstance().setActive(false, error: nil)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        AVAudioSession.sharedInstance().setActive(true, error: nil)
    }

    func applicationWillTerminate(application: UIApplication) {
        
    }


}

