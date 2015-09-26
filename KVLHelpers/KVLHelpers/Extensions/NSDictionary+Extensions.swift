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
    public func GetString(key: String!) -> String!
    {
        let value: AnyObject? =  valueForKey(key)
        if (value == nil)
        {
            KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got \"nil\"", key), location: GetCodeLocation())
            return ""
        }
        else
            if (value is String == false)
            {
                KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return ""
        }
        
        return value as! String
    }
    
    
    
    /****************************************************************************************/
    public func GetInteger(key: String!) -> Int!
    {
        let value: AnyObject? =  valueForKey(key)
        if (value == nil)
        {
            KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got \"nil\"", key), location: GetCodeLocation())
            return 0
        }
        else
            if (value is Int == false)
            {
                KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return 0
        }
        
        return value as! Int
    }
    
    
    
    
    /****************************************************************************************/
    public func GetDouble(key: String!) -> Double!
    {
        let value: AnyObject? =  valueForKey(key)
        if (value == nil)
        {
            KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got \"nil\"", key), location: GetCodeLocation())
            return 0.0
        }
        else
            if (value is Double == false)
            {
                KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return 0.0
        }
        
        return value as! Double
    }
    
    
    
    /****************************************************************************************/
    public func GetDict(key: String!) -> NSDictionary!
    {
        let value: AnyObject? =  valueForKey(key)
        if (value == nil)
        {
            KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got \"nil\"", key), location: GetCodeLocation())
            return NSDictionary()
        }
        else
            if (value is NSDictionary == false)
            {
                KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return NSDictionary()
        }
        
        return value as! NSDictionary
    }
    
    
    
    /****************************************************************************************/
    public func GetBool(key: String!) -> Bool!
    {
        let value: AnyObject? =  valueForKey(key)
        if (value == nil)
        {
            KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got \"nil\"", key), location: GetCodeLocation())
            return false
        }
        else
            if (value is Bool == false)
            {
                KVLLogger.printErrorMessage(String(format: "Tried to fetch \"Boolean\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return false
        }
        
        return value as! Bool
    }
}
