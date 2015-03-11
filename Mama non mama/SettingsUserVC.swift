//
//  SettingsUserVC.swift
//  Mama non mama
//
//  Created by Gianluca, Cirone on 17/12/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit

class SettingsUserVC: UIViewController, UITextFieldDelegate, FBLoginViewDelegate, FBFriendPickerDelegate {
    
    @IBOutlet weak var fbLoginView: FBLoginView!
    //var friendPickerController: FBTaggableFriendPickerViewController!
    var friendPickerController: FBFriendPickerViewController!
    
    @IBOutlet weak var lineArtisticCenterY: NSLayoutConstraint!
    @IBOutlet weak var logoHeight: NSLayoutConstraint!
    @IBOutlet weak var logoBottomSpace: NSLayoutConstraint!
    
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var hearthImage: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var closeSettings: UIButton!
    
    @IBOutlet weak var friendsBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //println("SettingsUserVC")
        
        //fix autolayout
        if SettingsApp.IS_IPHONE4 {
            lineArtisticCenterY.constant = 110
            logoHeight.constant = 50
            logoBottomSpace.constant = -4
        }
        
        //hide close button
        closeSettings.hidden = !SettingsApp.hasLaunchedSettings
        
        //change bg for sex selected
        let sex: String! = SettingsApp.CNF["sex"] as? String
        bg.image = UIImage(named: "bg-\(sex)")
        
        //change color for btn
        let color: String! = SettingsApp.CNF["\(sex)-color"] as? String
        playBtn.setTitleColor(Utility.hexStringToUIColor(color), forState: .Normal)
        
        //personalize slider
        var sliderPin = UIImage(named: "slider-pin-\(sex)")
        slider.setThumbImage(sliderPin, forState: .Normal)
        slider.setThumbImage(sliderPin, forState: .Highlighted)
        slider.setMaximumTrackImage(UIImage(), forState: .Normal)
        slider.setMinimumTrackImage(UIImage(), forState: .Normal)
        
        //refill settings value
        refillSettings()
        
        //facebook init
        initFacebook()
        
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
    
    
    
    // MARK: - Facebook
    
    func initFacebook() {
        fbLoginView.delegate = self
        fbLoginView.readPermissions = ["public_profile", "user_friends", "user_relationships", "user_relationship_details"]
    }
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        //println("User logged in")
        loginBtn.setTitle(NSLocalizedString("Logout", comment:""), forState: .Normal)
        friendsBtn.enabled = true
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        //println("User name: \(user)")
        
        if SettingsApp.CNF["fbid"] == nil {
            let userFbId: String! = user.objectForKey("id") as? String
            SettingsApp.CNF["fbid"] = userFbId
            let userName: String! = user.first_name
            if SettingsApp.CNF["name"] == nil || name.text != userName {
                name.text = userName
            }
            if user.objectForKey("significant_other") != nil {
                let partnerFbId: String! = user.objectForKey("significant_other").objectForKey("id") as? String
                SettingsApp.CNF["fbid-partner"] = partnerFbId
                var partnerName: String! = user.objectForKey("significant_other").objectForKey("name") as? String
                partnerName = partnerName.componentsSeparatedByString(" ")[0]
                if SettingsApp.CNF["surname"] == nil || surname.text != partnerName {
                    surname.text = partnerName
                }
            }
        }
        
        checkPlayBtnEnabled()        
        //FBRequest.requestForMe().startWithCompletionHandler(fbRequestCompletionHandler)
        //FBRequest.requestForMyFriends().startWithCompletionHandler(fbRequestCompletionHandler);
        //FBRequest.requestForGraphPath("/me/friends").startWithCompletionHandler(fbRequestCompletionHandler)
        
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        //println("User logged out")
        loginBtn.setTitle(NSLocalizedString("Login", comment:""), forState: .Normal)
        friendsBtn.enabled = false
        SettingsApp.CNF["fbid"] = nil
    }
    
    func loginView(loginView: FBLoginView!, handleError: NSError!) {
        println("Error \(handleError.localizedDescription)")
    }
    
    func fbRequestCompletionHandler(connection:FBRequestConnection!, result:AnyObject!, error:NSError!){
        if let gotError = error {
            println("Error request: \(error.localizedDescription)")
        }else{
            //println(result)
        }
    }
    
    @IBAction func pickerFriends(sender: UIButton) {
        
        if friendPickerController == nil {
            friendPickerController = FBFriendPickerViewController()
            //friendPickerController = FBTaggableFriendPickerViewController()
            friendPickerController.title = NSLocalizedString("Friends", comment:"")
            friendPickerController.delegate = self
        }
        
        friendPickerController.loadData()
        friendPickerController.clearSelection()
        
        presentViewController(friendPickerController, animated: true, completion: nil)
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .None)
        
    }
    
    func facebookViewControllerDoneWasPressed(sender: AnyObject!) {
        //println("facebookViewControllerDoneWasPressed")
        let friends = friendPickerController.selection as NSArray
        if friends.count > 0 {
            var partnerName: String! = friends[0].objectForKey("first_name") as? String
            if SettingsApp.CNF["surname"] == nil || surname.text != partnerName {
                surname.text = partnerName
            }
        }
        checkPlayBtnEnabled()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func facebookViewControllerCancelWasPressed(sender: AnyObject!) {
        //println("facebookViewControllerCancelWasPressed")
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    
    // MARK: - Navigation
    
    @IBAction func playGame(sender: UIButton) {
        self.performSegueWithIdentifier("SettingsFlower", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(!name.text.isEmpty && !surname.text.isEmpty) {
            SettingsApp.CNF["name"] = name.text
            SettingsApp.CNF["surname"] = surname.text
            SettingsApp.CNF["love-level"] = slider.value
        }
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
