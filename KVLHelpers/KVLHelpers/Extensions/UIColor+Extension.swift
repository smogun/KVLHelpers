//
//  UIColor+Extension.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import UIKit

/****************************************************************************************/
public func RandomColor() -> UIColor
{
    return UIColor.RGBA((CGFloat)(arc4random_uniform(255)), g: (CGFloat)(arc4random_uniform(255)), b: (CGFloat)(arc4random_uniform(255)), a: CGFloat(0.7))
}


public extension UIColor
{
    public class func RGBA(r: CGFloat,  g: CGFloat,  b: CGFloat,  a: CGFloat) -> UIColor
    {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    public class func RGB(r: CGFloat,  g: CGFloat,  b: CGFloat) -> UIColor
    {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
    public func Red() -> CGFloat
    {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return r
    }
    
    public func Green() -> CGFloat
    {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return g
    }
    
    public func Blue() -> CGFloat
    {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return b
    }
    
    public func Alpha() -> CGFloat
    {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return a
    }
}