//
//  FlowerRed.swift
//  TestSpriteFlowers
//
//  Created by Cirone, Gianluca on 10/02/15.
//  Copyright (c) 2015 freshdev. All rights reserved.
//

import SpriteKit

class FlowerRed: SKNode {

    let atlas = SKTextureAtlas(named: "flower-red")
    
    deinit {
        //println("FlowerRed.deinit")
    }
    
    override init(){
        super.init()
        
        name = "flower"
        
        let pistillo = SKSpriteNode(texture: atlas.textureNamed("4_pistillo"))
        pistillo.name = "pistillo"
        pistillo.position = CGPointMake(0.0, 0.0)
        //pistillo.size = CGSizeMake(78.0, 80.0)
        pistillo.zRotation = 0.0
        pistillo.zPosition = 10.0
        addChild(pistillo)
        
        let gambo = SKSpriteNode(texture: atlas.textureNamed("4_gambo"))
        gambo.name = "gambo"
        gambo.position = CGPointMake(0.0, 0.0)
        gambo.anchorPoint = CGPointMake(0.5, 1)
        //gambo = CGSizeMake(22.0, 367.0)
        gambo.zRotation = 0.0
        gambo.zPosition = -1.0
        addChild(gambo)
        
        
        let petalo_0 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_0"))
        petalo_0.name = "petalo"
        petalo_0.position = CGPointMake(81.1979370117188, 35.39990234375)
        //petalo_0.size = CGSizeMake(110.0, 27.0)
        petalo_0.zRotation = 0.269893795251846
        petalo_0.zPosition = 4.0
        addChild(petalo_0)
        
        
        let petalo_1 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_1"))
        petalo_1.name = "petalo"
        petalo_1.position = CGPointMake(77.4362945556641, 13.472900390625)
        //petalo_1.size = CGSizeMake(94.0, 32.0)
        petalo_1.zRotation = 0.138331964612007
        petalo_1.zPosition = 3.0
        addChild(petalo_1)
        
        
        let petalo_2 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_2"))
        petalo_2.name = "petalo"
        petalo_2.position = CGPointMake(26.3327941894531, -69.3390808105469)
        //petalo_2.size = CGSizeMake(31.0, 116.0)
        petalo_2.zRotation = 0.318195641040802
        petalo_2.zPosition = 4.0
        addChild(petalo_2)
        
        
        let petalo_3 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_3"))
        petalo_3.name = "petalo"
        petalo_3.position = CGPointMake(54.7777099609375, -52.571533203125)
        //petalo_3.size = CGSizeMake(102.0, 37.0)
        petalo_3.zRotation = -0.552999556064606
        petalo_3.zPosition = 3.0
        addChild(petalo_3)
        
        
        let petalo_4 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_4"))
        petalo_4.name = "petalo"
        petalo_4.position = CGPointMake(-25.4598999023438, -65.2302551269531)
        //petalo_4.size = CGSizeMake(38.0, 88.0)
        petalo_4.zRotation = -0.197961166501045
        petalo_4.zPosition = 3.0
        addChild(petalo_4)
        
        
        // petalo speciale
        let petalo_5 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_5"))
        petalo_5.name = "petalo_mama"
        petalo_5.position = CGPointMake(-49.3601684570312, -41.4192657470703)
        //petalo_5.size = CGSizeMake(35.0, 80.0)
        petalo_5.zRotation = -0.785169422626495
        petalo_5.zPosition = 3.0
        addChild(petalo_5)
        
        
        let petalo_6 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_6"))
        petalo_6.name = "petalo"
        petalo_6.position = CGPointMake(-70.529541015625, 22.896728515625)
        //petalo_6.size = CGSizeMake(95.0, 35.0)
        petalo_6.zRotation = -0.288226246833801
        petalo_6.zPosition = 4.0
        addChild(petalo_6)
        
        
        let petalo_7 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_7"))
        petalo_7.name = "petalo"
        petalo_7.position = CGPointMake(-61.7948150634766, 49.0580139160156)
        //petalo_7.size = CGSizeMake(30.0, 120.0)
        petalo_7.zRotation = 0.817495584487915
        petalo_7.zPosition = 3.0
        addChild(petalo_7)
        
        
        let petalo_8 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_8"))
        petalo_8.name = "petalo"
        petalo_8.position = CGPointMake(-4.78941345214844, 79.9446105957031)
        //petalo_8.size = CGSizeMake(36.0, 115.0)
        petalo_8.zRotation = 0.179463669657707
        petalo_8.zPosition = 4.0
        addChild(petalo_8)
        
        
        let petalo_9 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_9"))
        petalo_9.name = "petalo"
        petalo_9.position = CGPointMake(-31.3221740722656, 72.0521850585938)
        //petalo_9.size = CGSizeMake(29.0, 111.0)
        petalo_9.zRotation = 0.402074337005615
        petalo_9.zPosition = 3.0
        addChild(petalo_9)
        
        
        let petalo_10 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_10"))
        petalo_10.name = "petalo"
        petalo_10.position = CGPointMake(-50.577392578125, 66.6146240234375)
        //petalo_10.size = CGSizeMake(40.0, 101.0)
        petalo_10.zRotation = 0.602693915367126
        petalo_10.zPosition = 2.0
        addChild(petalo_10)
        
        
        let petalo_11 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_11"))
        petalo_11.name = "petalo"
        petalo_11.position = CGPointMake(-69.0982360839844, 38.8223876953125)
        //petalo_11.size = CGSizeMake(110.0, 36.0)
        petalo_11.zRotation = -0.514161705970764
        petalo_11.zPosition = 2.0
        addChild(petalo_11)
        
        
        let petalo_12 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_12"))
        petalo_12.name = "petalo"
        petalo_12.position = CGPointMake(-82.1622161865234, 4.03298950195312)
        //petalo_12.size = CGSizeMake(120.0, 30.0)
        petalo_12.zRotation = -0.211682394146919
        petalo_12.zPosition = 3.0
        addChild(petalo_12)
        
        
        let petalo_13 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_13"))
        petalo_13.name = "petalo"
        petalo_13.position = CGPointMake(-76.7235488891602, -4.43142700195312)
        //petalo_13.size = CGSizeMake(118.0, 34.0)
        petalo_13.zRotation = 0.0370636768639088
        petalo_13.zPosition = 2.0
        addChild(petalo_13)
        
        
        let petalo_14 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_14"))
        petalo_14.name = "petalo"
        petalo_14.position = CGPointMake(-73.7006530761719, -29.4468383789062)
        //petalo_14.size = CGSizeMake(94.0, 35.0)
        petalo_14.zRotation = 0.315946936607361
        petalo_14.zPosition = 1.0
        addChild(petalo_14)
        
        
        let petalo_15 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_15"))
        petalo_15.name = "petalo"
        petalo_15.position = CGPointMake(-57.4105834960938, -42.1120300292969)
        //petalo_15.size = CGSizeMake(111.0, 29.0)
        petalo_15.zRotation = 0.596617460250854
        petalo_15.zPosition = 0.0
        addChild(petalo_15)
        
        
        let petalo_16 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_16"))
        petalo_16.name = "petalo"
        petalo_16.position = CGPointMake(-41.2336654663086, -66.1031646728516)
        //petalo_16.size = CGSizeMake(37.0, 100.0)
        petalo_16.zRotation = -0.575095236301422
        petalo_16.zPosition = 0.0
        addChild(petalo_16)
        
        
        let petalo_17 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_17"))
        petalo_17.name = "petalo"
        petalo_17.position = CGPointMake(-2.17597961425781, -80.2497100830078)
        //petalo_17.size = CGSizeMake(28.0, 109.0)
        petalo_17.zRotation = -0.136029228568077
        petalo_17.zPosition = 1.0
        addChild(petalo_17)
        
        
        let petalo_18 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_18"))
        petalo_18.name = "petalo"
        petalo_18.position = CGPointMake(4.01425170898438, -71.0759887695312)
        //petalo_18.size = CGSizeMake(36.0, 94.0)
        petalo_18.zRotation = 0.224350497126579
        petalo_18.zPosition = 0.0
        addChild(petalo_18)
        
        
        let petalo_19 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_19"))
        petalo_19.name = "petalo"
        petalo_19.position = CGPointMake(43.2335815429688, -70.5019989013672)
        //petalo_19.size = CGSizeMake(33.0, 101.0)
        petalo_19.zRotation = 0.60594516992569
        petalo_19.zPosition = 0.0
        addChild(petalo_19)
        
        
        let petalo_20 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_20"))
        petalo_20.name = "petalo"
        petalo_20.position = CGPointMake(68.9424133300781, -30.0557403564453)
        //petalo_20.size = CGSizeMake(109.0, 27.0)
        petalo_20.zRotation = -0.338040173053741
        petalo_20.zPosition = 1.0
        addChild(petalo_20)
        
        
        let petalo_21 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_21"))
        petalo_21.name = "petalo"
        petalo_21.position = CGPointMake(73.7137451171875, -12.937255859375)
        //petalo_21.size = CGSizeMake(97.0, 33.0)
        petalo_21.zRotation = -0.165567055344582
        petalo_21.zPosition = 0.0
        addChild(petalo_21)
        
        
        let petalo_22 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_22"))
        petalo_22.name = "petalo"
        petalo_22.position = CGPointMake(52.7928161621094, 63.7150573730469)
        //petalo_22.size = CGSizeMake(110.0, 28.0)
        petalo_22.zRotation = 0.788084626197815
        petalo_22.zPosition = 3.0
        addChild(petalo_22)
        
        
        let petalo_23 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_23"))
        petalo_23.name = "petalo"
        petalo_23.position = CGPointMake(21.6350250244141, 80.9565124511719)
        //petalo_23.size = CGSizeMake(31.0, 114.0)
        petalo_23.zRotation = -0.298696994781494
        petalo_23.zPosition = 3.0
        addChild(petalo_23)
        
        
        let petalo_24 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_24"))
        petalo_24.name = "petalo"
        petalo_24.position = CGPointMake(58.3367156982422, 44.7029418945312)
        //petalo_24.size = CGSizeMake(88.0, 35.0)
        petalo_24.zRotation = 0.711954414844513
        petalo_24.zPosition = 2.0
        addChild(petalo_24)
        
        
        let petalo_25 = SKSpriteNode(texture: atlas.textureNamed("4_petalo_25"))
        petalo_25.name = "petalo"
        petalo_25.position = CGPointMake(36.0850524902344, 65.1448059082031)
        //petalo_25.size = CGSizeMake(35.0, 96.0)
        petalo_25.zRotation = -0.48075345158577
        petalo_25.zPosition = 2.0
        addChild(petalo_25)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
