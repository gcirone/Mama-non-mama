//
//  IAPHelper.swift
//  Mama non mama
//
//  Created by freshdev on 10/03/15.
//  Copyright (c) 2015 Gianluca Cirone. All rights reserved.
//

import UIKit
import StoreKit

let IAPHelperPurchaseNotification = "IAPHelperPurchaseNotification"
let IAPHelperRestoreNotification = "IAPHelperRestoreNotification"
let IAPHelperErrorNotification = "IAPHelperErrorNotification"

class IAPHelper: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver  {
    
    private var productsRequest: SKProductsRequest?
    private var completionHandler: ((Bool, NSArray?)->())? = nil
    private let productIdentifiers: NSSet?
    private let purchasedProductIdentifiers: NSMutableSet?
    
    init(productIdentifiers: NSSet) {
        super.init()
        //println("IAPHelper.init")
        
        // Store product identifiers
        self.productIdentifiers = productIdentifiers;
        
        // Check for previously purchased products
        self.purchasedProductIdentifiers = NSMutableSet();
        self.productIdentifiers?.enumerateObjectsUsingBlock({ productIdentifier, stop in
            let productPurchased = NSUserDefaults.standardUserDefaults().boolForKey(productIdentifier as String)
            if productPurchased {
                self.purchasedProductIdentifiers?.addObject(productIdentifier)
                //println("Previously purchased: \(productIdentifier)");
            } else {
                //println("Not purchased: \(productIdentifier)");
            }
        })
        
        // Add self as transaction observer
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        
    }
    
    deinit {
        // Remove self as transaction observer
        SKPaymentQueue.defaultQueue().removeTransactionObserver(self)
        //reset completionHandler
        self.callCompletionHandler(false, products: nil)
    }
    
    func requestProducts(completionHandler:(Bool, NSArray?)->()) {
        
        //init completionHandler for calling
        self.callCompletionHandler(false, products: nil)
        self.completionHandler = completionHandler
        
        //make request for products details
        self.productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers!)
        self.productsRequest?.delegate = self
        self.productsRequest?.start()
        
    }
    
    func productPurchased(productIdentifier: String) -> Bool? {
        return self.purchasedProductIdentifiers?.containsObject(productIdentifier)
    }
    
    func buyProduct(product: SKProduct) {
        //println("Buying \(product.productIdentifier)...")
        
        //add payment in queue
        let payment: SKPayment = SKPayment(product: product)
        SKPaymentQueue.defaultQueue().addPayment(payment)
        
    }
    
    
    // MARK: - SKProductsRequestDelegate
    
    private func callCompletionHandler(success: Bool, products: NSArray?) {
        self.completionHandler?(success, products)
        self.completionHandler = nil
    }
    
    func productsRequest(request: SKProductsRequest!, didReceiveResponse response: SKProductsResponse!) {
        //println("Loaded list of products...")
        
        //reset request
        self.productsRequest = nil
        
        if response.products.count != 0 {
            //products find correctly
            self.callCompletionHandler(true, products: response.products!)
        }
        
        //if response.invalidProductIdentifiers.count != 0 {
        //self.callCompletionHandler(false, products: response.invalidProductIdentifiers)
        //}
    }
    
    func request(request: SKRequest!, didFailWithError error: NSError!) {
        //println("Failed to load list of products. error:\(error.localizedDescription)")
        
        //reset request
        self.productsRequest = nil
        
        //products find error
        self.callCompletionHandler(false, products: nil)
        
    }
    
    
     // MARK: - SKPaymentTransactionObserver
    
    func paymentQueue(queue: SKPaymentQueue!, updatedTransactions transactions: [AnyObject]!) {
        for transaction in transactions as [SKPaymentTransaction] {
            switch transaction.transactionState {
            case SKPaymentTransactionState.Purchased:
                //println("SKPaymentTransactionState.Purchased")
                self.completeTransaction(transaction)
                break
            case SKPaymentTransactionState.Purchasing:
                //println("SKPaymentTransactionState.Purchasing")
                break
            case SKPaymentTransactionState.Restored:
                //println("SKPaymentTransactionState.Restored")
                self.restoreTransaction(transaction)
                break
            case SKPaymentTransactionState.Deferred:
                //println("SKPaymentTransactionState.Deferred")
                break
            case SKPaymentTransactionState.Failed:
                //println("SKPaymentTransactionState.Failed")
                self.failedTransaction(transaction)
                
                break
            }
        }
    }
    
    private func completeTransaction(transaction: SKPaymentTransaction) {
        //println("completeTransaction...");
        self.provideContentForProductIdentifier(transaction.payment.productIdentifier)
        SKPaymentQueue.defaultQueue().finishTransaction(transaction)
    }
    
    private func restoreTransaction(transaction: SKPaymentTransaction) {
        //println("restoreTransaction...");
        self.provideContentForProductIdentifier(transaction.originalTransaction.payment.productIdentifier)
        SKPaymentQueue.defaultQueue().finishTransaction(transaction)
    }
    
    private func failedTransaction(transaction: SKPaymentTransaction) {
        //println("failedTransaction...");
        if transaction.error.code != SKErrorPaymentCancelled {
            //println("Transaction error: %@", transaction.error.localizedDescription)
            NSNotificationCenter.defaultCenter()
                .postNotificationName(IAPHelperErrorNotification, object:transaction.payment.productIdentifier,
                    userInfo:["error":transaction.error.localizedDescription])
        }
        SKPaymentQueue.defaultQueue().finishTransaction(transaction)
    }
    
    func paymentQueue(queue: SKPaymentQueue!, removedTransactions transactions: [AnyObject]!) {
        //println("paymentQueue removedTransactions")
    }
    
    private func provideContentForProductIdentifier(productIdentifier: String) {
        self.purchasedProductIdentifiers?.addObject(productIdentifier)
        NSUserDefaults.standardUserDefaults().setBool(true, forKey:productIdentifier)
        NSUserDefaults.standardUserDefaults().synchronize()
        NSNotificationCenter.defaultCenter().postNotificationName(IAPHelperPurchaseNotification, object:productIdentifier)
    }
    
    func paymentQueue(queue: SKPaymentQueue!, restoreCompletedTransactionsFailedWithError error: NSError!) {
        //println("paymentQueue restoreCompletedTransactionsFailedWithError \(error.localizedDescription)")
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(queue: SKPaymentQueue!) {
        //println("paymentQueue paymentQueueRestoreCompletedTransactionsFinished")
        NSNotificationCenter.defaultCenter().postNotificationName(IAPHelperRestoreNotification, object:nil)
    }
    
    func restoreCompletedTransactions() {
        SKPaymentQueue.defaultQueue().restoreCompletedTransactions()        
    }
    
}
