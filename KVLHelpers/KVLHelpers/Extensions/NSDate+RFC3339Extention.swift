//
//  NSDate+RFC3339Extention.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import Foundation

extension Date
{
    
    //yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
    //yyyy-MM-dd'T'HH:mm:ss'Z'
    fileprivate static var RFC3339DateFormatDefault = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    fileprivate static var RFC3339DateFormat1 = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'" /* This is most common format */
    fileprivate static var RFC3339DateFormat2 = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'ms'Z'"
    fileprivate static var RFC3339DateFormat3 = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'-'HH':'mm'"
 
    fileprivate static var RFC3339DateFormatterDefault: DateFormatter = {
        let enUSPOSIXLocale: Locale? = Locale(identifier: "en_US_POSIX")
        assert(enUSPOSIXLocale != nil, "enUSPOSIXLocale must not be nil")
        
        let dateFormatter:DateFormatter? = DateFormatter()
        assert(dateFormatter != nil, "dateFormatter must not be nil")
        
        dateFormatter!.locale = enUSPOSIXLocale
        dateFormatter!.dateFormat = RFC3339DateFormatDefault
        dateFormatter!.timeZone = TimeZone(secondsFromGMT:0)
        
        return dateFormatter!
    }()
    
    fileprivate static var RFC3339DateFormatter1: DateFormatter = {
        let enUSPOSIXLocale: Locale? = Locale(identifier: "en_US_POSIX")
        assert(enUSPOSIXLocale != nil, "enUSPOSIXLocale must not be nil")
        
        let dateFormatter:DateFormatter? = DateFormatter()
        assert(dateFormatter != nil, "dateFormatter must not be nil")
        
        dateFormatter!.locale = enUSPOSIXLocale
        dateFormatter!.dateFormat = RFC3339DateFormat1
        dateFormatter!.timeZone = TimeZone(secondsFromGMT:0)
        
        return dateFormatter!
    }()
    
    
    fileprivate static var RFC3339DateFormatter2: DateFormatter = {
        let enUSPOSIXLocale: Locale? = Locale(identifier: "en_US_POSIX")
        assert(enUSPOSIXLocale != nil, "enUSPOSIXLocale must not be nil")
        
        let dateFormatter:DateFormatter? = DateFormatter()
        assert(dateFormatter != nil, "dateFormatter must not be nil")
        
        dateFormatter!.locale = enUSPOSIXLocale
        dateFormatter!.dateFormat = RFC3339DateFormat2
        dateFormatter!.timeZone = TimeZone(secondsFromGMT:0)
        
        return dateFormatter!
    }()
    
    fileprivate static var RFC3339DateFormatter3: DateFormatter = {
        let enUSPOSIXLocale: Locale? = Locale(identifier: "en_US_POSIX")
        assert(enUSPOSIXLocale != nil, "enUSPOSIXLocale must not be nil")
        
        let dateFormatter:DateFormatter? = DateFormatter()
        assert(dateFormatter != nil, "dateFormatter must not be nil")
        
        dateFormatter!.locale = enUSPOSIXLocale
        dateFormatter!.dateFormat = RFC3339DateFormat3
        dateFormatter!.timeZone = TimeZone(secondsFromGMT:0)
        
        return dateFormatter!
    }()
    
 
    
    // Returns a user-visible date time string that corresponds to the
    // specified RFC 3339 date time string. Note that this does not handle
    // all possible RFC 3339 date time strings, just some of the most common
    // styles.
    
     static func userVisibleDateFromRFC3339DateTimeString(_ rfc3339DateTimeString: String?) -> Date?
    {
        if (rfc3339DateTimeString == nil)
        {
            return nil
        }
        
        var dateToReturn:Date? = RFC3339DateFormatterDefault.date(from: rfc3339DateTimeString!)
        if (dateToReturn != nil)
        {
            return dateToReturn
        }
 
        dateToReturn = RFC3339DateFormatter1.date(from: rfc3339DateTimeString!)
        if (dateToReturn != nil)
        {
            return dateToReturn
        }
        
        dateToReturn = RFC3339DateFormatter2.date(from: rfc3339DateTimeString!)
        if (dateToReturn != nil)
        {
            return dateToReturn
        }
        
        dateToReturn = RFC3339DateFormatter3.date(from: rfc3339DateTimeString!)
        
        return dateToReturn
    }
    
    
    
    
    
    static func userVisibleDateTimeStringForRFC3339FromDate(_ date: Date?) -> String?
    {
        if (date == nil)
        {
            return nil
        }
        return RFC3339DateFormatter1.string(from: date!)
    }
  
    static func userVisibleStringForRFC3339FromCurrentDate() -> String?
    {
        let currentDate: Date? = Date()
        if (currentDate == nil)
        {
            return nil
        }
        return Date.userVisibleDateTimeStringForRFC3339FromDate(currentDate!)
    }
}
