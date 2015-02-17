//
//  FlowerBlue.swift
//  TestSpriteFlowers
//
//  Created by Cirone, Gianluca on 10/02/15.
//  Copyright (c) 2015 freshdev. All rights reserved.
//

import SpriteKit

class FlowerBlue: SKNode {
    
    let atlas = SKTextureAtlas(named: "flower-blue")
    
    deinit {
        //println("FlowerBlue.deinit")
    }
    
    override init(){
        super.init()
        
        name = "flower"
        
        let pistillo = SKSpriteNode(texture: atlas.textureNamed("32_pistillo"))
        pistillo.name = "pistillo"
        pistillo.position = CGPointMake(0.0, 2.0)
        //pistillo.size = CGSizeMake(90.0, 90.0)
        pistillo.zRotation = 0.0
        pistillo.zPosition = 10.0
        addChild(pistillo)
        
        let gambo = SKSpriteNode(texture: atlas.textureNamed("32_gambo"))
        gambo.name = "gambo"
        gambo.position = CGPointMake(0.0, 0.0)
        gambo.anchorPoint = CGPointMake(0.5, 1)
        //gambo = CGSizeMake(22.0, 367.0)
        gambo.zRotation = 0.0
        gambo.zPosition = -1.0
        addChild(gambo)
        
        
        let petalo_0 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_0"))
        petalo_0.name = "petalo"
        petalo_0.position = CGPointMake(-73.5284118652344, -27.7054443359375)
        //petalo_0.size = CGSizeMake(98.0, 30.0)
        petalo_0.zRotation = 0.475915253162384
        petalo_0.zPosition = 3.0
        addChild(petalo_0)
        
        
        let petalo_1 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_1"))
        petalo_1.name = "petalo"
        petalo_1.position = CGPointMake(-76.6026763916016, 9.24737548828125)
        //petalo_1.size = CGSizeMake(99.0, 31.0)
        petalo_1.zRotation = 0.0
        petalo_1.zPosition = 3.0
        addChild(petalo_1)
        
        
        let petalo_2 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_2"))
        petalo_2.name = "petalo"
        petalo_2.position = CGPointMake(-69.0615005493164, 34.0251770019531)
        //petalo_2.size = CGSizeMake(97.0, 30.0)
        petalo_2.zRotation = -0.337358832359314
        petalo_2.zPosition = 3.0
        addChild(petalo_2)
        
        
        let petalo_3 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_3"))
        petalo_3.name = "petalo"
        petalo_3.position = CGPointMake(-46.8855895996094, 60.8202209472656)
        //petalo_3.size = CGSizeMake(29.0, 95.0)
        petalo_3.zRotation = 0.725671589374542
        petalo_3.zPosition = 3.0
        addChild(petalo_3)
        
        
        let petalo_4 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_4"))
        petalo_4.name = "petalo"
        petalo_4.position = CGPointMake(-2.05783081054688, 75.306396484375)
        //petalo_4.size = CGSizeMake(30.0, 95.0)
        petalo_4.zRotation = 0.0457880944013596
        petalo_4.zPosition = 3.0
        addChild(petalo_4)
        
        
        let petalo_5 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_5"))
        petalo_5.name = "petalo"
        petalo_5.position = CGPointMake(-20.0509643554688, 72.3557434082031)
        //petalo_5.size = CGSizeMake(29.0, 92.0)
        petalo_5.zRotation = 0.41436356306076
        petalo_5.zPosition = 2.0
        addChild(petalo_5)
        
        
        let petalo_6 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_6"))
        petalo_6.name = "petalo"
        petalo_6.position = CGPointMake(-52.387321472168, 47.0257568359375)
        //petalo_6.size = CGSizeMake(90.0, 34.0)
        petalo_6.zRotation = -0.633980870246887
        petalo_6.zPosition = 2.0
        addChild(petalo_6)
        
        
        let petalo_7 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_7"))
        petalo_7.name = "petalo"
        petalo_7.position = CGPointMake(42.2597808837891, -66.1979217529297)
        //petalo_7.size = CGSizeMake(29.0, 99.0)
        petalo_7.zRotation = 0.699464440345764
        petalo_7.zPosition = 3.0
        addChild(petalo_7)
        
        
        let petalo_8 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_8"))
        petalo_8.name = "petalo"
        petalo_8.position = CGPointMake(-48.9504547119141, -56.1749572753906)
        //petalo_8.size = CGSizeMake(28.0, 96.0)
        petalo_8.zRotation = -0.602010011672974
        petalo_8.zPosition = 3.0
        addChild(petalo_8)
        
        
        let petalo_9 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_9"))
        petalo_9.name = "petalo"
        petalo_9.position = CGPointMake(-74.9454727172852, -7.399658203125)
        //petalo_9.size = CGSizeMake(96.0, 26.0)
        petalo_9.zRotation = 0.171103432774544
        petalo_9.zPosition = 2.0
        addChild(petalo_9)
        
        
        let petalo_10 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_10"))
        petalo_10.name = "petalo"
        petalo_10.position = CGPointMake(-56.9035949707031, -47.3875885009766)
        //petalo_10.size = CGSizeMake(28.0, 97.0)
        petalo_10.zRotation = -0.765896201133728
        petalo_10.zPosition = 1.0
        addChild(petalo_10)
        
        
        let petalo_11 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_11"))
        petalo_11.name = "petalo"
        petalo_11.position = CGPointMake(-29.88525390625, -71.3945617675781)
        //petalo_11.size = CGSizeMake(29.0, 93.0)
        petalo_11.zRotation = -0.369606107473373
        petalo_11.zPosition = 2.0
        addChild(petalo_11)
        
        
        let petalo_12 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_12"))
        petalo_12.name = "petalo"
        petalo_12.position = CGPointMake(0.9222412109375, -76.2750091552734)
        //petalo_12.size = CGSizeMake(31.0, 96.0)
        petalo_12.zRotation = 0.034468699246645
        petalo_12.zPosition = 3.0
        addChild(petalo_12)
        
        
        let petalo_13 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_13"))
        petalo_13.name = "petalo"
        petalo_13.position = CGPointMake(26.4885864257812, -73.6501617431641)
        //petalo_13.size = CGSizeMake(33.0, 98.0)
        petalo_13.zRotation = 0.314469844102859
        petalo_13.zPosition = 0.0
        addChild(petalo_13)
        
        
        let petalo_14 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_14"))
        petalo_14.name = "petalo"
        petalo_14.position = CGPointMake(74.718017578125, -26.3442993164062)
        //petalo_14.size = CGSizeMake(95.0, 31.0)
        petalo_14.zRotation = -0.377621203660965
        petalo_14.zPosition = 3.0
        addChild(petalo_14)
        
        
        let petalo_15 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_15"))
        petalo_15.name = "petalo"
        petalo_15.position = CGPointMake(61.9588470458984, -48.2069244384766)
        //petalo_15.size = CGSizeMake(98.0, 31.0)
        petalo_15.zRotation = -0.666276574134827
        petalo_15.zPosition = 2.0
        addChild(petalo_15)
        
        
        let petalo_16 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_16"))
        petalo_16.name = "petalo"
        petalo_16.position = CGPointMake(79.8153076171875, 19.3016357421875)
        //petalo_16.size = CGSizeMake(95.0, 27.0)
        petalo_16.zRotation = 0.245554015040398
        petalo_16.zPosition = 3.0
        addChild(petalo_16)
        
        
        let petalo_17 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_17"))
        petalo_17.name = "petalo"
        petalo_17.position = CGPointMake(79.556396484375, -0.679718017578125)
        //petalo_17.size = CGSizeMake(92.0, 27.0)
        petalo_17.zRotation = -0.0684158876538277
        petalo_17.zPosition = 2.0
        addChild(petalo_17)
        
        
        let petalo_18 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_18"))
        petalo_18.name = "petalo"
        petalo_18.position = CGPointMake(61.5984954833984, 52.1275939941406)
        //petalo_18.size = CGSizeMake(31.0, 101.0)
        petalo_18.zRotation = -0.771599888801575
        petalo_18.zPosition = 3.0
        addChild(petalo_18)
        
        
        let petalo_19 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_19"))
        petalo_19.name = "petalo"
        petalo_19.position = CGPointMake(73.3789825439453, 38.3088073730469)
        //petalo_19.size = CGSizeMake(28.0, 96.0)
        petalo_19.zRotation = -0.978407680988312
        petalo_19.zPosition = 2.0
        addChild(petalo_19)
        
        
        let petalo_20 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_20"))
        petalo_20.name = "petalo"
        petalo_20.position = CGPointMake(31.8847503662109, 70.6903381347656)
        //petalo_20.size = CGSizeMake(31.0, 91.0)
        petalo_20.zRotation = -0.399526327848434
        petalo_20.zPosition = 3.0
        addChild(petalo_20)
        
        
        let petalo_21 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_21"))
        petalo_21.name = "petalo"
        petalo_21.position = CGPointMake(20.503662109375, 73.8622741699219)
        //petalo_21.size = CGSizeMake(27.0, 85.0)
        petalo_21.zRotation = -0.181861639022827
        petalo_21.zPosition = 2.0
        addChild(petalo_21)
        
        
        let petalo_22 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_22"))
        petalo_22.name = "petalo"
        petalo_22.position = CGPointMake(48.4982757568359, 63.3577270507812)
        //petalo_22.size = CGSizeMake(28.0, 96.0)
        petalo_22.zRotation = -0.625138819217682
        petalo_22.zPosition = 2.0
        addChild(petalo_22)
        
        // petalo speciale
        let petalo_23 = SKSpriteNode(texture: atlas.textureNamed("32_petalo_22"))
        petalo_23.name = "petalo_mama"
        petalo_23.position = CGPointMake(66.5204620361328, -38.9328155517578)
        //petalo_23.size = CGSizeMake(28.0, 96.0)
        petalo_23.zRotation = -2.04170322418213
        petalo_23.zPosition = 0.0
        addChild(petalo_23)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
