//
//  NSDate+RFC3339Extention.swift
//  KVLHelpers
//
//  Created by Misha Koval on 9/19/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import XCTest
import KVLHelpers

class NSDate_RFC3339Extention: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testUserVisibleDateFromRFC3339DateTimeString()
    {
        
        let test1String = "2002-10-02T10:00:00-05:00"
        let test1Date: NSDate? = NSDate.userVisibleDateFromRFC3339DateTimeString(test1String)
        XCTAssertNotNil(test1Date, String(format: "Failed to parse RFC3339 date string: \"%@\"", test1String))
        
        
        
        
        
        let test2String = "2002-10-02T15:00:00Z"
        let test2Date: NSDate? = NSDate.userVisibleDateFromRFC3339DateTimeString(test2String)
        XCTAssertNotNil(test2Date, String(format: "Failed to parse RFC3339 date string: \"%@\"", test2String))
        
        
        
        
        let test3String = "2002-10-02T15:00:00.05Z"
        let test3Date: NSDate? = NSDate.userVisibleDateFromRFC3339DateTimeString(test3String)
        XCTAssertNotNil(test3Date, String(format: "Failed to parse RFC3339 date string: \"%@\"", test3String))
        
    }
    
    func testUserVisibleDateTimeStringForRFC3339FromDate()
    {
        
        let test1String = "2002-10-02T10:00:00-05:00"
        let test1Date: NSDate? = NSDate.userVisibleDateFromRFC3339DateTimeString(test1String)
        let test1StringFromDate:String? = NSDate.userVisibleDateTimeStringForRFC3339FromDate(test1Date)
        XCTAssertNotNil(test1StringFromDate, String(format: "Failed to parse RFC3339 date to string: \"%@\"", test1String))
        XCTAssert(test1StringFromDate!.length > 0, String(format: "Failed to parse RFC3339 date to string: \"%@\"", test1String))
        
        
        
        
        
        let test2String = "2002-10-02T15:00:00Z"
        let test2Date: NSDate? = NSDate.userVisibleDateFromRFC3339DateTimeString(test2String)
        let test2StringFromDate:String? = NSDate.userVisibleDateTimeStringForRFC3339FromDate(test2Date)
        XCTAssertNotNil(test2StringFromDate, String(format: "Failed to parse RFC3339 date to string: \"%@\"", test2String))
        XCTAssert(test2StringFromDate!.length > 0, String(format: "Failed to parse RFC3339 date to string: \"%@\"", test2String))
        
        
        
        
        let test3String = "2002-10-02T15:00:00.05Z"
        let test3Date: NSDate? = NSDate.userVisibleDateFromRFC3339DateTimeString(test3String)
        let test3StringFromDate:String? = NSDate.userVisibleDateTimeStringForRFC3339FromDate(test3Date)
        XCTAssertNotNil(test3StringFromDate, String(format: "Failed to parse RFC3339 date to string: \"%@\"", test3String))
        XCTAssert(test3StringFromDate!.length > 0, String(format: "Failed to parse RFC3339 date to string: \"%@\"", test3String))
        
        
        
        
        let test4String = NSDate.userVisibleStringForRFC3339FromCurrentDate()
        let test4Date: NSDate? = NSDate.userVisibleDateFromRFC3339DateTimeString(test4String)
        let test4StringFromDate:String? = NSDate.userVisibleDateTimeStringForRFC3339FromDate(test4Date)
        XCTAssertNotNil(test4StringFromDate, String(format: "Failed to parse RFC3339 date to string: \"%@\"", test4String!))
        XCTAssert(test4StringFromDate!.length > 0, String(format: "Failed to parse RFC3339 date to string: \"%@\"", test4String!))
    }
}
