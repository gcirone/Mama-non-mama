//
//  SettingsSexVC.swift
//  Mama non mama
//
//  Created by freshdev on 23/11/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit

class SettingsSexVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("SettingsSexVC")

    }
    
    @IBAction func sexSelect(sender: AnyObject) {
        let button = sender as UIButton
        if button.tag == 1 {
            println("sex is woman")
        } else if button.tag == 2 {
            println("sex is man")
        }
        
        self.performSegueWithIdentifier("SettingsFlower", sender: self)
        
    }

    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    @IBAction func unwindToSettingsSexVC(sender: UIStoryboardSegue) {
        println("unwindToSettingsSexVC")
    }
    
    
    // MARK: - Config
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
