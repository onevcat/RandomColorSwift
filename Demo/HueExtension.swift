//
//  HueExtension.swift
//  RandomColorSwift
//
//  Copyright (c) 2016 Wei Wang (http://onevcat.com)
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
    public static func fromInt(_ value: Int) -> Hue {
        switch value {
        case 1: return .monochrome
        case 2: return .red
        case 3: return .orange
        case 4: return .yellow
        case 5: return .green
        case 6: return .blue
        case 7: return .purple
        case 8: return .pink
        case -1: return .value(0)
        default: return .random
        }
    }
}

extension Hue: CustomStringConvertible {
    public var description: String {
        get {
            switch self {
            case .monochrome: return "Monochrome"
            case .red: return "Red"
            case .orange: return "Orange"
            case .yellow: return "Yellow"
            case .green: return "Green"
            case .blue: return "Blue"
            case .purple: return "Purple"
            case .pink: return "Pink"
            case .value(_): return "Value"
            case .random: return "Random"
            }
        }
    }
}
