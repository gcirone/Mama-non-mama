//
//  FlowerStandard.swift
//  TestSpriteFlowers
//
//  Created by Cirone, Gianluca on 09/02/15.
//  Copyright (c) 2015 freshdev. All rights reserved.
//

import SpriteKit


class FlowerStandard: SKNode {
 
    let atlas = SKTextureAtlas(named: "flower-standard")
    
    deinit {
        //println("FlowerStandard.deinit")
    }
    
    override init(){
        super.init()
        
        name = "flower"
        
        let pistillo = SKSpriteNode(texture: atlas.textureNamed("1_pistillo"))
        pistillo.name = "pistillo"
        pistillo.position = CGPointMake(0.0, 0.0)
        //pistillo.size = CGSizeMake(79.0, 79.0)
        pistillo.zRotation = 0.0
        pistillo.zPosition = 10.0
        addChild(pistillo)
        
        
        let gambo = SKSpriteNode(texture: atlas.textureNamed("1_gambo"))
        gambo.name = "gambo"
        gambo.position = CGPointMake(0.0, 0.0)
        gambo.anchorPoint = CGPointMake(0.5, 1)
        //gambo = CGSizeMake(22.0, 367.0)
        gambo.zRotation = 0.0
        gambo.zPosition = -1.0
        addChild(gambo)
        
        
        let petalo_0 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_0"))
        petalo_0.name = "petalo"
        petalo_0.position = CGPointMake(-74.4010009765625, -30.1058197021484)
        //petalo_0.size = CGSizeMake(30.0, 98.0)
        petalo_0.zRotation = -1.08396363258362
        petalo_0.zPosition = 2.0
        addChild(petalo_0)
        
        
        let petalo_1 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_1"))
        petalo_1.name = "petalo"
        petalo_1.position = CGPointMake(-78.8622970581055, 6.10025024414062)
        //petalo_1.size = CGSizeMake(99.0, 31.0)
        petalo_1.zRotation = 0.0
        petalo_1.zPosition = 3.0
        addChild(petalo_1)
        
        
        let petalo_2 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_2"))
        petalo_2.name = "petalo"
        petalo_2.position = CGPointMake(-71.7198181152344, 28.9588928222656)
        //petalo_2.size = CGSizeMake(97.0, 30.0)
        petalo_2.zRotation = -0.392043024301529
        petalo_2.zPosition = 1.0
        addChild(petalo_2)
        
        
        let petalo_3 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_3"))
        petalo_3.name = "petalo"
        petalo_3.position = CGPointMake(-49.3149490356445, 57.5211181640625)
        //petalo_3.size = CGSizeMake(29.0, 95.0)
        petalo_3.zRotation = 0.672595083713531
        petalo_3.zPosition = 3.0
        addChild(petalo_3)
        
        
        let petalo_4 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_4"))
        petalo_4.name = "petalo"
        petalo_4.position = CGPointMake(-4.93453979492188, 78.4715576171875)
        //petalo_4.size = CGSizeMake(30.0, 95.0)
        petalo_4.zRotation = 0.0
        petalo_4.zPosition = 3.0
        addChild(petalo_4)
        
        
        let petalo_5 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_5"))
        petalo_5.name = "petalo"
        petalo_5.position = CGPointMake(-23.5823211669922, 70.4507446289062)
        //petalo_5.size = CGSizeMake(29.0, 92.0)
        petalo_5.zRotation = 0.375399142503738
        petalo_5.zPosition = 2.0
        addChild(petalo_5)
        
        
        let petalo_6 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_6"))
        petalo_6.name = "petalo"
        petalo_6.position = CGPointMake(-56.4931182861328, 42.8670043945312)
        //petalo_6.size = CGSizeMake(33.0, 90.0)
        petalo_6.zRotation = 0.87390923500061
        petalo_6.zPosition = 0.0
        addChild(petalo_6)
        
        
        let petalo_7 =  SKSpriteNode(texture: atlas.textureNamed("1_petalo_7"))
        petalo_7.name = "petalo"
        petalo_7.position = CGPointMake(40.6665191650391, -69.0820922851562)
        //petalo_7.size = CGSizeMake(29.0, 99.0)
        petalo_7.zRotation = 0.675985097885132
        petalo_7.zPosition = 3.0
        addChild(petalo_7)
        
        
        let petalo_8 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_8"))
        petalo_8.name = "petalo"
        petalo_8.position = CGPointMake(-50.1699371337891, -59.0988616943359)
        //petalo_8.size = CGSizeMake(28.0, 96.0)
        petalo_8.zRotation = -0.658940434455872
        petalo_8.zPosition = 3.0
        addChild(petalo_8)
        
        
        let petalo_9 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_9"))
        petalo_9.name = "petalo"
        petalo_9.position = CGPointMake(-76.2875671386719, -8.66259765625)
        //petalo_9.size = CGSizeMake(96.0, 26.0)
        petalo_9.zRotation = 0.172373533248901
        petalo_9.zPosition = 0.0
        addChild(petalo_9)
        
        
        let petalo_10 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_10"))
        petalo_10.name = "petalo"
        petalo_10.position = CGPointMake(-60.5901565551758, -49.0481567382812)
        //petalo_10.size = CGSizeMake(27.0, 96.0)
        petalo_10.zRotation = -0.814723908901215
        petalo_10.zPosition = 1.0
        addChild(petalo_10)
        
        
        let petalo_11 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_11"))
        petalo_11.name = "petalo"
        petalo_11.position = CGPointMake(-2.0927734375, -78.0203704833984)
        //petalo_11.size = CGSizeMake(31.0, 96.0)
        petalo_11.zRotation = 0.0
        petalo_11.zPosition = 2.0
        addChild(petalo_11)
        
        
        let petalo_12 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_12"))
        petalo_12.name = "petalo"
        petalo_12.position = CGPointMake(-31.4607849121094, -74.4019165039062)
        //petalo_12.size = CGSizeMake(29.0, 94.0)
        petalo_12.zRotation = -0.346107125282288
        petalo_12.zPosition = 1.0
        addChild(petalo_12)
        
        
        let petalo_13 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_13"))
        petalo_13.name = "petalo"
        petalo_13.position = CGPointMake(23.9495697021484, -79.1922149658203)
        //petalo_13.size = CGSizeMake(32.0, 97.0)
        petalo_13.zRotation = 0.391538977622986
        petalo_13.zPosition = 1.0
        addChild(petalo_13)
        
        
        let petalo_14 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_14"))
        petalo_14.name = "petalo"
        petalo_14.position = CGPointMake(72.2958374023438, -24.658203125)
        //petalo_14.size = CGSizeMake(95.0, 31.0)
        petalo_14.zRotation = -0.332861691713333
        petalo_14.zPosition = 3.0
        addChild(petalo_14)
        
        
        let petalo_15 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_15"))
        petalo_15.name = "petalo"
        petalo_15.position = CGPointMake(58.8621063232422, -51.7859497070312)
        //petalo_15.size = CGSizeMake(98.0, 31.0)
        petalo_15.zRotation = -0.672551393508911
        petalo_15.zPosition = 1.0
        addChild(petalo_15)
        
        
        let petalo_16 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_16"))
        petalo_16.name = "petalo"
        petalo_16.position = CGPointMake(78.3528900146484, 14.3430786132812)
        //petalo_16.size = CGSizeMake(102.0, 29.0)
        petalo_16.zRotation = 0.216689139604568
        petalo_16.zPosition = 3.0
        addChild(petalo_16)
        
        
        let petalo_17 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_17"))
        petalo_17.name = "petalo"
        petalo_17.position = CGPointMake(77.3499145507812, -3.298828125)
        //petalo_17.size = CGSizeMake(92.0, 27.0)
        petalo_17.zRotation = -0.0801477059721947
        petalo_17.zPosition = 2.0
        addChild(petalo_17)
        
        
        let petalo_18 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_18"))
        petalo_18.name = "petalo"
        petalo_18.position = CGPointMake(57.8372955322266, 49.6026611328125)
        //petalo_18.size = CGSizeMake(31.0, 101.0)
        petalo_18.zRotation = -0.769606173038483
        petalo_18.zPosition = 3.0
        addChild(petalo_18)
        
        
        let petalo_19 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_19"))
        petalo_19.name = "petalo"
        petalo_19.position = CGPointMake(70.6068878173828, 37.1067810058594)
        //petalo_19.size = CGSizeMake(94.0, 28.0)
        petalo_19.zRotation = 0.597799301147461
        petalo_19.zPosition = 2.0
        addChild(petalo_19)
        
        
        let petalo_20 =  SKSpriteNode(texture: atlas.textureNamed("1_petalo_20"))
        petalo_20.name = "petalo"
        petalo_20.position = CGPointMake(33.3582763671875, 69.4939575195312)
        //petalo_20.size = CGSizeMake(31.0, 91.0)
        petalo_20.zRotation = -0.378450661897659
        petalo_20.zPosition = 2.0
        addChild(petalo_20)
        
        
        let petalo_21 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_21"))
        petalo_21.name = "petalo"
        petalo_21.position = CGPointMake(14.6607513427734, 72.513671875)
        //petalo_21.size = CGSizeMake(27.0, 84.0)
        petalo_21.zRotation = -0.174466133117676
        petalo_21.zPosition = 1.0
        addChild(petalo_21)
        
        
        let petalo_22 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_22"))
        petalo_22.name = "petalo"
        petalo_22.position = CGPointMake(47.5953674316406, 60.3964538574219)
        //petalo_22.size = CGSizeMake(28.0, 96.0)
        petalo_22.zRotation = -0.605149745941162
        petalo_22.zPosition = 1.0
        addChild(petalo_22)
        
        
        // petalo speciale
        let petalo_23 = SKSpriteNode(texture: atlas.textureNamed("1_petalo_22"))
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
