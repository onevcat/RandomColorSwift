//
//  HueExtension.swift
//  RandomColorSwift
//
//  Created by WANG WEI on 2015/01/23.
//  Copyright (c) 2015年 OneV's Den. All rights reserved.
//

import Foundation
import RandomColor

extension Hue {
    public static func fromInt(value: Int) -> Hue {
        switch value {
        case 1: return .Monochrome
        case 2: return .Red
        case 3: return .Orange
        case 4: return .Yellow
        case 5: return .Green
        case 6: return .Blue
        case 7: return .Purple
        case 8: return .Pink
        case -1: return .Value(0)
        default: return .Random
        }
    }
}

extension Hue: Printable {
    public var description: String {
        get {
            switch self {
            case .Monochrome: return "Monochrome"
            case .Red: return "Red"
            case .Orange: return "Orange"
            case .Yellow: return "Yellow"
            case .Green: return "Green"
            case .Blue: return "Blue"
            case .Purple: return "Purple"
            case .Pink: return "Pink"
            case .Value(let value): return "Value"
            case .Random: return "Random"
            }
        }
    }
}