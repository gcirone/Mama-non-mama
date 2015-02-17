//
//  SettingsSexVC.swift
//  Mama non mama
//
//  Created by freshdev on 23/11/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit

class SettingsSexVC: UIViewController {
    
    @IBOutlet weak var logoHeight: NSLayoutConstraint!
    @IBOutlet weak var closeSettings: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //println("SettingsSexVC")
        
        //fix autolayout
        if SettingsApp.IS_IPHONE4 {
            logoHeight.constant = 140
        }
        
        //hide close button
        closeSettings.hidden = !SettingsApp.hasLaunchedSettings

    }
    
    @IBAction func sexSelect(button: AnyObject) {
        if button.tag == 1 {
            SettingsApp.CNF["sex"] = "woman"
        } else if button.tag == 2 {
            SettingsApp.CNF["sex"] = "man"
        }
        self.performSegueWithIdentifier("SettingsUser", sender: self)
    }

    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    @IBAction func unwindToSettingsSexVC(sender: UIStoryboardSegue) {
        //println("unwindToSettingsSexVC")
    }
    
    
    
    // MARK: - Config
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
