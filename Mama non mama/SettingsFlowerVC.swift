//
//  SettingsFlowerVC.swift
//  Mama non mama
//
//  Created by freshdev on 23/11/14.
//  Copyright (c) 2014 Gianluca Cirone. All rights reserved.
//

import UIKit

class SettingsFlowerVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var closeSettings: UIButton!
    
    var flowers: NSMutableArray?
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //println("SettingsFlowerVC")
        
        //hide close button
        closeSettings.hidden = !SettingsApp.hasLaunchedSettings
        
        //change bg for sex selected
        let sex: String! = SettingsApp.CNF["sex"] as? String
        bg.image = UIImage(named: "bg-\(sex)")
        
        //change color for btn
        let color: String! = SettingsApp.CNF["\(sex)-color"] as? String
        nextBtn.setTitleColor(SettingsApp.hexStringToUIColor(color), forState: .Normal)
        
        //manage flower list
        let path: String! = NSBundle.mainBundle().pathForResource("flowers-\(sex)", ofType: "plist")
        flowers = NSMutableArray(contentsOfFile: path)
        flowersPayed()
        flowersLoad()
        //flowers.writeToFile(path: String, atomically: true)
        
        //refill settings value
        refillSettings()
        
        
    }    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //println("SettingsFlowerVC.viewDidAppear")
    }
    
    override func viewDidLayoutSubviews() {
        //fix ios 7 ScrollView issue
        setContentScrollSize()
    }
    
    
    
    
    @IBAction func deleteBanner(sender: UIButton) {
        println("SettingsFlowerVC.deleteBanner")
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
    
    
    
    
    // MARK: - Flowers Manager
    
    func buyFlowers () {
        //println("buy flowers")
        
    }
    
    func flowersPayed () {
        //println("active flowers payed")
        
        /*
        let numFlower = flowers!.count
        for i in 0..<numFlower {
        let selectImage: UIImageView! = scrollView.viewWithTag(200+i) as? UIImageView
        selectImage.alpha = 0
        }
        */
        
    }
    
    func flowersLoad () {
        
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
            
            let btnHide = UIButton(frame: CGRectMake(offsetX+80, 52, 160, 140))
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
            UIView.animateWithDuration(0.5, delay: 0.1, options: .CurveEaseOut, animations: {
                selectImage.alpha = 1
            }, completion: nil)
            
            currentIndex = sender.tag
            
        } else if active == false {
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
        }
    }
    
    @IBAction func pageControlChange(sender: UIPageControl) {
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0;
        scrollView.scrollRectToVisible(frame, animated: true)
    }
    
    func scrollViewDidEndDecelerating(sender: UIScrollView) {
        let currentPage = Int(sender.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = currentPage;
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
    
    
    
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //println("prepareForSegue flowerSelect index: \(currentIndex)")
        let flower: NSDictionary! = flowers!.objectAtIndex(currentIndex) as? NSDictionary
        SettingsApp.CNF["flower-select"] = flower
        SettingsApp.CNF["flower-index"] = currentIndex
        
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
