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
        return URL(fileURLWithPath: self).pathExtension;
    }
    public var lastPathComponent: String?
    {
        return URL(fileURLWithPath: self).lastPathComponent;
    }
    public var stringByDeletingPathExtension: String?
    {
        do
        {
            return try String(contentsOf: NSURL(fileURLWithPath: self).deletingPathExtension!);
        }
        catch
        {
            return self;
        }
    }
    
    func toDictionary() -> [AnyHashable: Any]?
    {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                KVLLogger.printError(error, location: GetCodeLocation())
                
                return nil
            }
        }
        
        return nil
    }
}
