//
//  UIImage+Extension.swift
//  Pods
//
//  Created by Misha Koval on 18/04/2016.
//
//

import UIKit

extension UIImage {
    @objc func imageByApplyingAlpha(_ alpha: CGFloat) -> UIImage!
    {
       
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0);
        
        let ctx:CGContext? = UIGraphicsGetCurrentContext();
        let area = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.size.width, height: self.size.height);
        
        ctx!.scaleBy(x: CGFloat(1), y: CGFloat(-1));
        ctx!.translateBy(x: CGFloat(0), y: -area.size.height);
        
        ctx!.setBlendMode(.multiply);
        
        ctx!.setAlpha(alpha);
        
        ctx!.draw(self.cgImage!, in: area);
        
        let newImage:UIImage? = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return newImage;
 
  
    }
    
    @objc func imageRotatedTo(orientation: UIImage.Orientation) -> UIImage
    {
        
        UIGraphicsBeginImageContext(self.size);
        let context = UIGraphicsGetCurrentContext()!
        
        if orientation == .right {
            context.rotate (by: degreesToRadians(deg: CGFloat(90)));
        } else if orientation == .left {
            context.rotate (by: degreesToRadians(deg: CGFloat(-90)));
        } else if orientation == .down {
            // NOTHING
        } else if orientation == .up {
            context.rotate (by: degreesToRadians(deg: CGFloat(90)));
        }
        
        self.draw(at: CGPoint(x: 0, y: 0))


        

        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        return image;
    }
    
    @objc func imageRotatedByDegrees(_ degrees: CGFloat) -> UIImage
    {
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox:UIView = UIView(frame:CGRect(x: CGFloat(0), y: CGFloat(0), width: self.size.width, height: self.size.height));
        let t:CGAffineTransform = CGAffineTransform(rotationAngle: degrees * CGFloat.pi / CGFloat(180.0));
        rotatedViewBox.transform = t;
        let rotatedSize:CGSize = rotatedViewBox.frame.size;
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize);
        let bitmap:CGContext? = UIGraphicsGetCurrentContext();
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap!.translateBy(x: rotatedSize.width/CGFloat(2), y: rotatedSize.height/CGFloat(2));
        
        //   // Rotate the image context
        bitmap!.rotate(by: (degrees * CGFloat.pi / CGFloat(180.0)));
        
        // Now, draw the rotated/scaled image into the context
        bitmap!.scaleBy(x: CGFloat(1.0), y: CGFloat(-1.0));
        bitmap!.draw(self.cgImage!, in: CGRect(x: -self.size.width / CGFloat(2), y: -self.size.height / CGFloat(2), width: self.size.width, height: self.size.height));
        
        let newImage:UIImage? = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage!;
    }
    
    @objc static func imageFromColor(_ color: UIColor!) -> UIImage
    {
        return UIImage.imageFromColor(color, size:CGSize(width: CGFloat(1), height: CGFloat(1)));
    }
    
    
    @objc static func imageFromColor(_ color: UIColor!, size: CGSize) -> UIImage
    {
        let rect:CGRect = CGRect(x: CGFloat(0), y: CGFloat(0), width: size.width, height: size.height);
        UIGraphicsBeginImageContext(rect.size);
        let context:CGContext? = UIGraphicsGetCurrentContext();
        
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        
        let image:UIImage? = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!;
    }
    
    func degreesToRadians(deg: CGFloat) -> CGFloat
    {
        return deg * .pi/CGFloat(180)
    }
}
