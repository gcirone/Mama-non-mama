//
//  ContainerVC.swift
//  Mama non mama
//
//  Created by freshdev on 27/12/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import iAd
import UIKit
import SpriteKit
import StoreKit
import AVFoundation
import AudioToolbox

class ContainerVC: UIViewController, ADBannerViewDelegate {
    
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var partnerName: UILabel!
    @IBOutlet weak var signWoman: UIImageView!
    @IBOutlet weak var signMan: UIImageView!
    @IBOutlet weak var infoFlower: UILabel!
    @IBOutlet weak var soundIcon: UIButton!
    
    @IBOutlet weak var resultFlower: UIView!
    @IBOutlet weak var resultNameFlower: UILabel!
    @IBOutlet weak var resultLoveFlower: UILabel!
    @IBOutlet weak var resultPartnerFlower: UILabel!
    @IBOutlet weak var resultHearthFlower: UIImageView!
    @IBOutlet weak var resultHearthMini1Flower: UIImageView!
    @IBOutlet weak var resultHearthMini2Flower: UIImageView!
    @IBOutlet weak var resultHearthMini3Flower: UIImageView!
    @IBOutlet weak var resultHearthMini4Flower: UIImageView!
    @IBOutlet weak var resultHearthMini5Flower: UIImageView!
    @IBOutlet weak var resultHearthMini6Flower: UIImageView!
    
    @IBOutlet weak var logoSmall: UIImageView!
    @IBOutlet weak var logoSmallHeight: NSLayoutConstraint!
    @IBOutlet weak var logoSmallWidth: NSLayoutConstraint!
    @IBOutlet weak var infoLabelCenterY: NSLayoutConstraint!    
    @IBOutlet weak var bannerBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var bannerHeight: NSLayoutConstraint!
    @IBOutlet weak var adBanner: ADBannerView!
    @IBOutlet weak var buyBannerBtn: UIButton!
    
    @IBOutlet var flowerGameView: SKView!
    var flowerSelect: SKNode?
    
    var backgroundMusicPlayer: AVAudioPlayer!    
    var bannerProduct: SKProduct!
    var flowersProduct: SKProduct!

    class var sharedInstance: ContainerVC {
        struct Static {
            static var instance: ContainerVC?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = ContainerVC()
        }
        
        return Static.instance!
    }
    
    deinit {
        //println("ContainerVC.deinit")
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //println("ContainerVC")
        
        //fix autolayout
        if SettingsApp.IS_IPHONE4 {
            logoSmallHeight.constant = 70
        } else if SettingsApp.IS_IPHONE6 {
            infoLabelCenterY.constant = -155
            logoSmallWidth.constant = 208
            logoSmallHeight.constant = 118
        } else if SettingsApp.IS_IPHONE6PLUS {
            infoLabelCenterY.constant = -155
            logoSmallWidth.constant = 265
            logoSmallHeight.constant = 150
            logoSmall.image = UIImage(named:"logo-big.png")
        } else if SettingsApp.IS_IPAD {
            infoLabelCenterY.constant = -185
            logoSmallWidth.constant = 300
            logoSmallHeight.constant = 170
            logoSmall.image = UIImage(named:"logo-big.png")
            bannerHeight.constant = 66
        }
        
        //request iap products
        MamaIAPHelper.sharedInstance.requestProducts({success, products in
            if success {
                for product in products as [SKProduct] {
                    //println("Found product: \(product.localizedTitle) price:\(product.price.floatValue)")
                    switch product.productIdentifier {
                    case IdentifierBannerRemove:
                         self.bannerProduct = product
                         MamaIAPHelper.sharedInstance.bannerProduct = product
                        break
                    case IdentifierAddFlowers:
                        self.flowersProduct = product
                        MamaIAPHelper.sharedInstance.flowersProduct = product
                        break
                    default:
                        break
                    }
                }
            } else {
                //println("Products not found.")
            }
        })
        
        //init ios ad banner
        initAdBanner()
        
        //refill settings value
        refillSettings()
        
        //active flower game
        activeScene()
        
        //play background music
        setBackgroundMusic("minuetto96.mp3")
        
        //register to events
        registerToEvents()
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //println("ContainerVC.viewDidDisappear")
        removeScene()
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
    
    func registerToEvents() {
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "changeInfoFlowerLabel:", name: "infoLabelFlower", object: nil)
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "finalResultFlower:", name: "resultFlower", object: nil)

        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "playBackgroundMusic:", name: "playBgMusic", object: nil)
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "stopBackgroundMusic:", name: "stopBgMusic", object: nil)
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "removeAdBannerFromSetting:", name: "removeBannerFromSetting", object: nil)
        
        //purchase notifications
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "purchaseAdRemoval:", name: IAPHelperPurchaseNotification, object: nil)
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "purchaseAdRemovalError:", name: IAPHelperErrorNotification, object: nil)
        
    }
    
    func refillSettings() {
        //println("ContainerVC.refillSettings")
        
        //change bg for sex selected
        if let sex = SettingsApp.CNF["sex"] as? String {
            bg.image = UIImage(named: "bg-\(sex)")
            if sex == "man" {
                signMan.hidden = true
                signWoman.hidden = false
            } else if sex == "woman" {
                signWoman.hidden = true
                signMan.hidden = false
            }
        }
        
        if let surnameValue  = SettingsApp.CNF["surname"] as? String {
            partnerName.text = surnameValue
        }
        
    }
    
    func changeInfoFlowerLabel(notification:NSNotification) {
        //println("changeInfoFlowerLabel \(notification.name)")
        
        let userInfo = notification.userInfo as [String:AnyObject]
        let love: Bool! = userInfo["love"] as Bool
        
        infoFlower.font.fontWithSize(30);
        
        let loveReseult: String = (love == true) ? NSLocalizedString("LOVES ME!", comment:"") : NSLocalizedString("LOVES ME NOT!", comment:"")
        if let surnameValue  = SettingsApp.CNF["surname"] as? String {
            infoFlower.text = "\(surnameValue.uppercaseString)\n\(loveReseult)"
        }
        
        infoFlower.alpha = 0
        UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
            self.infoFlower.alpha = 1
        }, completion: nil)
        
    }
    
    func finalResultFlower(notification:NSNotification) {
        //println("finalResultFlower \(notification.name)")
        
        let userInfo = notification.userInfo as [String:AnyObject]
        let love: Bool! = userInfo["love"] as Bool
        
        infoFlower.alpha = 0
        infoFlower.font.fontWithSize(23);
        infoFlower.text = NSLocalizedString("BROWSE THE PETALS AND CHECK OUT IF YOUR PARTNER LOVES YOU", comment:"")
        
        let loveReseult: String = (love == true) ? NSLocalizedString("LOVES", comment:"") : NSLocalizedString("LOVES NOT", comment:"")
        resultLoveFlower.text = loveReseult
        
        if let nameValue  = SettingsApp.CNF["name"] as? String {
            resultPartnerFlower.text = nameValue.uppercaseString
        }
        if let surnameValue  = SettingsApp.CNF["surname"] as? String {
            resultNameFlower.text = surnameValue.uppercaseString
        }
       
        //fade out music
        fadeOutBackgroundMusic()
        
        if love == true {
            if backgroundMusicPlayer.volume != 0 {
                flowerGameView.scene?.runAction(SKAction.playSoundFileNamed("mozart-love.mp3", waitForCompletion:false))
            }
            resultHearthFlower.image = UIImage(named: "hearth-result-love")
        } else {
            if backgroundMusicPlayer.volume != 0 {
                flowerGameView.scene?.runAction(SKAction.playSoundFileNamed("beethoven-not-love.mp3", waitForCompletion:false))
            }
            resultHearthFlower.image = UIImage(named: "hearth-result-not-love")
        }
        resultHearthMini1Flower.image = resultHearthFlower.image
        resultHearthMini2Flower.image = resultHearthFlower.image
        resultHearthMini3Flower.image = resultHearthFlower.image
        resultHearthMini4Flower.image = resultHearthFlower.image
        resultHearthMini5Flower.image = resultHearthFlower.image
        resultHearthMini6Flower.image = resultHearthFlower.image
        
        
        //final animation
        resultFlower.hidden = false
        resultFlower.alpha = 0
        UIView.animateWithDuration(1.4, delay: 0.4, options: .CurveEaseOut, animations: {
            self.resultFlower.alpha = 1
        }, completion:{ finished in
            
            UIView.animateWithDuration(0.8, delay: 3.2, options: .CurveEaseOut, animations: {
                self.resultFlower.alpha = 0
            }, completion: {finished in
                //fade in music
                self.fadeInBackgroundMusic()
                //releoad flower game
                self.removeScene()
                self.loadScene()
            })
        
        })
        
        resultHearthFlower.transform = CGAffineTransformMakeScale(0, 0)
        UIView.animateWithDuration(2.4, delay: 1.2, usingSpringWithDamping:0.3, initialSpringVelocity:0,
            options: .CurveEaseInOut, animations: {
            self.resultHearthFlower.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: { finished in
        })
        
        resultHearthMini1Flower.alpha = 0
        UIView.animateWithDuration(0.6, delay: 0.4, options: .CurveEaseInOut, animations: {
            self.resultHearthMini1Flower.alpha = 1
        }, completion: nil)
        resultHearthMini2Flower.alpha = 0
        UIView.animateWithDuration(0.6, delay: 0.6, options: .CurveEaseInOut, animations: {
            self.resultHearthMini2Flower.alpha = 1
        }, completion: nil)
        resultHearthMini3Flower.alpha = 0
        UIView.animateWithDuration(0.6, delay: 0.8, options: .CurveEaseInOut, animations: {
            self.resultHearthMini3Flower.alpha = 1
        }, completion: nil)
        resultHearthMini4Flower.alpha = 0
        UIView.animateWithDuration(0.6, delay: 1.0, options: .CurveEaseInOut, animations: {
            self.resultHearthMini4Flower.alpha = 1
        }, completion: nil)
        resultHearthMini5Flower.alpha = 0
        UIView.animateWithDuration(0.6, delay: 1.2, options: .CurveEaseInOut, animations: {
            self.resultHearthMini5Flower.alpha = 1
        }, completion: nil)
        resultHearthMini6Flower.alpha = 0
        UIView.animateWithDuration(0.6, delay: 1.4, options: .CurveEaseInOut, animations: {
            self.resultHearthMini6Flower.alpha = 1
        }, completion: nil)

        /*
        let imageNames: [String] = ["image1.png","image2.png"]
        var images: [UIImage] = []
        for image in imageNames {
            images.append(UIImage(named: image)!)
        }
        let animationImageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        animationImageView.animationImages = images;
        animationImageView.animationDuration = 0.5;
        
        view.addSubview(animationImageView)
        animationImageView.startAnimating()
        */
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == .MotionShake {
            NSNotificationCenter.defaultCenter().postNotificationName("shakeFlower", object:self)
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    
    
    // MARK: - Background Music
    
    func setBackgroundMusic(filename: String) {
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        if (url == nil) {
            //println("Could not find file: \(filename)")
            return
        }
        var error: NSError? = nil
        backgroundMusicPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        if backgroundMusicPlayer == nil {
            //println("Could not create audio player: \(error!)")
            return
        }
        backgroundMusicPlayer.numberOfLoops = -1
        SettingsApp.CNF["audio-stop"] = nil
        playBackgroundMusic(nil)
    }
    
    func playBackgroundMusic(notification:NSNotification?) {
        //println("playBackgroundMusic")
        if SettingsApp.CNF["audio-stop"] == nil {
            soundIcon.setImage(UIImage(named: "sound-ico"), forState: .Normal)
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
            backgroundMusicPlayer.volume = 1
        }
    }
    
    func stopBackgroundMusic(notification:NSNotification?) {
        //println("stopBackgroundMusic \(backgroundMusicPlayer)")
        soundIcon.setImage(UIImage(named: "sound-ico-off"), forState: .Normal)
        backgroundMusicPlayer.stop()
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.volume = 0
    }
    
    func fadeInBackgroundMusic() {
        let fader = iiFaderForAvAudioPlayer(player: backgroundMusicPlayer)
        if backgroundMusicPlayer.volume != 0 {
            fader.fade(fromVolume: 0.1, toVolume: 1, duration: 1, velocity: 0.5)
        }
    }
    
    func fadeOutBackgroundMusic() {
        let fader = iiFaderForAvAudioPlayer(player: backgroundMusicPlayer)
        if backgroundMusicPlayer.volume != 0 {
            fader.fade(fromVolume: 1, toVolume: 0.1, duration: 1, velocity: 0.5)
        }
    }
    
    @IBAction func toggleBackgroundMusic(sender: AnyObject) {
        let fader = iiFaderForAvAudioPlayer(player: backgroundMusicPlayer)
        if backgroundMusicPlayer.volume == 1 {
            soundIcon.setImage(UIImage(named: "sound-ico-off"), forState: .Normal)
            fader.fade(fromVolume: 1, toVolume: 0, duration: 1, velocity: 0.5, onFinished:{finish in
                self.backgroundMusicPlayer.stop()
                self.backgroundMusicPlayer.prepareToPlay()
            })
            SettingsApp.CNF["audio-stop"] = true
        } else if backgroundMusicPlayer.volume == 0 {
            soundIcon.setImage(UIImage(named: "sound-ico"), forState: .Normal)
            backgroundMusicPlayer.play()
            fader.fade(fromVolume: 0, toVolume: 1, duration: 1, velocity: 0.5)
            SettingsApp.CNF["audio-stop"] = nil
        }
    }
    
    
    // MARK: - Flower Game
    
    func activeScene(){
        //println("ContainerVC.activeScene")
        flowerGameView.showsFPS = false
        flowerGameView.showsNodeCount = false
        flowerGameView.ignoresSiblingOrder = true
        //flowerGameView.showsPhysics = true
        
        //flowerGameView.opaque = false
        //flowerGameView.clearsContextBeforeDrawing = true
        //flowerGameView.backgroundColor = SKColor.clearColor()
        //flowerGameView.allowsTransparency = true
        
        loadScene()
    }
    
    func removeScene() {
        //println("ContainerVC.removeScene")
        
        infoFlower.hidden = true
        infoFlower.text = NSLocalizedString("BROWSE THE PETALS AND CHECK OUT IF YOUR PARTNER LOVES YOU", comment:"")
        flowerGameView.hidden = true
        
        //discard old scene
        flowerSelect?.removeAllChildren()
        flowerSelect = nil
        flowerGameView.presentScene(nil)
    }
    
    func loadScene() {
        //println("ContainerVC.loadScene")
        
        if let flowerIndex = SettingsApp.CNF["flower-index"] as? Int {
            //println("flowerIndex \(flowerIndex)")
            //println(SettingsApp.CNF["flower-select"])
           
            var sceneSize: CGSize = self.view.bounds.size
            if SettingsApp.IS_IPAD {
                //sceneSize = CGSizeMake(768/1.5, 1024/1.5)
                sceneSize = CGSizeMake(512, 682)
            }
            let sex: String! = SettingsApp.CNF["sex"] as? String
            let bgName = "bg-\(sex)"
            
            switch flowerIndex {
            case 0: flowerSelect = FlowerStandard()
                break
            case 1: flowerSelect = FlowerYellow()
                break
            case 2:
                if sex == "woman" {
                    flowerSelect = FlowerPink()
                } else if sex == "man" {
                    flowerSelect = FlowerBlue()
                }
                break
            case 3: flowerSelect = FlowerRed()
                break
            case 4: flowerSelect = FlowerRainbow()
                break
            default:
                break
            }
            
            let flowerGame: FlowerGame = FlowerGame(size:sceneSize, flower:flowerSelect!, bgNamed:bgName)
            flowerGame.scaleMode = SKSceneScaleMode.AspectFill
            flowerGameView.presentScene(flowerGame)
            
            flowerGame.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.4),
                SKAction.runBlock() {
                    self.flowerGameView.hidden = false
                    
                    self.infoFlower.hidden = false
                    self.infoFlower.alpha = 0
                    UIView.animateWithDuration(1.2, delay: 0.8, options: .CurveEaseOut, animations: {
                        self.infoFlower.alpha = 1
                    }, completion: nil)
                    
                }
            ]))
            
        }
        
    }
    
    
    // MARK: - Banner
    
    func initAdBanner() {
        //println("initAdBanner")
        
        adBanner.delegate = self
        adBanner.hidden = true
        buyBannerBtn.hidden = true
        bannerBottomConstraint.constant = SettingsApp.IS_IPAD ? -66 : -50
     
        //for test
        //NSUserDefaults.standardUserDefaults().setBool(false, forKey:IdentifierBannerRemove)
        //NSUserDefaults.standardUserDefaults().synchronize()
        
        if MamaIAPHelper.bannerPurchased {
            //println("initAdBanner purchased")
            adBanner.hidden = true
            adBanner.userInteractionEnabled = false
            buyBannerBtn.hidden = true
            buyBannerBtn.userInteractionEnabled = false
            bannerBottomConstraint.constant = SettingsApp.IS_IPAD ? -66 : -50
        }
        
    }
    
    @IBAction func removeBanner(sender: UIButton) {
        removeAdBanner()
    }
    
    func removeAdBannerFromSetting(notification:NSNotification) {
        removeAdBanner()
    }
    
    func removeAdBanner() {
        //println("removeAdBanner \(bannerProduct)")
        
        if bannerProduct != nil && SKPaymentQueue.canMakePayments() {
            SettingsApp.CNF["audio-stop"] = true
            stopBackgroundMusic(nil)
            MamaIAPHelper.sharedInstance.buyProduct(bannerProduct)
        }
        
    }
    
    func purchaseAdRemoval(notification:NSNotification) {
        let productIdentifier: String = notification.object as String;
        if productIdentifier == IdentifierBannerRemove {
            
            //println("purchaseAdRemoval")
            NSNotificationCenter.defaultCenter().postNotificationName("bannerPurchased", object:self)
            
            if adBanner != nil {
                adBanner.hidden = true
                adBanner.userInteractionEnabled = false
                buyBannerBtn.hidden = true
                buyBannerBtn.userInteractionEnabled = false
                
                bannerBottomConstraint.constant = SettingsApp.IS_IPAD ? -66 : -50
                UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
            
        }
    }
    
    func purchaseAdRemovalError(notification:NSNotification) {
        let productIdentifier: String = notification.object as String;
        if productIdentifier == IdentifierBannerRemove && self.view.superview != nil{
            //println("purchaseAdRemovalError")
            let title = NSLocalizedString("Remove Banner", comment:"")
            let message = NSLocalizedString("The banner payment failed!!! Please try later.", comment:"")
            Utility.alert(title:title, message:message, view:self)
            
        }
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        //println("Errore banner \(error)")
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        //println("bannerViewDidLoadAd")
        
        if !MamaIAPHelper.bannerPurchased {
            
            adBanner.hidden = false
            buyBannerBtn.hidden = false
            
            bannerBottomConstraint.constant = 0
            UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
        }
        
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        //println("bannerViewWillLoadAd")
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        //println("bannerViewActionShouldBegin \(willLeave)")
        return true
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        //println("bannerViewActionDidFinish")
        removeScene()
        loadScene()
    }
    

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //println("prepareForSegue")
    }
    
    @IBAction func unwindToContainerVC(sender: UIStoryboardSegue) {
        //println("unwindToContainerVC")
        refillSettings()
        loadScene()
    }
    
    
    // MARK: - Config
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
