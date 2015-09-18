//
//  HueExtension.swift
//  RandomColorSwift
//
//  Copyright (c) 2015 Wei Wang (http://onevcat.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

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

extension Hue: CustomStringConvertible {
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
            case .Value(_): return "Value"
            case .Random: return "Random"
            }
        }
    }
}