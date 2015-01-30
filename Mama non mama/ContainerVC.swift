//
//  ContainerVC.swift
//  Mama non mama
//
//  Created by freshdev on 27/12/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import StoreKit
import UIKit
import iAd


class ContainerVC: UIViewController, ADBannerViewDelegate, SKPaymentTransactionObserver, SKProductsRequestDelegate {

    @IBOutlet weak var adBanner: ADBannerView!
    @IBOutlet weak var buyBannerBtn: UIButton!
    
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var settingsBtn: UIButton!
    
    var bannerProduct: SKProduct!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("ContainerVC")
        //println("height \(UIScreen.mainScreen().bounds.size.height)")
        
        
        adBanner.hidden = true
        adBanner.delegate = self
        buyBannerBtn.hidden = false
        
        
        if SettingsApp.CNF["ads"] == nil {
            SKPaymentQueue.defaultQueue().addTransactionObserver(self)
            getProductInfo()
        }
        
        
        if SettingsApp.CNF["ads"] != nil {
            
            if let status = SettingsApp.CNF["ads"] as? String {
                
                if status == "purchased" {
                    
                    adBanner.removeFromSuperview()
                    buyBannerBtn.hidden = true
                    buyBannerBtn.userInteractionEnabled = false
                    
                } else {
                    
                    SKPaymentQueue.defaultQueue().addTransactionObserver(self)
                    getProductInfo()
                    
                }
                
            }
            
            
        }
        
        
        
        
        
        
        
        
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
    
    
    
    
    
    func productsRequest(request: SKProductsRequest!, didReceiveResponse response: SKProductsResponse!) {
        let products = response.products
        if(products.count != 0){
            bannerProduct = products[0] as SKProduct
        }
        buyBannerBtn.hidden = false
    }
    
    func getProductInfo() {
        if(SKPaymentQueue.canMakePayments()){
            let productID:NSSet = NSSet(object: "com.flashdevit.adremoval")
            let request:SKProductsRequest = SKProductsRequest(productIdentifiers: productID)
            request.delegate = self
            request.start()
        }
    }
    
    func storePurchase(){
        println("storePurchase")
        
        SettingsApp.CNF["ads"] = "purchased"
        adBanner.removeFromSuperview()
        buyBannerBtn.hidden = true
        buyBannerBtn.userInteractionEnabled = false
        
    }
    
    func paymentQueue(queue: SKPaymentQueue!, updatedTransactions transactions: [AnyObject]!) {
        
        for transaction:AnyObject in transactions {
            
            if let trans:SKPaymentTransaction = transaction as? SKPaymentTransaction {
                
                switch trans.transactionState {
                case .Purchased:
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as SKPaymentTransaction)
                    storePurchase()
                    break
                case .Failed:
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as SKPaymentTransaction)
                    break
                case .Restored:
                    SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
                    break
                default:
                    break
                }
                
            }
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Banner
    
    @IBAction func removeBanner(sender: UIButton) {
        println("removeBanner")
        
        let payment: SKPayment = SKPayment(product: bannerProduct)
        SKPaymentQueue.defaultQueue().addPayment(payment)
        
        
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        println("Errore banner \(error)")
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        println("bannerViewDidLoadAd")
        adBanner.hidden = false
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        //chiamata prima di ogni banner
        println("bannerViewWillLoadAd")
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        //chiamata quando si clicca sul banner
        println("bannerViewActionShouldBegin \(willLeave)")
        return true
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        //chiamata quando si chiude il banner
        println("bannerViewActionDidFinish")
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
