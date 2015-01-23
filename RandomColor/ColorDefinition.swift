//
//  ColorDefinition.swift
//  RandomColorSwift
//
//  Created by WANG WEI on 2015/01/22.
//  Copyright (c) 2015年 OneV's Den. All rights reserved.
//

import Foundation

typealias Range = (min: Int, max: Int)

struct ColorDefinition {
    let hueRange: Range?
    let lowerBounds: [Range]
    
    lazy var saturationRange: Range = {
        let sMin = self.lowerBounds[0].0
        let sMax = self.lowerBounds[self.lowerBounds.count - 1].0
        return (sMin, sMax)
    }()
    
    lazy var brightnessRange: Range = {
        let bMin = self.lowerBounds[self.lowerBounds.count - 1].1
        let bMax = self.lowerBounds[0].1
        return (bMin, bMax)
    }()
    
    init(hueRange: Range?, lowerBounds: [Range]) {
        self.hueRange = hueRange
        self.lowerBounds = lowerBounds
    }
}