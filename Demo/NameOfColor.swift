//
//  NameOfColor.swift
//  RandomColorSwift
//
//  Created by WANG WEI on 2015/01/23.
//  Copyright (c) 2015年 OneV's Den. All rights reserved.
//

import UIKit
import JavaScriptCore

private var context: JSContext = {
    let jsPath = NSBundle.mainBundle().pathForResource("ntc", ofType: "js")!
    var error: NSError?
    let jsString = try! String(contentsOfFile:jsPath, encoding: NSUTF8StringEncoding)
    
    let context = JSContext()
    context.evaluateScript(jsString)
    return context
}()

extension UIColor {
    var hexString: String {
        var red: CGFloat = 0
        var green: CGFloat  = 0
        var blue: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        let r = Int(255.0 * red);
        let g = Int(255.0 * green);
        let b = Int(255.0 * blue);
        
        return String(format: "#%02x%02x%02x", r,g,b)
    }
}

extension UIColor {
    var name: String {
        get {
            let colorInfo = context.evaluateScript("ntc.name('\(self.hexString)')").toArray()
            return colorInfo[1] as! String
        }
    }
}
