//
//  Hue.swift
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

public enum Hue {
    
    case monochrome, red, orange, yellow, green, blue, purple, pink
    case value(Int)
    case random

    public func toInt() -> Int {
        switch self {
        case .monochrome: return 1
        case .red: return 2
        case .orange: return 3
        case .yellow: return 4
        case .green: return 5
        case .blue: return 6
        case .purple: return 7
        case .pink: return 8
        case .value(_): return -1
        case .random: return 0
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
