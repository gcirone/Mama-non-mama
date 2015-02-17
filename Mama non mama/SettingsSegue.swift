//
//  SettingsSegue.swift
//  M'ama non m'ama
//
//  Created by Gianluca, Cirone on 10/11/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit

class SettingsSegue: UIStoryboardSegue {
   
    override func perform() {
        let src = self.sourceViewController as UIViewController
        let dst = self.destinationViewController as UIViewController
        
        let hasLaunchedSettings = SettingsApp.hasLaunchedSettings
        
        //if !hasLaunchedSettings {
            //dst.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        //}
        
        src.presentViewController(dst, animated: hasLaunchedSettings, completion: nil)
        
    }
    
}
