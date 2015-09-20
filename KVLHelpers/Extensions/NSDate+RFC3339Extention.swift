//
//  NSDate+RFC3339Extention.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import Foundation

public extension NSDate
{
    //This is most common format
    private static var sRFC3339DateFormatterType1: NSDateFormatter =
    {
        let enUSPOSIXLocale: NSLocale? = NSLocale(localeIdentifier: "en_US_POSIX")
        assert(enUSPOSIXLocale != nil, "enUSPOSIXLocale must not be nil")
        
        let dateFormatter:NSDateFormatter? = NSDateFormatter()
        assert(dateFormatter != nil, "dateFormatter must not be nil")
        
        dateFormatter!.locale = enUSPOSIXLocale;
        dateFormatter!.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
        dateFormatter!.timeZone = NSTimeZone(forSecondsFromGMT:0);
        
        return dateFormatter!;
    }()
    
    private static var sRFC3339DateFormatterType2: NSDateFormatter =
    {
        let enUSPOSIXLocale: NSLocale? = NSLocale(localeIdentifier: "en_US_POSIX")
        assert(enUSPOSIXLocale != nil, "enUSPOSIXLocale must not be nil")
        
        let dateFormatter:NSDateFormatter? = NSDateFormatter()
        assert(dateFormatter != nil, "dateFormatter must not be nil")
        
        dateFormatter!.locale = enUSPOSIXLocale;
        dateFormatter!.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'ms'Z'"
        dateFormatter!.timeZone = NSTimeZone(forSecondsFromGMT:0);
        
        return dateFormatter!;
    }()
    
    private static var sRFC3339DateFormatterType3: NSDateFormatter =
    {
        let enUSPOSIXLocale: NSLocale? = NSLocale(localeIdentifier: "en_US_POSIX")
        assert(enUSPOSIXLocale != nil, "enUSPOSIXLocale must not be nil")
        
        let dateFormatter:NSDateFormatter? = NSDateFormatter()
        assert(dateFormatter != nil, "dateFormatter must not be nil")
        
        dateFormatter!.locale = enUSPOSIXLocale;
        dateFormatter!.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'-'HH':'mm'"
        dateFormatter!.timeZone = NSTimeZone(forSecondsFromGMT:0);
        
        return dateFormatter!;
        }()
    
    
    // Returns a user-visible date time string that corresponds to the
    // specified RFC 3339 date time string. Note that this does not handle
    // all possible RFC 3339 date time strings, just some of the most common
    // styles.
    @objc
    class func userVisibleDateFromRFC3339DateTimeString(rfc3339DateTimeString: String!) -> NSDate?
    {
        let format1Date = sRFC3339DateFormatterType1.dateFromString(rfc3339DateTimeString);
        if (format1Date != nil)
        {
            return format1Date
        }
        
        let format2Date = sRFC3339DateFormatterType2.dateFromString(rfc3339DateTimeString);
        if (format2Date != nil)
        {
            return format2Date
        }
        return sRFC3339DateFormatterType3.dateFromString(rfc3339DateTimeString);
    }
    
    
    
    
    @objc
    class func userVisibleDateTimeStringForRFC3339FromDate(date: NSDate!) -> String!
    {
        return sRFC3339DateFormatterType1.stringFromDate(date)
    }
    
    
    
    @objc
    class func userVisibleStringForRFC3339FromCurrentDate() -> String!
    {
        return NSDate.userVisibleDateTimeStringForRFC3339FromDate(NSDate())
    }
}