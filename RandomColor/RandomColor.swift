//
//  RandomColor.swift
//  RandomColorSwift
//
//  Created by WANG WEI on 2015/01/22.
//  Copyright (c) 2015年 OneV's Den. All rights reserved.
//

import Foundation

private var colorDictionary: [Hue: ColorDefinition] = [
    .Monochrome: ColorDefinition(hueRange: nil, lowerBounds: [(0,0), (100,0)]),
    .Red: ColorDefinition(hueRange: (-26,18), lowerBounds: [(20,100), (30,92), (40,89), (50,85), (60,78), (70,70), (80,60), (90,55), (100,50)]),
    .Orange: ColorDefinition(hueRange: (19,46), lowerBounds: [(20,100), (30,93), (40,88), (50,86), (60,85), (70,70), (100,70)]),
    .Yellow: ColorDefinition(hueRange: (47,62), lowerBounds: [(25,100), (40,94), (50,89), (60,86), (70,84), (80,82), (90,80), (100,75)]),
    .Green: ColorDefinition(hueRange: (63,178), lowerBounds: [(30,100), (40,90), (50,85), (60,81), (70,74), (80,64), (90,50), (100,40)]),
    .Blue: ColorDefinition(hueRange: (179,257), lowerBounds: [(20,100), (30,86), (40,80), (50,74), (60,60), (70,52), (80,44), (90,39), (100,35)]),
    .Purple: ColorDefinition(hueRange: (258, 282), lowerBounds: [(20,100), (30,87), (40,79), (50,70), (60,65), (70,59), (80,52), (90,45), (100,42)]),
    .Pink: ColorDefinition(hueRange: (283, 334), lowerBounds: [(20,100), (30,90), (40,86), (60,84), (80,80), (90,75), (100,73)])
]

extension Hue {
    func toRange() -> Range {
        switch self {
        case .Value(let value): return (value, value)
        case .Random: return (0, 360)
        default:
            if let colorDefinition = colorDictionary[self] {
                return colorDefinition.hueRange ?? (0, 360)
            } else {
                assert(false, "Unrecgonized Hue enum: \(self).")
                return (0, 360)
            }
        }
    }
}

public func randomColor(hue: Hue = .Random, luminosity: Luminosity = .Random) -> UIColor {
    
    func randomWithin(range: Range) -> Int {
        assert(range.max >= range.min, "Max in range should be greater than min")
        return Int(arc4random_uniform(UInt32(range.max - range.min))) + range.min
    }
    
    func getColorDefinition(var hueValue: Int) -> ColorDefinition {
        
        if hueValue >= 334 && hueValue <= 360 {
            hueValue -= 360
        }
        
        var color = filter(colorDictionary.values, { (definition: ColorDefinition) -> Bool in
            if let hueRange = definition.hueRange {
                return hueValue >= hueRange.min && hueValue <= hueRange.max
            } else {
                return false
            }
        })
        
        assert(color.count == 1, "There should one and only one color satisfied the filter")
        return color[0]
    }
    
    func pickHue(hue: Hue) -> Int {
        let hueRange = hue.toRange()
        var hueValue = randomWithin(hueRange)
        
        // Instead of storing red as two seperate ranges,
        // we group them, using negative numbers
        if hueValue < 0 {
            hueValue = hueValue + 360
        }
        return hueValue
    }
    
    func pickSaturation(var color: ColorDefinition, hue: Hue, luminosity: Luminosity) -> Int {
        
        if luminosity == .Random {
            return randomWithin((0, 100))
        }
        
        if hue == .Monochrome {
            return 0
        }
        
        let saturationRange = color.saturationRange
        var sMin = saturationRange.min
        var sMax = saturationRange.max
        
        switch luminosity {
        case .Bright:
            sMin = 55
        case .Dark:
            sMin = sMax - 10
        case .Light:
            sMax = 55
        default: ()
        }
        
        return randomWithin((sMin, sMax))
    }
    
    func pickBrightness(var color: ColorDefinition, saturationValue: Int, luminosity: Luminosity) -> Int {
 
        func getMinimumBrightness(saturationValue: Int) -> Int {
            var lowerBounds = color.lowerBounds;
            for i in 0 ..< lowerBounds.count - 1 {
                
                let s1 = Float(lowerBounds[i].0)
                let v1 = Float(lowerBounds[i].1)
                
                let s2 = Float(lowerBounds[i+1].0)
                let v2 = Float(lowerBounds[i+1].1)
                
                if Float(saturationValue) >= s1 && Float(saturationValue) <= s2 {
                    let m = (v2 - v1) / (s2 - s1)
                    let b = v1 - m * s1
                    return lroundf(m * Float(saturationValue) + b)
                }
            }
            return 0
        }
        
        var bMin = getMinimumBrightness(saturationValue)
        var bMax = 100
        
        switch luminosity {
        case .Dark:
            bMax = bMin + 20
        case .Light:
            bMin = (bMax + bMin) / 2
        case .Random:
            bMin = 0
            bMax = 100
        default: ()
        }
        
        return randomWithin((bMin, bMax))
    }

    
    let hueValue = pickHue(hue)
    
    let color = getColorDefinition(hueValue)
    
    let saturationValue = pickSaturation(color, hue, luminosity)
    let brightnessValue = pickBrightness(color, saturationValue, luminosity)
    
    
    return UIColor(hue: CGFloat(hueValue) / 360.0,
            saturation: CGFloat(saturationValue) / 100.0,
            brightness: CGFloat(brightnessValue) / 100.0,
                 alpha: 1.0)
}

public func randomColors(count: Int, hue: Hue = .Random, luminosity: Luminosity = .Random) -> [UIColor] {
    var colors: [UIColor] = []
    while (colors.count < count) {
        colors.append(randomColor(hue: hue, luminosity: luminosity))
    }
    return colors
}

