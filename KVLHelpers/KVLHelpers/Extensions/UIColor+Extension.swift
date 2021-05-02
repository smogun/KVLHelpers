//
//  UIColor+Extension.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import UIKit

/****************************************************************************************/
func RandomColor() -> UIColor
{
    return UIColor.RGBA((CGFloat)(arc4random_uniform(255)), g: (CGFloat)(arc4random_uniform(255)), b: (CGFloat)(arc4random_uniform(255)), a: CGFloat(0.7))
}


@objc public extension UIColor
{
    @objc class func RGBA(_ r: CGFloat,  g: CGFloat,  b: CGFloat,  a: CGFloat) -> UIColor
    {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    @objc class func RGB(_ r: CGFloat,  g: CGFloat,  b: CGFloat) -> UIColor
    {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    class func RGB(hexString: String) -> UIColor
    {
        let chars:Array<Character> = Array(hexString.trimmingCharacters(in: CharacterSet(charactersIn: " #")))
        
        let numbers:[UInt8] = Swift.stride(from: 0, to: chars.count, by: 2).map {
            UInt8(String(chars[$0 ..< $0+2]), radix: 16) ?? 0
        }
        return UIColor(red: CGFloat(numbers[0])/255, green: CGFloat(numbers[1])/255, blue: CGFloat(numbers[2])/255, alpha: 1.0)
    }
    
    @objc func Red() -> CGFloat
    {
        var r:CGFloat = CGFloat(0), g:CGFloat = CGFloat(0), b:CGFloat = CGFloat(0), a:CGFloat = CGFloat(0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return r
    }
    
    @objc func Green() -> CGFloat
    {
        var r:CGFloat = CGFloat(0), g:CGFloat = CGFloat(0), b:CGFloat = CGFloat(0), a:CGFloat = CGFloat(0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return g
    }
    
    @objc func Blue() -> CGFloat
    {
        var r:CGFloat = CGFloat(0), g:CGFloat = CGFloat(0), b:CGFloat = CGFloat(0), a:CGFloat = CGFloat(0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return b
    }
    
    @objc func Alpha() -> CGFloat
    {
        var r:CGFloat = CGFloat(0), g:CGFloat = CGFloat(0), b:CGFloat = CGFloat(0), a:CGFloat = CGFloat(0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return a
    }
}
