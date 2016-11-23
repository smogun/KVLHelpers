//
//  NSString+Extensions.swift
//  KVLHelpers
//
//  Created by Misha Koval on 9/19/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import Foundation

public extension String
{
    public var length: Int { return self.characters.count }
    
    public var pathExtension: String?
    {
        return NSURL(fileURLWithPath: self).pathExtension;
    }
    public var lastPathComponent: String?
    {
        return NSURL(fileURLWithPath: self).lastPathComponent;
    }
    public var stringByDeletingPathExtension: String?
    {
        do
        {
            return try String(contentsOfURL: NSURL(fileURLWithPath: self).URLByDeletingPathExtension!);
        }
        catch
        {
            return self;
        }
    }
    
    func toDictionary() -> [NSObject : AnyObject]?
    {
        if let data = self.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                KVLLogger.printError(error, location: GetCodeLocation())
                
                return nil
            }
        }
        
        return nil
    }
}
