//
//  UIView+Extension.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import UIKit

public extension UIView
{
    public var origin:CGPoint{get{return self.frame.origin}}
    public var size:CGSize{get{return self.frame.size}}
    
    public var endX:CGFloat{get {return self.frame.origin.x + self.frame.size.width}}
    public var endY:CGFloat{get{return self.frame.origin.y + self.frame.size.height}}
}