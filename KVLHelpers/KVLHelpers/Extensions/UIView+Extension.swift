//
//  UIView+Extension.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import UIKit

@objc public enum EntorpolationDirection: Int16
{
    case Horizontal = 1
    case Vertical   = 2
    case Both       = 3
}



public extension UIView
{
    /**
    * Shortcut for frame.origin
    */
    public var origin:CGPoint{get{return self.frame.origin}}
    
    
    
    
    /**
    * Shortcut for frame.size
    */
    public var size:CGSize{get{return self.frame.size}}
    
    
    
    
    /**
    * Shortcut for frame.origin.x + width
    */
    public var endX:CGFloat{get{return self.frame.origin.x + self.frame.size.width}}
    
    
    
    
    /**
    * Shortcut for frame.origin.y + frame.size.height
    */
    public var endY:CGFloat{get{return self.frame.origin.y + self.frame.size.height}}
    
    
    
    
    /**
    * Shortcut to change frame's width
    */
    @inline(__always) public func changeWidth(newWidth: CGFloat)
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newWidth, self.frame.size.height);
    }
    
    
    
    
    /**
    * Shortcut to change frame's height
    */
    @inline(__always) public func changeHeight(newHeight: CGFloat)
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newHeight);
    }
    
    
    
    
    /**
    * Shortcut to add subview at center of view
    */
    public func addSubviewAtCenter(subView: UIView?)
    {
        if (subView == nil)
        {
            return;
        }
        
        var subViewFrame = subView!.frame;
        subViewFrame.origin.x = self.size.width / 2 - subViewFrame.size.width / 2;
        subViewFrame.origin.y = self.size.height / 2 - subViewFrame.size.height / 2;
        subView!.frame = subViewFrame;
        self.addSubview(subView!);
    }
    
    
    
    
    /**
    * Shortcut to add subview at center of view horizontally
    */
    public func addSubviewAtCenterHorizontally(subView: UIView?, originY: CGFloat)
    {
        if (subView == nil)
        {
            return;
        }
        
        var subViewFrame = subView!.frame;
        subViewFrame.origin.x = self.size.width / 2 - subViewFrame.size.width / 2;
        subViewFrame.origin.y = originY;
        subView!.frame = subViewFrame;
        self.addSubview(subView!);
    }
    
    
    
    
    /**
    * Rotate view by degrees
    */
    public func rotateByDegrees(degrees: CGFloat?)
    {
        if (degrees != nil)
        {
            self.transform = CGAffineTransformMakeRotation(degrees! / CGFloat(180.0) * CGFloat(M_PI));
        }
    }
    
    
    
    
    
    
    
    /**
     * Convert current view to UIImage
     */
    public func toImage(legacy: Bool) -> UIImage?
    {
        var imageToReturn: UIImage? = nil;
        
        autoreleasepool
            {
                UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0);
                let context:CGContext? = UIGraphicsGetCurrentContext();
                if (context != nil)
                {
                    if (legacy == true)
                    {
                        self.layer.renderInContext(context!);
                    }
                    else
                    {
                        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true);
                    }
                    imageToReturn = UIGraphicsGetImageFromCurrentImageContext();
                    UIGraphicsEndImageContext();
                }
                
        }
        return imageToReturn;
    }
    
    /**
     * Convert current view to UIImage
     */
    public func toImage() -> UIImage?
    {
        return self.toImage(true)
    }
    
    
    
    
    /**
     * capture specific frame in to UIImage
     */
    public func captureRect(rect: CGRect) -> UIImage!
    {
        UIGraphicsBeginImageContext(self.frame.size);
        let context = UIGraphicsGetCurrentContext()
        if (context == nil)
        {
            return UIImage();
        }
        self.layer.renderInContext(context!)
        
        let screenShot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        let imageRef = CGImageCreateWithImageInRect(screenShot!.CGImage!, rect);
        if (imageRef == nil)
        {
            return UIImage();
        }
        let screenImage = UIImage(CGImage: imageRef!, scale: screenShot!.scale, orientation:.Up)
        return screenImage;
        
    }
    
    
    
    /**
     * Add parralax effect
     */
    public func addEntorpolation(direction: EntorpolationDirection)
    {
        let group = UIMotionEffectGroup();
        let motionEffects = NSMutableArray();
        let relativeValue = 20;
        
        /* Bot using bitmask in order */
        if (direction == .Horizontal || direction == .Both)
        {
            let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
                type: .TiltAlongHorizontalAxis)
            horizontalMotionEffect.minimumRelativeValue = -1 * relativeValue
            horizontalMotionEffect.maximumRelativeValue = relativeValue
            motionEffects.addObject(horizontalMotionEffect)
        }
        
        
        if (direction == .Vertical || direction == .Both)
        {
            let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
                type: .TiltAlongVerticalAxis)
            verticalMotionEffect.minimumRelativeValue = -1 * relativeValue
            verticalMotionEffect.maximumRelativeValue = relativeValue
            motionEffects.addObject(verticalMotionEffect)
        }
        
        
        group.motionEffects = motionEffects as NSArray as? [UIMotionEffect];
        self.addMotionEffect(group);
    }
}
