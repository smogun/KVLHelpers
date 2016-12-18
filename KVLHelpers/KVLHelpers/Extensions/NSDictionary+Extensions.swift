//
//  NSDictionary+Extensions.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import Foundation

public extension NSDictionary
{
    /****************************************************************************************/
    public func getString(_ key: String!) -> String!
    {
        let value: AnyObject? =  self.value(forKey: key) as AnyObject?
        if (value == nil)
        {
            return ""
        }
        else
            if (value is String == false)
            {
                //KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return ""
        }
        
        return value as! String
    }
    
    
    /****************************************************************************************/
    public func getNumber(_ key: String!) -> NSNumber!
    {
        let value: AnyObject? =  self.value(forKey: key) as AnyObject?
        if (value == nil)
        {
            return NSNumber(value: 0 as Int)
        }
        else
            if (value is NSNumber == false)
            {
                //KVLLogger.printErrorMessage(String(format: "Tried to fetch \"NSNumber\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return NSNumber(value: 0 as Int)
        }
        
        return value as! NSNumber
    }
    
    
    
    /****************************************************************************************/
    public func getArray(_ key: String!) -> NSArray!
    {
        let value: AnyObject? =  self.value(forKey: key) as AnyObject?
        if (value == nil)
        {
            return NSArray()
        }
        else
            if (value is NSArray == false)
            {
                //KVLLogger.printErrorMessage(String(format: "Tried to fetch \"NSArray\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return NSArray()
        }
        
        return value as! NSArray
    }
    
    
    
    /****************************************************************************************/
    public func getDict(_ key: String!) -> NSDictionary!
    {
        let value: AnyObject? =  self.value(forKey: key) as AnyObject?
        if (value == nil)
        {
            return NSDictionary()
        }
        else
            if (value is NSDictionary == false)
            {
                //KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return NSDictionary()
        }
        
        return value as! NSDictionary
    }
}
