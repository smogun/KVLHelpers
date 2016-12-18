//
//  NSDictionary+ExtensionsTests.swift
//  KVLHelpers
//
//  Created by Misha Koval on 9/19/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import XCTest
import KVLHelpers

class NSDictionary_ExtensionsTests: XCTestCase {

    fileprivate var dict: NSDictionary! = NSDictionary()
    
    fileprivate let integerKey      = "integer"
    fileprivate let doubleKey       = "double"
    fileprivate let booleanKey      = "boolean"
    fileprivate let stringKey       = "string"
    fileprivate let dictionaryKey   = "dictionary"
    fileprivate let nsNullKey       = "nsNull"
    
    fileprivate let integerValue    = 5
    fileprivate let doubleValue     = 2.123
    fileprivate let booleanValue    = true
    fileprivate let stringValue     = "bla bla"
    fileprivate let dictionaryValue = ["one": 1, "two": 2]
    fileprivate let nsNullValue     = NSNull()
    
    override func setUp() {
        super.setUp()
        
        dict =
        [
            integerKey      : integerValue,
            doubleKey       : doubleValue,
            booleanKey      : booleanValue,
            stringKey       : stringValue,
            dictionaryKey   : dictionaryValue,
            nsNullKey       : nsNullValue
        ]
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidFetchFromDictionary()
    {
        let integer = dict.getNumber(integerKey).intValue
        XCTAssertNotNil(integer, "Must not be nil")
        XCTAssert(integer == integerValue, "Incorrect value")
        
        let double = dict.getNumber(doubleKey).doubleValue
        XCTAssertNotNil(double, "Must not be nil")
        XCTAssert(double == doubleValue, "Incorrect value")
        
        let boolean = dict.getNumber(booleanKey).boolValue
        XCTAssertNotNil(boolean, "Must not be nil")
        XCTAssert(boolean == booleanValue, "Incorrect value")
        
        let string = dict.getString(stringKey)
        XCTAssertNotNil(string, "Must not be nil")
        XCTAssert(string == stringValue, "Incorrect value")
        
        let dictionary = dict.getDict(dictionaryKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary as! [String : Int] == dictionaryValue, "Incorrect value")
    }
    
    func testInValidFetchFromDictionary()
    {
        let integer = dict.getNumber(dictionaryKey).intValue
        XCTAssertNotNil(integer, "Must not be nil")
        XCTAssert(integer == 0, "Has to be 0")
        
        let double = dict.getNumber(dictionaryKey).doubleValue
        XCTAssertNotNil(double, "Must not be nil")
        XCTAssert(double == 0.0, "Has to be 0.0")
        
        let boolean = dict.getNumber(dictionaryKey).boolValue
        XCTAssertNotNil(boolean, "Must not be nil")
        XCTAssert(boolean == false, "Has to be false")
        
        let string = dict.getString(dictionaryKey)
        XCTAssertNotNil(string, "Must not be nil")
        XCTAssert(string!.length == 0, "Has to be empty")
        
        let dictionary = dict.getDict(stringKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary!.allKeys.count == 0, "Has to be empty")
    }
    
    func testMissingObjectsInDictionary()
    {
        let nonExistantValueKey = "bla bla bla"
        let integer = dict.getNumber(nonExistantValueKey).intValue
        XCTAssertNotNil(integer, "Must not be nil")
        XCTAssert(integer == 0, "Has to be 0")
        
        let double = dict.getNumber(nonExistantValueKey).doubleValue
        XCTAssertNotNil(double, "Must not be nil")
        XCTAssert(double == 0.0, "Has to be 0.0")
        
        let boolean = dict.getNumber(nonExistantValueKey).boolValue
        XCTAssertNotNil(boolean, "Must not be nil")
        XCTAssert(boolean == false, "Has to be false")
        
        let string = dict.getString(nonExistantValueKey)
        XCTAssertNotNil(string, "Must not be nil")
        XCTAssert(string!.length == 0, "Has to be empty")
        
        let dictionary = dict.getDict(nonExistantValueKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary!.allKeys.count == 0, "Has to be empty")
    }
    
    
    
    func testNSNullObjectsInDictionary()
    {
        let integer = dict.getNumber(nsNullKey).intValue
        XCTAssertNotNil(integer, "Must not be nil")
        XCTAssert(integer == 0, "Has to be 0")
        
        let double = dict.getNumber(nsNullKey).doubleValue
        XCTAssertNotNil(double, "Must not be nil")
        XCTAssert(double == 0.0, "Has to be 0.0")
        
        let boolean = dict.getNumber(nsNullKey).boolValue
        XCTAssertNotNil(boolean, "Must not be nil")
        XCTAssert(boolean == false, "Has to be false")
        
        let string = dict.getString(nsNullKey)
        XCTAssertNotNil(string, "Must not be nil")
        XCTAssert(string!.length == 0, "Has to be empty")
        
        let dictionary = dict.getDict(nsNullKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary!.allKeys.count == 0, "Has to be empty")
    }
}
