//
//  Hue.swift
//  RandomColorSwift
//
//  Created by WANG WEI on 2015/01/22.
//  Copyright (c) 2015年 OneV's Den. All rights reserved.
//

import Foundation

public enum Hue {
    
    case Monochrome, Red, Orange, Yellow, Green, Blue, Purple, Pink
    case Value(Int)
    case Random

    public func toInt() -> Int {
        switch self {
        case .Monochrome: return 1
        case .Red: return 2
        case .Orange: return 3
        case .Yellow: return 4
        case .Green: return 5
        case .Blue: return 6
        case .Purple: return 7
        case .Pink: return 8
        case .Value(let value): return -1
        case .Random: return 0
        }
    }
}

public func == (lhs: Hue, rhs: Hue) -> Bool {
    return lhs.toInt() == rhs.toInt()
}

extension Hue: Hashable {
    public var hashValue: Int {
        get {
            return self.toInt()
        }
    }
}