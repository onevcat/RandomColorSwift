//
//  Hue.swift
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
        case .Value(_): return -1
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