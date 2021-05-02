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
    case horizontal = 1
    case vertical   = 2
    case both       = 3
}



@objc public extension UIView
{
    /**
    * Shortcut for frame.origin
    */
    @objc var origin:CGPoint{get{return self.frame.origin}}
    
    
    
    
    /**
    * Shortcut for frame.size
    */
    @objc var size:CGSize{get{return self.frame.size}}
    
    
    
    
    /**
    * Shortcut for frame.origin.x + width
    */
    @objc var endX:CGFloat{get{return self.frame.origin.x + self.frame.size.width}}
    
    
    
    
    /**
    * Shortcut for frame.origin.y + frame.size.height
    */
    @objc var endY:CGFloat{get{return self.frame.origin.y + self.frame.size.height}}
    
    
    
    
    /**
    * Shortcut to change frame's width
    */
    @objc @inline(__always) func changeWidth(_ newWidth: CGFloat)
    {
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: newWidth, height: self.frame.size.height);
    }
    
    
    
    
    /**
    * Shortcut to change frame's height
    */
    @objc @inline(__always) func changeHeight(_ newHeight: CGFloat)
    {
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: newHeight);
    }
    
    
    
    
    /**
    * Shortcut to add subview at center of view
    */
    @objc func addSubviewAtCenter(_ subView: UIView?)
    {
        if (subView == nil)
        {
            return;
        }
        
        var subViewFrame:CGRect = subView!.frame;
        subViewFrame.origin.x = self.size.width / 2 - subViewFrame.size.width / 2;
        subViewFrame.origin.y = self.size.height / 2 - subViewFrame.size.height / 2;
        subView!.frame = subViewFrame;
        self.addSubview(subView!);
    }
    
    
    
    
    /**
    * Shortcut to add subview at center of view horizontally
    */
    @objc func addSubviewAtCenterHorizontally(_ subView: UIView?, originY: CGFloat)
    {
        if (subView == nil)
        {
            return;
        }
        
        var subViewFrame:CGRect = subView!.frame;
        subViewFrame.origin.x = self.size.width / CGFloat(2) - subViewFrame.size.width / CGFloat(2);
        subViewFrame.origin.y = originY;
        subView!.frame = subViewFrame;
        self.addSubview(subView!);
    }
    
    
    
    
    /**
    * Rotate view by degrees
    */
    @objc func rotateByDegrees(_ degrees: CGFloat)
    {
        self.transform = CGAffineTransform(rotationAngle: degrees * .pi / CGFloat(180)) // self.transform.rotated(by: degrees / CGFloat(180.0) * CGFloat(-3.0 * CGFloat.pi));
    }
    
    
    
    
    
    
    
    /**
     * Convert current view to UIImage
     */
    @objc func toImage(_ legacy: Bool) -> UIImage?
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
                        self.layer.render(in: context!);
                    }
                    else
                    {
                        //faster than render
                        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true);
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
    @objc func toImage() -> UIImage?
    {
       return self.toImage(true)
 
    }


    @objc func toImageGoodQuality() -> UIImage?
    {
        var imageToReturn: UIImage? = nil;

        autoreleasepool
            {
                UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0);
                let context:CGContext? = UIGraphicsGetCurrentContext();
                if (context != nil)
                {

                        //faster than render
                        self.drawHierarchy(in: self.bounds, afterScreenUpdates: false);

                    imageToReturn = UIGraphicsGetImageFromCurrentImageContext();
                    UIGraphicsEndImageContext();
                }

        }
        return imageToReturn;
    }
 
    /**
     * capture specific frame in to UIImage
     */
    @objc func captureRect(_ rect: CGRect) -> UIImage!
    {
        UIGraphicsBeginImageContext(self.frame.size);
        let context:CGContext? = UIGraphicsGetCurrentContext()
        if (context == nil)
        {
            return UIImage();
        }
        self.layer.render(in: context!)
        
        let screenShot:UIImage? = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        let imageRef:CGImage? = screenShot!.cgImage!.cropping(to: rect);
        if (imageRef == nil)
        {
            return UIImage();
        }
        let screenImage = UIImage(cgImage: imageRef!, scale: screenShot!.scale, orientation:.up)
        return screenImage;
        
    }
    
    
    
    /**
     * Add parralax effect
     */
    @objc func addEntorpolation(_ direction: EntorpolationDirection)
    {
        let group:UIMotionEffectGroup = UIMotionEffectGroup()
        let motionEffects:NSMutableArray = NSMutableArray();
        let relativeValue:Int = Int(20);
        
        /* Bot using bitmask in order */
        if (direction == .horizontal || direction == .both)
        {
            let horizontalMotionEffect:UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
                type: .tiltAlongHorizontalAxis)
            horizontalMotionEffect.minimumRelativeValue = -1 * relativeValue
            horizontalMotionEffect.maximumRelativeValue = relativeValue
            motionEffects.add(horizontalMotionEffect)
        }
        
        
        if (direction == .vertical || direction == .both)
        {
            let verticalMotionEffect:UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
                type: .tiltAlongVerticalAxis)
            verticalMotionEffect.minimumRelativeValue = -1 * relativeValue
            verticalMotionEffect.maximumRelativeValue = relativeValue
            motionEffects.add(verticalMotionEffect)
        }
        
        
        group.motionEffects = motionEffects as NSArray as? [UIMotionEffect];
        self.addMotionEffect(group);
    }
}
