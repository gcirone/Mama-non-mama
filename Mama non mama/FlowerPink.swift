//
//  FlowerPink.swift
//  TestSpriteFlowers
//
//  Created by Cirone, Gianluca on 10/02/15.
//  Copyright (c) 2015 freshdev. All rights reserved.
//

import SpriteKit

class FlowerPink: SKNode {
    
    let atlas = SKTextureAtlas(named: "flower-pink")
    
    deinit {
        //println("FlowerPink.deinit")
    }
    
    override init(){
        super.init()

        name = "flower"
        
        
        let pistillo = SKSpriteNode(texture: atlas.textureNamed("31_pistillo"))
        pistillo.name = "pistillo"
        pistillo.position = CGPointMake(0.0, 0.0)
        //pistillo.size = CGSizeMake(90.0, 90.0)
        pistillo.zRotation = 0.0
        pistillo.zPosition = 10.0
        addChild(pistillo)
        
        let gambo = SKSpriteNode(texture: atlas.textureNamed("31_gambo"))
        gambo.name = "gambo"
        gambo.position = CGPointMake(0.0, 0.0)
        gambo.anchorPoint = CGPointMake(0.5, 1)
        //gambo = CGSizeMake(22.0, 367.0)
        gambo.zRotation = 0.0
        gambo.zPosition = -1.0
        addChild(gambo)
        
        
        let petalo_0 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_0"))
        petalo_0.name = "petalo"
        petalo_0.position = CGPointMake(-72.627799987793, -27.7642211914062)
        //petalo_0.size = CGSizeMake(98.0, 30.0)
        petalo_0.zRotation = 0.479760855436325
        petalo_0.zPosition = 3.0
        addChild(petalo_0)
        
        
        let petalo_1 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_1"))
        petalo_1.name = "petalo"
        petalo_1.position = CGPointMake(-76.5903396606445, 8.46768188476562)
        //petalo_1.size = CGSizeMake(99.0, 31.0)
        petalo_1.zRotation = 0.0
        petalo_1.zPosition = 3.0
        addChild(petalo_1)
        
        
        let petalo_2 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_2"))
        petalo_2.name = "petalo"
        petalo_2.position = CGPointMake(-69.1255798339844, 32.6385803222656)
        //petalo_2.size = CGSizeMake(97.0, 30.0)
        petalo_2.zRotation = -0.363067835569382
        petalo_2.zPosition = 2.0
        addChild(petalo_2)
        
        
        let petalo_3 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_3"))
        petalo_3.name = "petalo"
        petalo_3.position = CGPointMake(-47.2764434814453, 59.8580627441406)
        //petalo_3.size = CGSizeMake(29.0, 95.0)
        petalo_3.zRotation = 0.706677973270416
        petalo_3.zPosition = 3.0
        addChild(petalo_3)
        
        
        let petalo_4 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_4"))
        petalo_4.name = "petalo"
        petalo_4.position = CGPointMake(-2.15827941894531, 75.2708740234375)
        //petalo_4.size = CGSizeMake(29.0, 94.0)
        petalo_4.zRotation = 0.0
        petalo_4.zPosition = 3.0
        addChild(petalo_4)
        
        
        let petalo_5 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_5"))
        petalo_5.name = "petalo"
        petalo_5.position = CGPointMake(-22.1246490478516, 72.4426574707031)
        //petalo_5.size = CGSizeMake(29.0, 92.0)
        petalo_5.zRotation = 0.335041642189026
        petalo_5.zPosition = 2.0
        addChild(petalo_5)
        
        
        let petalo_6 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_6"))
        petalo_6.name = "petalo"
        petalo_6.position = CGPointMake(-52.3308258056641, 47.2386779785156)
        //petalo_6.size = CGSizeMake(90.0, 34.0)
        petalo_6.zRotation = -0.651017606258392
        petalo_6.zPosition = 1.0
        addChild(petalo_6)
        
        
        let petalo_7 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_7"))
        petalo_7.name = "petalo"
        petalo_7.position = CGPointMake(43.82763671875, -65.5964202880859)
        //petalo_7.size = CGSizeMake(29.0, 99.0)
        petalo_7.zRotation = 0.652929544448853
        petalo_7.zPosition = 3.0
        addChild(petalo_7)
        
        
        let petalo_8 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_8"))
        petalo_8.name = "petalo"
        petalo_8.position = CGPointMake(-48.9131698608398, -56.7787933349609)
        //petalo_8.size = CGSizeMake(28.0, 96.0)
        petalo_8.zRotation = -0.613186120986938
        petalo_8.zPosition = 3.0
        addChild(petalo_8)
        
        
        let petalo_9 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_9"))
        petalo_9.name = "petalo"
        petalo_9.position = CGPointMake(-73.6861877441406, -6.11056518554688)
        //petalo_9.size = CGSizeMake(96.0, 26.0)
        petalo_9.zRotation = 0.144854202866554
        petalo_9.zPosition = 2.0
        addChild(petalo_9)
        
        
        let petalo_10 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_10"))
        petalo_10.name = "petalo"
        petalo_10.position = CGPointMake(-57.4043121337891, -47.2994995117188)
        //petalo_10.size = CGSizeMake(28.0, 97.0)
        petalo_10.zRotation = -0.728766739368439
        petalo_10.zPosition = 2.0
        addChild(petalo_10)
        
        
        let petalo_11 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_11"))
        petalo_11.name = "petalo"
        petalo_11.position = CGPointMake(-30.2350463867188, -71.1099395751953)
        //petalo_11.size = CGSizeMake(29.0, 94.0)
        petalo_11.zRotation = -0.336944311857224
        petalo_11.zPosition = 2.0
        addChild(petalo_11)
        
        
        let petalo_12 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_12"))
        petalo_12.name = "petalo"
        petalo_12.position = CGPointMake(-0.107711791992188, -75.2673645019531)
        //petalo_12.size = CGSizeMake(31.0, 96.0)
        petalo_12.zRotation = 0.000864179630298167
        petalo_12.zPosition = 1.0
        addChild(petalo_12)
        
        
        let petalo_13 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_13"))
        petalo_13.name = "petalo"
        petalo_13.position = CGPointMake(27.1640167236328, -73.3287658691406)
        //petalo_13.size = CGSizeMake(32.0, 97.0)
        petalo_13.zRotation = 0.30914369225502
        petalo_13.zPosition = 0.0
        addChild(petalo_13)
        
        
        let petalo_14 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_14"))
        petalo_14.name = "petalo"
        petalo_14.position = CGPointMake(73.0106201171875, -26.8544616699219)
        //petalo_14.size = CGSizeMake(95.0, 31.0)
        petalo_14.zRotation = -0.3441102206707
        petalo_14.zPosition = 3.0
        addChild(petalo_14)
        
        
        let petalo_15 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_15"))
        petalo_15.name = "petalo"
        petalo_15.position = CGPointMake(60.8752746582031, -48.6043243408203)
        //petalo_15.size = CGSizeMake(30.0, 98.0)
        petalo_15.zRotation = 0.906754195690155
        petalo_15.zPosition = 0.0
        addChild(petalo_15)
        
        
        let petalo_16 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_16"))
        petalo_16.name = "petalo"
        petalo_16.position = CGPointMake(80.3223266601562, 18.8720397949219)
        //petalo_16.size = CGSizeMake(95.0, 27.0)
        petalo_16.zRotation = 0.252619832754135
        petalo_16.zPosition = 3.0
        addChild(petalo_16)
        
        
        let petalo_17 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_17"))
        petalo_17.name = "petalo"
        petalo_17.position = CGPointMake(78.8992309570312, -0.594451904296875)
        //petalo_17.size = CGSizeMake(92.0, 27.0)
        petalo_17.zRotation = -0.0387234911322594
        petalo_17.zPosition = 1.0
        addChild(petalo_17)
        
        
        let petalo_18 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_18"))
        petalo_18.name = "petalo"
        petalo_18.position = CGPointMake(64.1389923095703, 53.3252563476562)
        //petalo_18.size = CGSizeMake(31.0, 101.0)
        petalo_18.zRotation = -0.793990731239319
        petalo_18.zPosition = 3.0
        addChild(petalo_18)
        
        
        let petalo_19 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_19"))
        petalo_19.name = "petalo"
        petalo_19.position = CGPointMake(71.4255065917969, 39.3387756347656)
        //petalo_19.size = CGSizeMake(94.0, 28.0)
        petalo_19.zRotation = 0.588323354721069
        petalo_19.zPosition = 1.0
        addChild(petalo_19)
        
        
        let petalo_20 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_20"))
        petalo_20.name = "petalo"
        petalo_20.position = CGPointMake(31.2721710205078, 72.760009765625)
        //petalo_20.size = CGSizeMake(31.0, 91.0)
        petalo_20.zRotation = -0.39888322353363
        petalo_20.zPosition = 3.0
        addChild(petalo_20)
        
        
        let petalo_21 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_21"))
        petalo_21.name = "petalo"
        petalo_21.position = CGPointMake(20.5424957275391, 73.6123962402344)
        //petalo_21.size = CGSizeMake(27.0, 85.0)
        petalo_21.zRotation = -0.207954958081245
        petalo_21.zPosition = 2.0
        addChild(petalo_21)
        
        
        let petalo_22 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_22"))
        petalo_22.name = "petalo"
        petalo_22.position = CGPointMake(48.2252349853516, 63.6234741210938)
        //petalo_22.size = CGSizeMake(28.0, 96.0)
        petalo_22.zRotation = -0.650420904159546
        petalo_22.zPosition = 1.0
        addChild(petalo_22)
        
        
        // petalo speciale
        let petalo_23 = SKSpriteNode(texture: atlas.textureNamed("31_petalo_22"))
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
