//
//  UIImage+Extension.swift
//  Pods
//
//  Created by Misha Koval on 18/04/2016.
//
//

import UIKit

public extension UIImage {
    public func imageByApplyingAlpha(_ alpha: CGFloat) -> UIImage!
    {        
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0);
        
        let ctx = UIGraphicsGetCurrentContext();
        let area = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height);
        
        ctx!.scaleBy(x: 1, y: -1);
        ctx!.translateBy(x: 0, y: -area.size.height);
        
        ctx!.setBlendMode(.multiply);
        
        ctx!.setAlpha(alpha);
        
        ctx!.draw(self.cgImage!, in: area);
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
    
    public func imageRotatedByDegrees(_ degrees: CGFloat) -> UIImage
    {
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame:CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height));
        let t = CGAffineTransform(rotationAngle: degrees * CGFloat(M_PI) / CGFloat(180.0));
        rotatedViewBox.transform = t;
        let rotatedSize = rotatedViewBox.frame.size;
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize);
        let bitmap = UIGraphicsGetCurrentContext();
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap!.translateBy(x: rotatedSize.width/2, y: rotatedSize.height/2);
        
        //   // Rotate the image context
        bitmap!.rotate(by: (degrees * CGFloat(M_PI) / CGFloat(180.0)));
        
        // Now, draw the rotated/scaled image into the context
        bitmap!.scaleBy(x: 1.0, y: -1.0);
        bitmap!.draw(self.cgImage!, in: CGRect(x: -self.size.width / 2, y: -self.size.height / 2, width: self.size.width, height: self.size.height));
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage!;
    }
    
    public static func imageFromColor(_ color: UIColor!) -> UIImage
    {
        return UIImage.imageFromColor(color, size:CGSize(width: 1.0, height: 1.0));
    }
    
    
    public static func imageFromColor(_ color: UIColor!, size: CGSize) -> UIImage
    {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height);
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!;
    }
}
