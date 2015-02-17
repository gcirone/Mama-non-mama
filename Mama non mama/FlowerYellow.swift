//
//  FlowerYellow.swift
//  TestSpriteFlowers
//
//  Created by Cirone, Gianluca on 10/02/15.
//  Copyright (c) 2015 freshdev. All rights reserved.
//

import SpriteKit

class FlowerYellow: SKNode {

    let atlas = SKTextureAtlas(named: "flower-yellow")
    
    deinit {
        //println("FlowerYellow.deinit")
    }
    
    override init(){
        super.init()
        
        name = "flower"
        
        
        let pistillo = SKSpriteNode(texture: atlas.textureNamed("2_pistillo"))
        pistillo.name = "pistillo"
        pistillo.position = CGPointMake(0.0, 0.0)
        //pistillo.size = CGSizeMake(79.0, 81.0)
        pistillo.zRotation = 0.0
        pistillo.zPosition = 10.0
        addChild(pistillo)
        
        
        let gambo = SKSpriteNode(texture: atlas.textureNamed("2_gambo"))
        gambo.name = "gambo"
        gambo.position = CGPointMake(0.0, 0.0)
        gambo.anchorPoint = CGPointMake(0.5, 1)
        //gambo = CGSizeMake(22.0, 367.0)
        gambo.zRotation = 0.0
        gambo.zPosition = -1.0
        addChild(gambo)
        
        
        let petalo_0 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_0"))
        petalo_0.name = "petalo"
        petalo_0.position = CGPointMake(35.7892303466797, 69.4879760742188)
        //petalo_0.size = CGSizeMake(32.0, 95.0)
        petalo_0.zRotation = -0.303719580173492
        petalo_0.zPosition = 3.0
        addChild(petalo_0)
        
        
        let petalo_1 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_1"))
        petalo_1.name = "petalo"
        petalo_1.position = CGPointMake(-0.416763305664062, -79.7305908203125)
        //petalo_1.size = CGSizeMake(28.0, 94.0)
        petalo_1.zRotation = 0.0634021684527397
        petalo_1.zPosition = 3.0
        addChild(petalo_1)
        
        
        let petalo_2 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_2"))
        petalo_2.name = "petalo"
        petalo_2.position = CGPointMake(55.7260437011719, 55.2730102539062)
        //petalo_2.size = CGSizeMake(30.0, 93.0)
        petalo_2.zRotation = -0.576945006847382
        petalo_2.zPosition = 2.0
        addChild(petalo_2)
        
        
        let petalo_3 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_3"))
        petalo_3.name = "petalo"
        petalo_3.position = CGPointMake(71.025146484375, 32.4810791015625)
        //petalo_3.size = CGSizeMake(29.0, 94.0)
        petalo_3.zRotation = -0.955248475074768
        petalo_3.zPosition = 1.0
        addChild(petalo_3)
        
        
        let petalo_4 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_4"))
        petalo_4.name = "petalo"
        petalo_4.position = CGPointMake(78.1739196777344, -4.643798828125)
        //petalo_4.size = CGSizeMake(94.0, 30.0)
        petalo_4.zRotation = 0.0
        petalo_4.zPosition = 3.0
        addChild(petalo_4)
        
        
        let petalo_5 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_5"))
        petalo_5.name = "petalo"
        petalo_5.position = CGPointMake(73.762939453125, -37.3956604003906)
        //petalo_5.size = CGSizeMake(97.0, 31.0)
        petalo_5.zRotation = -0.334236592054367
        petalo_5.zPosition = 3.0
        addChild(petalo_5)
        
        
        let petalo_6 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_6"))
        petalo_6.name = "petalo"
        petalo_6.position = CGPointMake(28.0926818847656, -77.6779937744141)
        //petalo_6.size = CGSizeMake(31.0, 102.0)
        petalo_6.zRotation = 0.397579282522202
        petalo_6.zPosition = 2.0
        addChild(petalo_6)
        
        
        let petalo_7 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_7"))
        petalo_7.name = "petalo"
        petalo_7.position = CGPointMake(47.6922454833984, -67.5986480712891)
        //petalo_7.size = CGSizeMake(34.0, 95.0)
        petalo_7.zRotation = 0.661103367805481
        petalo_7.zPosition = 1.0
        addChild(petalo_7)
        
        
        let petalo_8 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_8"))
        petalo_8.name = "petalo"
        petalo_8.position = CGPointMake(58.7645721435547, -53.6505584716797)
        //petalo_8.size = CGSizeMake(92.0, 28.0)
        petalo_8.zRotation = -0.531616985797882
        petalo_8.zPosition = 0.0
        addChild(petalo_8)
        
        
        let petalo_9 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_9"))
        petalo_9.name = "petalo"
        petalo_9.position = CGPointMake(73.3457946777344, -22.7885437011719)
        //petalo_9.size = CGSizeMake(92.0, 28.0)
        petalo_9.zRotation = -0.244820028543472
        petalo_9.zPosition = 0.0
        addChild(petalo_9)
        
        
        let petalo_10 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_10"))
        petalo_10.name = "petalo"
        petalo_10.position = CGPointMake(75.309814453125, 16.8302917480469)
        //petalo_10.size = CGSizeMake(91.0, 29.0)
        petalo_10.zRotation = 0.340040355920792
        petalo_10.zPosition = 0.0
        addChild(petalo_10)
        
        
        let petalo_11 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_11"))
        petalo_11.name = "petalo"
        petalo_11.position = CGPointMake(0.834930419921875, 78.9201354980469)
        //petalo_11.size = CGSizeMake(30.0, 94.0)
        petalo_11.zRotation = 0.0
        petalo_11.zPosition = 3.0
        addChild(petalo_11)
        
        
        let petalo_12 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_12"))
        petalo_12.name = "petalo"
        petalo_12.position = CGPointMake(17.4740600585938, 75.9985046386719)
        //petalo_12.size = CGSizeMake(25.0, 87.0)
        petalo_12.zRotation = -0.127769023180008
        petalo_12.zPosition = 2.0
        addChild(petalo_12)
        
        
        let petalo_13 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_13"))
        petalo_13.name = "petalo"
        petalo_13.position = CGPointMake(-26.1876373291016, -74.3466186523438)
        //petalo_13.size = CGSizeMake(29.0, 94.0)
        petalo_13.zRotation = -0.21711939573288
        petalo_13.zPosition = 2.0
        addChild(petalo_13)
        
        
        let petalo_14 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_14"))
        petalo_14.name = "petalo"
        petalo_14.position = CGPointMake(-78.5686264038086, 12.0630493164062)
        //petalo_14.size = CGSizeMake(93.0, 27.0)
        petalo_14.zRotation = 0.00167735433205962
        petalo_14.zPosition = 3.0
        addChild(petalo_14)
        
        
        let petalo_15 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_15"))
        petalo_15.name = "petalo"
        petalo_15.position = CGPointMake(-59.2789764404297, 50.3781127929688)
        //petalo_15.size = CGSizeMake(98.0, 30.0)
        petalo_15.zRotation = -0.59705924987793
        petalo_15.zPosition = 3.0
        addChild(petalo_15)
        
        
        let petalo_16 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_16"))
        petalo_16.name = "petalo"
        petalo_16.position = CGPointMake(-25.5306701660156, 70.4482421875)
        //petalo_16.size = CGSizeMake(30.0, 91.0)
        petalo_16.zRotation = 0.35652756690979
        petalo_16.zPosition = 2.0
        addChild(petalo_16)
        
        
        // petalo speciale
        let petalo_17 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_17"))
        petalo_17.name = "petalo_mama"
        petalo_17.position = CGPointMake(-15.9295654296875, 73.7785034179688)
        //petalo_17.size = CGSizeMake(26.0, 84.0)
        petalo_17.zRotation = 0.190113589167595
        petalo_17.zPosition = 1.0
        addChild(petalo_17)
        
        
        let petalo_18 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_18"))
        petalo_18.name = "petalo"
        petalo_18.position = CGPointMake(-46.8778915405273, 64.5624389648438)
        //petalo_18.size = CGSizeMake(27.0, 93.0)
        petalo_18.zRotation = 0.70167201757431
        petalo_18.zPosition = 1.0
        addChild(petalo_18)
        
        
        let petalo_19 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_19"))
        petalo_19.name = "petalo"
        petalo_19.position = CGPointMake(-68.858268737793, 31.9723815917969)
        //petalo_19.size = CGSizeMake(90.0, 28.0)
        petalo_19.zRotation = -0.336490601301193
        petalo_19.zPosition = 1.0
        addChild(petalo_19)
        
        
        let petalo_20 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_20"))
        petalo_20.name = "petalo"
        petalo_20.position = CGPointMake(-76.3041763305664, -16.0827331542969)
        //petalo_20.size = CGSizeMake(96.0, 34.0)
        petalo_20.zRotation = 0.312277764081955
        petalo_20.zPosition = 2.0
        addChild(petalo_20)
        
        
        let petalo_21 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_21"))
        petalo_21.name = "petalo"
        petalo_21.position = CGPointMake(-61.5523376464844, -52.2096710205078)
        //petalo_21.size = CGSizeMake(31.0, 96.0)
        petalo_21.zRotation = -0.638030648231506
        petalo_21.zPosition = 1.0
        addChild(petalo_21)
        
        
        let petalo_22 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_22"))
        petalo_22.name = "petalo"
        petalo_22.position = CGPointMake(-69.8253021240234, -32.2826995849609)
        //petalo_22.size = CGSizeMake(94.0, 28.0)
        petalo_22.zRotation = 0.44065934419632
        petalo_22.zPosition = 0.0
        addChild(petalo_22)
        
        
        let petalo_23 = SKSpriteNode(texture: atlas.textureNamed("2_petalo_23"))
        petalo_23.name = "petalo"
        petalo_23.position = CGPointMake(-41.6115188598633, -67.8399658203125)
        //petalo_23.size = CGSizeMake(29.0, 97.0)
        petalo_23.zRotation = -0.352061748504639
        petalo_23.zPosition = 0.0
        addChild(petalo_23)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
