//
//  SettingsUserVC.swift
//  Mama non mama
//
//  Created by Gianluca, Cirone on 17/12/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit

class SettingsUserVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var hearthImage: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var closeSettings: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //println("SettingsUserVC")
        
        //hide close button
        closeSettings.hidden = !SettingsApp.hasLaunchedSettings
        
        //change bg for sex selected
        let sex: String! = SettingsApp.CNF["sex"] as? String
        bg.image = UIImage(named: "bg-\(sex)")
        
        //change color for btn
        let color: String! = SettingsApp.CNF["\(sex)-color"] as? String
        playBtn.setTitleColor(SettingsApp.hexStringToUIColor(color), forState: .Normal)
        
        //personalize slider
        var sliderPin = UIImage(named: "slider-pin-\(sex)")
        slider.setThumbImage(sliderPin, forState: .Normal)
        slider.setThumbImage(sliderPin, forState: .Highlighted)
        slider.setMaximumTrackImage(UIImage(), forState: .Normal)
        slider.setMinimumTrackImage(UIImage(), forState: .Normal)
        
        //refill settings value
        refillSettings()
        
    }
    
    func refillSettings() {
        //println("SettingsFlowerVC.refillSettings")
        
        if let nameValue  = SettingsApp.CNF["name"] as? String {
            name.text = nameValue
        }
        if let surnameValue  = SettingsApp.CNF["surname"] as? String {
            surname.text = surnameValue
        }
        if let loveValue = SettingsApp.CNF["love-level"] as? Float {
            slider.value = loveValue
            sliderChange(slider)
        }
        
        checkPlayBtnEnabled()
        //println("is iphone5 \(SettingsApp.IS_IPHONE5)")
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        name.resignFirstResponder()
        surname.resignFirstResponder()
        checkPlayBtnEnabled()
        return false
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        checkPlayBtnEnabled()
    }
    
    func checkPlayBtnEnabled() {
        if(!name.text.isEmpty && !surname.text.isEmpty) {
            playBtn.enabled = true
        } else {
            playBtn.enabled = false
        }
    }
    
    @IBAction func sliderChange(sender: UISlider) {
        var imageNamed = "hearth-slider-3"
        switch slider.value {
        case 0...20:
            imageNamed = "hearth-slider-1"
        case 20...40:
            imageNamed = "hearth-slider-2"
        case 40...60:
            imageNamed = "hearth-slider-3"
        case 60...80:
            imageNamed = "hearth-slider-4"
        case 80...100:
            imageNamed = "hearth-slider-5"
        default:
            break
        }
        hearthImage.image = UIImage(named: imageNamed)
    }
    
    @IBAction func playGame(sender: UIButton) {
        SettingsApp.CNF["name"] = name.text
        SettingsApp.CNF["surname"] = surname.text
        SettingsApp.CNF["love-level"] = slider.value
        SettingsApp.hasLaunchedSettings = true
        closeSettings.sendActionsForControlEvents(.TouchUpInside)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    @IBAction func unwindToSettingsUserVC(sender: UIStoryboardSegue) {
        //println("unwindToSettingsUserVC")
    }
    
    
    // MARK: - Config
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
