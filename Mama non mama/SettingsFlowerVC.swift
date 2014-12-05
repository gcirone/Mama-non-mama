//
//  SettingsFlowerVC.swift
//  Mama non mama
//
//  Created by freshdev on 23/11/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit

class SettingsFlowerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("SettingsFlowerVC")
        
        
        
        
    }
    
    @IBAction func flowerSelect(sender: AnyObject) {
        
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    @IBAction func unwindToSettingsFlowerVC(sender: UIStoryboardSegue) {
        println("unwindToSettingsFlowerVC")
    }
    
    
    // MARK: - Config
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
