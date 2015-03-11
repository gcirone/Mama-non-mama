//
//  FlowersGame.swift
//  Mama non mama
//
//  Created by freshdev on 04/02/15.
//  Copyright (c) 2015 Gianluca Cirone. All rights reserved.
//

import SpriteKit


class FlowerGame: SKScene {
    
    let atlasBackgrounds = SKTextureAtlas(named: "flower-backgrounds")
    
    var midX: CGFloat = 0
    var midY: CGFloat = 0
    var bg: String = "bg"
    var mama: Bool = false
    var petalCount: Int! = 0
    var petalCurrent: Int = 0
    
    var dragPetals:[UITouch:SKSpriteNode] = [UITouch:SKSpriteNode]()
    var flower: SKNode?
    var flowerStartPosition: CGPoint = CGPointZero
    var flowerShake:Bool = true
    
    init(size: CGSize, flower flowerClass:SKNode, bgNamed bgName:String) {
        super.init(size: size)
        
        flower = flowerClass
        bg = bgName
        
        //physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        //physicsBody?.categoryBitMask = ColliderType.EdgeFrame.rawValue
        
        physicsWorld.gravity = CGVectorMake(0, -9.8)
        //physicsWorld.contactDelegate = self
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "shakeFlowerDetect:", name: "shakeFlower", object: nil)
        
    }
    
    deinit {
        //println("FlowerGame.deinit")
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        midX = CGRectGetMidX(self.frame)
        midY = CGRectGetMidY(self.frame)
        backgroundColor = SKColor.whiteColor()
        //println("FlowersGame.didMoveToView midx:\(midX) midy:\(midY) size:\(self.frame.size)")
        
        
        //add background image
        let background = SKSpriteNode(texture: atlasBackgrounds.textureNamed(bg))
        background.name = "bg"
        if SettingsApp.IS_IPHONE4 {
            background.size = CGSizeMake(320, 568)
        } else if SettingsApp.IS_IPAD {
             background.size = CGSizeMake(512, 911)
        } else {
            background.size = self.frame.size;
        }
        //bg.anchorPoint = CGPointMake(0, 0)
        background.position = CGPointMake(midX, midY);
        background.zPosition = -10
        addChild(background)
        
        
        //active flower
        flower?.position = CGPointMake(midX, -midY/2);
        addChild(flower!)
        
        //love result
        loveResult()
        
        //init animation
        initAnimation()
        
        
        if !SettingsApp.IS_IPHONE4 {
            //magic aemitter
            let magicEmitterPath = NSBundle.mainBundle().pathForResource("bg-flower-magic", ofType: "sks")
            let magicEmitter: SKEmitterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(magicEmitterPath!) as SKEmitterNode
            magicEmitter.position = CGPointMake(midX, midY)
            magicEmitter.zPosition = -2
            magicEmitter.name = "magicEmitter"
            magicEmitter.particleBirthRate = 20
            //magicEmitter.advanceSimulationTime(10)
            addChild(magicEmitter)
        }
        
        //magic aemitter 2
        /*let magivEmitterPath2 = NSBundle.mainBundle().pathForResource("bg-flower-magic2", ofType: "sks")
        let magicEmitter2: SKEmitterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(magivEmitterPath2!) as SKEmitterNode
        magicEmitter2.position = CGPointMake(midX, midY)
        magicEmitter2.zPosition = -1
        addChild(magicEmitter2)*/
        
    }
    
    func initAnimation() {
        
        var midYOffset: CGFloat = 50;
        if SettingsApp.IS_IPHONE6 || SettingsApp.IS_IPHONE6PLUS  {
            midYOffset = 25
        }
        flowerStartPosition = CGPointMake(midX, midY - midYOffset)
        
        let showFlower = SKAction.moveTo(flowerStartPosition, duration: 2.2, delay:0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0)
        showFlower.timingMode = SKActionTimingMode.EaseInEaseOut;
        
        let delay = SKAction.waitForDuration(0.3);
        flower?.runAction(SKAction.sequence([delay, showFlower, SKAction.runBlock() {
            if let magicEmitter = self.childNodeWithName("magicEmitter") as? SKEmitterNode {
                magicEmitter.particleBirthRate = 220
            }
        }]), withKey:"start")
        
    }
    
    func finishAnimation() {
        
        let showFlower = SKAction.moveTo(CGPointMake(midX, -midY/2), duration: 1.8, delay:0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0)
        showFlower.timingMode = SKActionTimingMode.EaseIn;
        
        let delay = SKAction.waitForDuration(0.2);
        flower?.runAction(SKAction.sequence([delay, showFlower]), withKey:"start")
        
    }
    
    
    func loveResult() {
        
        let randomResult = Int(arc4random_uniform(101))
        let loveValue: Int! = SettingsApp.CNF["love-level"] as? Int
        let valueCheck = randomResult + (((loveValue / 2) - 25) / 2)
        
        //println("randomResult \(randomResult)")
        //println("loveResult check: \(valueCheck) >= 50")
        
        if(valueCheck >= 50) {
            //println("loveResult: mama")
            mama = true
            flower?.childNodeWithName("petalo_mama")?.removeFromParent()
        } else {
            //println("loveResult: non mama")
            mama = false
        }
        
        petalCount = flower?.children.count
        petalCount! -= Int(2)
        
        //println("petalCount: \(petalCount)")
        
    }
    
    func showIntermediateResult() {
        //println("showIntermediateResult")
        petalCurrent++
        
        if petalCurrent % 2 == 0 {
            NSNotificationCenter.defaultCenter()
                .postNotificationName("infoLabelFlower", object:self, userInfo:["love":false])
        } else {
            NSNotificationCenter.defaultCenter()
                .postNotificationName("infoLabelFlower", object:self, userInfo:["love":true])
        }
        
        if petalCurrent >= petalCount {
            finishGame()
        }
    }
    
    func finishGame() {
        //println("gioco finito risultato mama:\(mama)")
        
        if let magicEmitter = childNodeWithName("magicEmitter") as? SKEmitterNode {
            magicEmitter.particleBirthRate = 0
        }
        
        finishAnimation();
        
        NSNotificationCenter.defaultCenter()
            .postNotificationName("resultFlower", object:self, userInfo:["love":mama])
    }

    func shakeFlowerDetect(notification:NSNotification) {
        //println("shake detected")
        
        flower?.enumerateChildNodesWithName("*", usingBlock: { node, stop in
            
            let petal: SKSpriteNode = node as SKSpriteNode
            if node.name?.contains("petalo") == true {
             
                node.physicsBody = SKPhysicsBody(rectangleOfSize: petal.size)
                node.physicsBody?.dynamic = true
                
                let x = CGFloat(arc4random_uniform(41)) - 20.0
                let y = CGFloat(arc4random_uniform(41)) - 20.0
                let myVector = CGVectorMake(x, y)
                node.physicsBody?.applyImpulse(myVector)
                node.physicsBody?.applyAngularImpulse(-x/200)
                
            }
        
        })
        
        runAction(SKAction.sequence([
            SKAction.waitForDuration(0.6),
            SKAction.runBlock() {
                self.finishGame()
            }
        ]))
        
    }
    
    
    
    // MARK: - Petal Drag
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch:AnyObject in touches {
            let location = touch.locationInNode(self)
            let touchObj = touch as UITouch
            
            flower?.childNodeWithName("pistillo")?.zPosition = -10
            if let node:SKSpriteNode = self.nodeAtPoint(location) as? SKSpriteNode {
                if node.name?.contains("petalo") == true {
                    //println("select node: \(node.name!)")
                    
                    node.zPosition = 9
                    flowerShake = true
                    
                    node.physicsBody = SKPhysicsBody(rectangleOfSize: node.size)
                    node.physicsBody?.dynamic = false
                    //node.physicsBody?.affectedByGravity = false
                    
                    node.userData = NSMutableDictionary();
                    dragPetals[touchObj] = node
                    
                }
            }
            flower?.childNodeWithName("pistillo")?.zPosition = 10
            
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        for touch:AnyObject in touches {
            let location = touch.locationInNode(self)
            let previousLocation = touch.previousLocationInNode(self)
            let touchObj = touch as UITouch
            
            if let node:SKSpriteNode = dragPetals[touchObj] {
                let delta = CGPoint(x:location.x - previousLocation.x, y:location.y - previousLocation.y)
                
                //println(flower?.position.distance(flowerStartPosition))
                if flower?.position.distance(flowerStartPosition) > 1.5 {
                    flower?.runAction(SKAction.moveTo(flowerStartPosition, duration: 0.15))
                    flowerShake = false
                    node.zPosition = 100
                } else if flowerShake {
                    flower?.position = CGPoint(x:flower!.position.x + delta.x/8, y:flower!.position.y + delta.y/8)
                }
                
                node.userData?.setValue(NSValue(CGPoint: delta), forKey: "delta");
                node.position = CGPoint(x:node.position.x + delta.x, y:node.position.y + delta.y)
            }
            
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        for touch:AnyObject in touches {
            let location = touch.locationInNode(self)
            let touchObj = touch as UITouch
            
            if let node:SKSpriteNode = dragPetals[touchObj] {
                node.physicsBody?.dynamic = true
                
                if let deltaValue: NSValue = node.userData?.valueForKey("delta") as? NSValue {
                    let delta: CGPoint = deltaValue.CGPointValue()
                    let myVector = CGVectorMake(delta.x, delta.y)
                    node.physicsBody?.applyImpulse(myVector)
                    //node.physicsBody?.applyImpulse(myVector, atPoint:node.position)
                    node.physicsBody?.applyAngularImpulse(-delta.x/4000)
                    //println(delta)
                }
                
                node.zPosition = 100
                node.name = "staccato"
                flower?.runAction(SKAction.moveTo(flowerStartPosition, duration: 0.15))
                showIntermediateResult()
                node.userData = nil;
                dragPetals[touchObj] = nil
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        //println("game loop")
    }
    
}
