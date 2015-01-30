//
//  ContainerVC.swift
//  Mama non mama
//
//  Created by freshdev on 27/12/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var settingsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("ContainerVC")
        //println("height \(UIScreen.mainScreen().bounds.size.height)")
        
        //refill settings value
        refillSettings()
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //println("ContainerVC.viewDidAppear")
        
        //SettingsApp.hasLaunchedSettings = false
        if !SettingsApp.hasLaunchedSettings {
            //settingsBtn.sendActionsForControlEvents(.TouchUpInside);
            self.performSegueWithIdentifier("SettingsSegue", sender: self)
        }
        
    }
    
    
    
    
    
    
    
    func refillSettings() {
        //println("ContainerVC.refillSettings")
        
        //change bg for sex selected
        if let sex = SettingsApp.CNF["sex"] as? String {
            bg.image = UIImage(named: "bg-\(sex)")
        }
        
    }
    
    
   
    

    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    @IBAction func unwindToContainerVC(sender: UIStoryboardSegue) {
        //println("unwindToContainerVC")
        refillSettings()
    }
    
    
    // MARK: - Config
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
