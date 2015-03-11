//
//  SettingsFlowerVC.swift
//  Mama non mama
//
//  Created by freshdev on 23/11/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit
import StoreKit

class SettingsFlowerVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var flowerScrollCenterY: NSLayoutConstraint!
    @IBOutlet weak var logoHeight: NSLayoutConstraint!
    @IBOutlet weak var logoBottomSpace: NSLayoutConstraint!
    @IBOutlet weak var restoreBtnCenterX: NSLayoutConstraint!
    
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var closeSettings: UIButton!
    @IBOutlet weak var removeBannerBtn: UIButton!
    @IBOutlet weak var restorePurchasesBtn: UIButton!
    
    var flowersProduct: SKProduct!
    var flowers: NSMutableArray?
    var currentIndex = 0
    
    deinit {
        //println("SettingsFlowerVC.deinit")
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //println("SettingsFlowerVC.viewDidDisappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //println("SettingsFlowerVC")
        
        //fix autolayout
        if SettingsApp.IS_IPHONE4 {
            flowerScrollCenterY.constant = 5
            logoHeight.constant = 50
            logoBottomSpace.constant = -6
        }
        
        //hide close button
        closeSettings.hidden = !SettingsApp.hasLaunchedSettings
        
        //change bg for sex selected
        let sex: String! = SettingsApp.CNF["sex"] as? String
        bg.image = UIImage(named: "bg-\(sex)")
        
        //change color for btn
        let color: String! = SettingsApp.CNF["\(sex)-color"] as? String
        nextBtn.setTitleColor(Utility.hexStringToUIColor(color), forState: .Normal)
        
        //manage flower list
        let path: String! = NSBundle.mainBundle().pathForResource("flowers-\(sex)", ofType: "plist")
        flowers = NSMutableArray(contentsOfFile: path)
        flowersLoad()
        //flowers.writeToFile(path: String, atomically: true)
        
        //init flower payment
        initFlowerPayment()
        
        //refill settings value
        refillSettings()
        
        //register to event
        registerToEvents()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //println("SettingsFlowerVC.viewDidAppear")
    }
    
    override func viewDidLayoutSubviews() {
        //fix ios 7 ScrollView issue
        setContentScrollSize()
    }
    
    func registerToEvents() {
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "removeBannerBtn:", name: "bannerPurchased", object: nil)
        
        //purchase notifications
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "purchaseFlowers:", name: IAPHelperPurchaseNotification, object: nil)
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "purchaseFlowersError:", name: IAPHelperErrorNotification, object: nil)
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "purchaseAdRemovalError:", name: IAPHelperErrorNotification, object: nil)
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "restorePurchasesFinished:", name: IAPHelperRestoreNotification, object: nil)

    }
    
    func refillSettings() {
        //println("SettingsFlowerVC.refillSettings")
        
        let flowerIndex: Int! = SettingsApp.CNF["flower-index"] as? Int
        
        if flowerIndex != nil {
            let flowerSelect: NSDictionary! = SettingsApp.CNF["flower-select"] as? NSDictionary
            let active: Bool! = flowerSelect.objectForKey("active") as? Bool
            
            if(active == true && currentIndex != flowerIndex) {
                //println("flowerSelect \(flowerSelect)")
                //println("flowerIndex \(flowerIndex)")
                
                let deselectImage: UIImageView! = scrollView.viewWithTag(200+currentIndex) as? UIImageView
                deselectImage.alpha = 0
                
                let selectImage: UIImageView! = scrollView.viewWithTag(200+flowerIndex) as? UIImageView
                selectImage.alpha = 1
                
                currentIndex = flowerIndex
                pageControl.currentPage = flowerIndex;
                
                var frame = scrollView.frame
                frame.origin.x = frame.size.width * CGFloat(pageControl.currentPage)
                frame.origin.y = 0;
                scrollView.scrollRectToVisible(frame, animated: false)
                
            }
            
        }
        
    }

    
    // MARK: - Banner
    
    func removeBannerBtn(notification:NSNotification?) {
        //println("removeBannerBtn")
        
        //remove banner button
        if MamaIAPHelper.bannerPurchased {
            removeBannerBtn.hidden = true
            removeBannerBtn.userInteractionEnabled = false
            restoreBtnCenterX.constant = 0
            
            if MamaIAPHelper.flowersPurchased {
                restorePurchasesBtn.hidden = true
                restorePurchasesBtn.userInteractionEnabled = false
            }
        }
        
    }
    
    @IBAction func deleteBanner(sender: UIButton) {
        //println("SettingsFlowerVC.deleteBanner")
        NSNotificationCenter.defaultCenter().postNotificationName("removeBannerFromSetting", object:self)
    }
    
    func purchaseAdRemovalError(notification:NSNotification) {
        let productIdentifier: String = notification.object as String;
        if productIdentifier == IdentifierBannerRemove && self.view.superview != nil {
            //println("purchaseAdRemovalError")
            let title = NSLocalizedString("Remove Banner", comment:"")
            let message = NSLocalizedString("The banner payment failed!!! Please try later.", comment:"")
            Utility.alert(title:title, message:message, view:self)
        }
    }
    
    
    
    // MARK: - Flowers Manager
    
    func flowersPayed() {
        //println("active flowers payed")
        
        let numFlower = flowers!.count
        for i in 0..<numFlower {
            let flower: NSMutableDictionary! = flowers!.objectAtIndex(i) as? NSMutableDictionary
            flower.setObject(true, forKey:"active")
            flowers?.replaceObjectAtIndex(i, withObject: flower)
            
            let selectImage: UIImageView! = scrollView.viewWithTag(200+i) as? UIImageView
            selectImage.image = UIImage(named: "check-dot")
            if i != currentIndex {
                selectImage.alpha = 0
            }
        }
      
        //fake tap on flower
        let tmpBtn = UIButton()
        tmpBtn.tag = pageControl.currentPage
        flowerSelect(tmpBtn)
        
    }
    
    func flowersLoad() {
        
        let numFlower = flowers!.count
        let scrollWidth = scrollView.frame.size.width;
        
        for i in 0..<numFlower {
            let flower: NSDictionary! = flowers!.objectAtIndex(i) as? NSDictionary
            let title: String! = flower.objectForKey("title") as? String
            let image: String! = flower.objectForKey("image") as? String
            let active: Bool! = flower.objectForKey("active") as? Bool
            
            let offsetX = scrollWidth * CGFloat(i)
            
            let flowerImage = UIImageView(image: UIImage(named: image))
            flowerImage.frame = CGRectMake(offsetX+22, 0, 270, 243)
            flowerImage.tag = 100+i
            scrollView.addSubview(flowerImage)
            
            let nameImage = (active==true ? "check-dot" : "lock")
            let selectImage = UIImageView(image: UIImage(named: nameImage))
            if i != 0 && active == true {
                selectImage.alpha = 0
            }
            //selectImage.image = UIImage(named: "lock")
            selectImage.frame = CGRectMake(offsetX+242, 206, 33, 33)
            selectImage.contentMode = UIViewContentMode.Center
            selectImage.tag = 200+i
            scrollView.addSubview(selectImage)
            
            let btnHide = UIButton(frame: CGRectMake(offsetX+48, 8, 227, 227))
            btnHide.tag = i
            btnHide.backgroundColor = UIColor.clearColor()
            btnHide.addTarget(self, action: Selector("flowerSelect:"), forControlEvents: .TouchUpInside)
            scrollView.addSubview(btnHide)
            
        }
        
        currentIndex = 0
        
        pageControl.currentPage = 0;
        pageControl.numberOfPages = numFlower;
        
        scrollView.scrollEnabled = true;
        scrollView.contentOffset = CGPointZero
        
        //setContentScrollSize()
        
    }
    
    func setContentScrollSize() {
        //println("setContentScrollSize")
        
        let numFlower = flowers!.count
        let scrollWidth = scrollView.frame.size.width;
        
        scrollView.contentSize = CGSizeMake(
            scrollWidth * CGFloat(numFlower),
            scrollView.frame.size.height
        )
        
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(pageControl.currentPage)
        frame.origin.y = 0;
        scrollView.scrollRectToVisible(frame, animated: false)
        
    }
    
    @IBAction func flowerSelect(sender: UIButton) {
        
        let flower: NSDictionary! = flowers!.objectAtIndex(sender.tag) as? NSDictionary
        let active: Bool! = flower.objectForKey("active") as? Bool
        
        if(active == true && currentIndex != sender.tag) {
            //println("flowerSelect index: \(sender.tag)")
            
            let deselectImage: UIImageView! = scrollView.viewWithTag(200+currentIndex) as? UIImageView
            deselectImage.alpha = 0
            
            let selectImage: UIImageView! = scrollView.viewWithTag(200+sender.tag) as? UIImageView
            //selectImage.alpha = 1
            UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
                selectImage.alpha = 1
            }, completion: nil)
            
            currentIndex = sender.tag
            
        } else if active == false && sender.frame.size != CGSizeZero {
            buyFlowers()
        }
        
    }
    
    @IBAction func pageControlArrow(sender: UIButton) {
        var currentPage = pageControl.currentPage
        if sender.tag == 1 {
            currentPage--
        } else if sender.tag == 2 {
            currentPage++
        }
        if currentPage >= 0 && currentPage < self.pageControl.numberOfPages {
            var frame = scrollView.frame
            frame.origin.x = frame.size.width * CGFloat(currentPage)
            frame.origin.y = 0;
            pageControl.currentPage = currentPage;
            scrollView.scrollRectToVisible(frame, animated: true)
            //fake tap on flower
            let tmpBtn = UIButton()
            tmpBtn.tag = currentPage
            flowerSelect(tmpBtn)
        }
    }
    
    @IBAction func pageControlChange(sender: UIPageControl) {
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0;
        scrollView.scrollRectToVisible(frame, animated: true)
        //fake tap on flower
        let tmpBtn = UIButton()
        tmpBtn.tag = sender.currentPage
        flowerSelect(tmpBtn)
    }
    
    func scrollViewDidEndDecelerating(sender: UIScrollView) {
        let currentPage = Int(sender.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = currentPage;
        //fake tap on flower
        let tmpBtn = UIButton()
        tmpBtn.tag = currentPage
        flowerSelect(tmpBtn)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //println("scrollViewDidScroll \(pageControl.currentPage)")
    }
    
    
    
    // MARK: - Flowers Payment
    
    func initFlowerPayment(){
        //println("initFlowerPayment")
        
        flowersProduct = MamaIAPHelper.sharedInstance.flowersProduct
        removeBannerBtn(nil)
        
        //for test
        //NSUserDefaults.standardUserDefaults().setBool(false, forKey:IdentifierAddFlowers)
        //NSUserDefaults.standardUserDefaults().synchronize()
        
        if MamaIAPHelper.flowersPurchased {
            //println("initFlowerPayment purchased")
            flowersPayed()
        }
        
    }
    
    func buyFlowers () {
        //println("buy flowers \(flowersProduct)")
        if flowersProduct != nil && SKPaymentQueue.canMakePayments() {
            SettingsApp.CNF["audio-stop"] = true
            NSNotificationCenter.defaultCenter().postNotificationName("stopBgMusic", object:self)
            MamaIAPHelper.sharedInstance.buyProduct(flowersProduct)
        }
    }

    func purchaseFlowers(notification:NSNotification) {
        let productIdentifier: String = notification.object as String;
        if productIdentifier == IdentifierAddFlowers {
            //println("purchaseFlowers")
            NSNotificationCenter.defaultCenter().postNotificationName("flowersPurchased", object:self)
            flowersPayed()
            removeBannerBtn(nil)
        }
    }
    
    func purchaseFlowersError(notification:NSNotification){
        let productIdentifier: String = notification.object as String;
        if productIdentifier == IdentifierAddFlowers && self.view.superview != nil {
            //println("purchaseFlowersError")
            let title = NSLocalizedString("Add Flowers", comment:"")
            let message = NSLocalizedString("The flower payment failed!!! Please try later.", comment:"")
            Utility.alert(title:title, message:message, view:self)
        }
    }
    
    @IBAction func restorePurchases(sender: UIButton) {
        //println("restorePurchases")
        SettingsApp.CNF["audio-stop"] = true
        NSNotificationCenter.defaultCenter().postNotificationName("stopBgMusic", object:self)
        MamaIAPHelper.sharedInstance.restoreCompletedTransactions()
    }
    
    func restorePurchasesFinished(notification:NSNotification) {
        let title = NSLocalizedString("Restore purchases", comment:"")
        let message = NSLocalizedString("Restore purchases successful. Thank you.", comment:"")
        Utility.alert(title:title, message:message, view:self)
    }

    
    
    
    
    // MARK: - Navigation
    
    @IBAction func playGame(sender: UIButton) {
        closeSettings.sendActionsForControlEvents(.TouchUpInside)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //println("prepareForSegue flowerSelect index: \(currentIndex)")
        let flower: NSDictionary! = flowers!.objectAtIndex(currentIndex) as? NSDictionary
        SettingsApp.CNF["flower-select"] = flower
        SettingsApp.CNF["flower-index"] = currentIndex
        SettingsApp.hasLaunchedSettings = true
        
    }
    
    @IBAction func unwindToSettingsFlowerVC(sender: UIStoryboardSegue) {
        //println("unwindToSettingsFlowerVC")
    }
    
    
    // MARK: - Config
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
