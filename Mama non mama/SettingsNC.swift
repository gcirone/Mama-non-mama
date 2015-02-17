//
//  SettingsNC.swift
//  Mama non mama
//
//  Created by freshdev on 15/02/15.
//  Copyright (c) 2015 Gianluca Cirone. All rights reserved.
//

import UIKit

class SettingsNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if SettingsApp.hasLaunchedSettings {
            var controllers = viewControllers
            controllers.append(storyboard!.instantiateViewControllerWithIdentifier("SettingsUserVC") as SettingsUserVC)
            controllers.append(storyboard!.instantiateViewControllerWithIdentifier("SettingsFlowerVC") as SettingsFlowerVC)
            setViewControllers(controllers, animated:true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
