//
//  UIImage+Extension.swift
//  Pods
//
//  Created by Misha Koval on 18/04/2016.
//
//

import UIKit

public extension UIImage {
    public func imageByApplyingAlpha(alpha: CGFloat) -> UIImage!
    {        
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0);
        
        let ctx = UIGraphicsGetCurrentContext();
        let area = CGRectMake(0, 0, self.size.width, self.size.height);
        
        CGContextScaleCTM(ctx, 1, -1);
        CGContextTranslateCTM(ctx, 0, -area.size.height);
        
        CGContextSetBlendMode(ctx, .Multiply);
        
        CGContextSetAlpha(ctx, alpha);
        
        CGContextDrawImage(ctx, area, self.CGImage);
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
    
    public func imageRotatedByDegrees(degrees: CGFloat) -> UIImage
    {
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame:CGRectMake(0, 0, self.size.width, self.size.height));
        let t = CGAffineTransformMakeRotation(degrees * CGFloat(M_PI) / CGFloat(180.0));
        rotatedViewBox.transform = t;
        let rotatedSize = rotatedViewBox.frame.size;
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize);
        let bitmap = UIGraphicsGetCurrentContext();
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
        
        //   // Rotate the image context
        CGContextRotateCTM(bitmap, (degrees * CGFloat(M_PI) / CGFloat(180.0)));
        
        // Now, draw the rotated/scaled image into the context
        CGContextScaleCTM(bitmap, 1.0, -1.0);
        CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), self.CGImage);
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
    
    public static func imageFromColor(color: UIColor!) -> UIImage
    {
        return UIImage.imageFromColor(color, size:CGSizeMake(1.0, 1.0));
    }
    
    
    public static func imageFromColor(color: UIColor!, size: CGSize) -> UIImage
    {
        let rect = CGRectMake(0.0, 0.0, size.width, size.height);
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
}
