//
//  UIColor+Extension.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import UIKit

/***************************************************************************************************************************************/
func RandomColor() -> UIColor
{
    return UIColor(r: (CGFloat)(random() % 255), g: (CGFloat)(random() % 255), b: (CGFloat)(random() % 255), a: CGFloat(0.7))
}


extension UIColor
{
    convenience init( r: CGFloat,  g: CGFloat,  b: CGFloat,  a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    convenience init( r: CGFloat,  g: CGFloat,  b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
}