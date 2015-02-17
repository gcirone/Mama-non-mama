//
//  FlowerRainbow.swift
//  TestSpriteFlowers
//
//  Created by Cirone, Gianluca on 10/02/15.
//  Copyright (c) 2015 freshdev. All rights reserved.
//

import SpriteKit

class FlowerRainbow: SKNode {

    let atlas = SKTextureAtlas(named: "flower-rainbow")
    
    deinit {
        //println("FlowerRainbow.deinit")
    }
    
    override init(){
        super.init()

        name = "flower"
        
        
        let pistillo = SKSpriteNode(texture: atlas.textureNamed("5_pistillo"))
        pistillo.name = "pistillo"
        pistillo.position = CGPointMake(0.0, 0.0)
        //pistillo.size = CGSizeMake(78.0, 80.0)
        pistillo.zRotation = 0.0
        pistillo.zPosition = 10.0
        addChild(pistillo)
        
        let gambo = SKSpriteNode(texture: atlas.textureNamed("5_gambo"))
        gambo.name = "gambo"
        gambo.position = CGPointMake(0.0, 0.0)
        gambo.anchorPoint = CGPointMake(0.5, 1)
        //gambo = CGSizeMake(22.0, 367.0)
        gambo.zRotation = 0.0
        gambo.zPosition = -1.0
        addChild(gambo)
        
        
        let petalo_0 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_0"))
        petalo_0.name = "petalo"
        petalo_0.position = CGPointMake(-73.3526458740234, -30.1807556152344)
        //petalo_0.size = CGSizeMake(98.0, 30.0)
        petalo_0.zRotation = 0.483552724123001
        petalo_0.zPosition = 3.0
        addChild(petalo_0)
        
        
        let petalo_1 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_1"))
        petalo_1.name = "petalo"
        petalo_1.position = CGPointMake(-75.8443374633789, 6.2181396484375)
        //petalo_1.size = CGSizeMake(99.0, 31.0)
        petalo_1.zRotation = 0.0
        petalo_1.zPosition = 3.0
        addChild(petalo_1)
        
        
        let petalo_2 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_2"))
        petalo_2.name = "petalo"
        petalo_2.position = CGPointMake(-69.0649261474609, 30.3306579589844)
        //petalo_2.size = CGSizeMake(97.0, 29.0)
        petalo_2.zRotation = -0.35145291686058
        petalo_2.zPosition = 2.0
        addChild(petalo_2)
        
        
        let petalo_3 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_3"))
        petalo_3.name = "petalo"
        petalo_3.position = CGPointMake(-47.7362060546875, 56.2152099609375)
        //petalo_3.size = CGSizeMake(29.0, 95.0)
        petalo_3.zRotation = 0.648896634578705
        petalo_3.zPosition = 3.0
        addChild(petalo_3)
        
        
        let petalo_4 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_4"))
        petalo_4.name = "petalo"
        petalo_4.position = CGPointMake(-1.37254333496094, 76.3231811523438)
        //petalo_4.size = CGSizeMake(30.0, 96.0)
        petalo_4.zRotation = 0.0604744032025337
        petalo_4.zPosition = 3.0
        addChild(petalo_4)
        
        
        let petalo_5 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_5"))
        petalo_5.name = "petalo"
        petalo_5.position = CGPointMake(-25.5420379638672, 71.4871826171875)
        //petalo_5.size = CGSizeMake(29.0, 92.0)
        petalo_5.zRotation = 0.249543845653534
        petalo_5.zPosition = 2.0
        addChild(petalo_5)
        
        
        let petalo_6 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_6"))
        petalo_6.name = "petalo"
        petalo_6.position = CGPointMake(-58.0411834716797, 45.7310791015625)
        //petalo_6.size = CGSizeMake(90.0, 34.0)
        petalo_6.zRotation = -0.65658438205719
        petalo_6.zPosition = 1.0
        addChild(petalo_6)
        
        
        let petalo_7 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_7"))
        petalo_7.name = "petalo"
        petalo_7.position = CGPointMake(-49.8720245361328, -57.9573364257812)
        //petalo_7.size = CGSizeMake(28.0, 96.0)
        petalo_7.zRotation = -0.621631443500519
        petalo_7.zPosition = 5.0
        addChild(petalo_7)
        
        
        let petalo_8 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_8"))
        petalo_8.name = "petalo"
        petalo_8.position = CGPointMake(-73.8744659423828, -11.1670227050781)
        //petalo_8.size = CGSizeMake(96.0, 26.0)
        petalo_8.zRotation = 0.110586866736412
        petalo_8.zPosition = 2.0
        addChild(petalo_8)
        
        
        let petalo_9 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_9"))
        petalo_9.name = "petalo"
        petalo_9.position = CGPointMake(-60.8856887817383, -48.7349700927734)
        //petalo_9.size = CGSizeMake(28.0, 97.0)
        petalo_9.zRotation = -0.731421649456024
        petalo_9.zPosition = 2.0
        addChild(petalo_9)
        
        
        let petalo_10 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_10"))
        petalo_10.name = "petalo"
        petalo_10.position = CGPointMake(-30.1141662597656, -73.4540405273438)
        //petalo_10.size = CGSizeMake(29.0, 94.0)
        petalo_10.zRotation = -0.329761922359467
        petalo_10.zPosition = 4.0
        addChild(petalo_10)
        
        
        let petalo_11 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_11"))
        petalo_11.name = "petalo"
        petalo_11.position = CGPointMake(-2.47735595703125, -78.5593566894531)
        //petalo_11.size = CGSizeMake(31.0, 96.0)
        petalo_11.zRotation = 0.0570810660719872
        petalo_11.zPosition = 3.0
        addChild(petalo_11)
        
        
        let petalo_12 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_12"))
        petalo_12.name = "petalo"
        petalo_12.position = CGPointMake(24.7819366455078, -76.9860382080078)
        //petalo_12.size = CGSizeMake(32.0, 97.0)
        petalo_12.zRotation = 0.2876937687397
        petalo_12.zPosition = 2.0
        addChild(petalo_12)
        
        
        let petalo_13 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_13"))
        petalo_13.name = "petalo"
        petalo_13.position = CGPointMake(45.9588317871094, -68.5952453613281)
        //petalo_13.size = CGSizeMake(29.0, 99.0)
        petalo_13.zRotation = 0.628583908081055
        petalo_13.zPosition = 1.0
        addChild(petalo_13)
        
        
        let petalo_14 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_14"))
        petalo_14.name = "petalo"
        petalo_14.position = CGPointMake(76.0393676757812, -30.5138092041016)
        //petalo_14.size = CGSizeMake(94.0, 31.0)
        petalo_14.zRotation = -0.365856379270554
        petalo_14.zPosition = 2.0
        addChild(petalo_14)
        
        
        let petalo_15 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_15"))
        petalo_15.name = "petalo"
        petalo_15.position = CGPointMake(61.9654235839844, -51.4241638183594)
        //petalo_15.size = CGSizeMake(98.0, 31.0)
        petalo_15.zRotation = -0.669111967086792
        petalo_15.zPosition = 0.0
        addChild(petalo_15)
        
        
        let petalo_16 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_16"))
        petalo_16.name = "petalo"
        petalo_16.position = CGPointMake(76.3208312988281, 17.4443969726562)
        //petalo_16.size = CGSizeMake(95.0, 27.0)
        petalo_16.zRotation = 0.23156164586544
        petalo_16.zPosition = 3.0
        addChild(petalo_16)
        
        
        let petalo_17 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_17"))
        petalo_17.name = "petalo"
        petalo_17.position = CGPointMake(74.02685546875, -3.48822021484375)
        //petalo_17.size = CGSizeMake(92.0, 27.0)
        petalo_17.zRotation = 0.0
        petalo_17.zPosition = 1.0
        addChild(petalo_17)
        
        
        let petalo_18 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_18"))
        petalo_18.name = "petalo"
        petalo_18.position = CGPointMake(62.664306640625, 51.2071228027344)
        //petalo_18.size = CGSizeMake(31.0, 99.0)
        petalo_18.zRotation = -0.747934758663177
        petalo_18.zPosition = 3.0
        addChild(petalo_18)
        
        
        let petalo_19 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_19"))
        petalo_19.name = "petalo"
        petalo_19.position = CGPointMake(73.4706115722656, 36.2119445800781)
        //petalo_19.size = CGSizeMake(28.0, 95.0)
        petalo_19.zRotation = -0.943031191825867
        petalo_19.zPosition = 2.0
        addChild(petalo_19)
        
        
        let petalo_20 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_20"))
        petalo_20.name = "petalo"
        petalo_20.position = CGPointMake(32.3933258056641, 69.6167602539062)
        //petalo_20.size = CGSizeMake(31.0, 91.0)
        petalo_20.zRotation = -0.359138071537018
        petalo_20.zPosition = 3.0
        addChild(petalo_20)
        
        
        let petalo_21 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_21"))
        petalo_21.name = "petalo"
        petalo_21.position = CGPointMake(17.885498046875, 75.0881042480469)
        //petalo_21.size = CGSizeMake(27.0, 85.0)
        petalo_21.zRotation = -0.219870626926422
        petalo_21.zPosition = 1.0
        addChild(petalo_21)
        
        
        let petalo_22 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_22"))
        petalo_22.name = "petalo"
        petalo_22.position = CGPointMake(49.2562408447266, 60.7242431640625)
        //petalo_22.size = CGSizeMake(28.0, 96.0)
        petalo_22.zRotation = -0.64398181438446
        petalo_22.zPosition = 1.0
        addChild(petalo_22)
        
        
        // petalo speciale
        let petalo_23 = SKSpriteNode(texture: atlas.textureNamed("5_petalo_17"))
        petalo_23.name = "petalo_mama"
        petalo_23.position = CGPointMake(73.9085083007812, -23.3897399902344)
        //petalo_23.size = CGSizeMake(92.0, 27.0)
        petalo_23.zRotation = -0.199623420834541
        petalo_23.zPosition = 0.0
        addChild(petalo_23)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
