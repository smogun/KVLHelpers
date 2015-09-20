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

    private var dict: NSDictionary! = NSDictionary()
    
    private let integerKey      = "integer"
    private let doubleKey       = "double"
    private let booleanKey      = "boolean"
    private let stringKey       = "string"
    private let dictionaryKey   = "dictionary"
    private let nsNullKey       = "nsNull"
    
    private let integerValue    = 5
    private let doubleValue     = 2.123
    private let booleanValue    = true
    private let stringValue     = "bla bla"
    private let dictionaryValue = ["one": 1, "two": 2]
    private let nsNullValue     = NSNull()
    
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
        let integer = dict.GetInteger(integerKey)
        XCTAssertNotNil(integer, "Must not be nil")
        XCTAssert(integer == integerValue, "Incorrect value")
        
        let double = dict.GetDouble(doubleKey)
        XCTAssertNotNil(double, "Must not be nil")
        XCTAssert(double == doubleValue, "Incorrect value")
        
        let boolean = dict.GetBool(booleanKey)
        XCTAssertNotNil(boolean, "Must not be nil")
        XCTAssert(boolean == booleanValue, "Incorrect value")
        
        let string = dict.GetString(stringKey)
        XCTAssertNotNil(string, "Must not be nil")
        XCTAssert(string == stringValue, "Incorrect value")
        
        let dictionary = dict.GetDict(dictionaryKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary == dictionaryValue, "Incorrect value")
    }
    
    func testInValidFetchFromDictionary()
    {
        let integer = dict.GetInteger(dictionaryKey)
        XCTAssertNotNil(integer, "Must not be nil")
        XCTAssert(integer == 0, "Has to be 0")
        
        let double = dict.GetDouble(dictionaryKey)
        XCTAssertNotNil(double, "Must not be nil")
        XCTAssert(double == 0.0, "Has to be 0.0")
        
        let boolean = dict.GetBool(dictionaryKey)
        XCTAssertNotNil(boolean, "Must not be nil")
        XCTAssert(boolean == false, "Has to be false")
        
        let string = dict.GetString(dictionaryKey)
        XCTAssertNotNil(string, "Must not be nil")
        XCTAssert(string.length == 0, "Has to be empty")
        
        let dictionary = dict.GetDict(stringKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary.allKeys.count == 0, "Has to be empty")
    }
    
    func testMissingObjectsInDictionary()
    {
        let nonExistantValueKey = "bla bla bla"
        let integer = dict.GetInteger(nonExistantValueKey)
        XCTAssertNotNil(integer, "Must not be nil")
        XCTAssert(integer == 0, "Has to be 0")
        
        let double = dict.GetDouble(nonExistantValueKey)
        XCTAssertNotNil(double, "Must not be nil")
        XCTAssert(double == 0.0, "Has to be 0.0")
        
        let boolean = dict.GetBool(nonExistantValueKey)
        XCTAssertNotNil(boolean, "Must not be nil")
        XCTAssert(boolean == false, "Has to be false")
        
        let string = dict.GetString(nonExistantValueKey)
        XCTAssertNotNil(string, "Must not be nil")
        XCTAssert(string.length == 0, "Has to be empty")
        
        let dictionary = dict.GetDict(nonExistantValueKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary.allKeys.count == 0, "Has to be empty")
    }
    
    
    
    func testNSNullObjectsInDictionary()
    {
        let integer = dict.GetInteger(nsNullKey)
        XCTAssertNotNil(integer, "Must not be nil")
        XCTAssert(integer == 0, "Has to be 0")
        
        let double = dict.GetDouble(nsNullKey)
        XCTAssertNotNil(double, "Must not be nil")
        XCTAssert(double == 0.0, "Has to be 0.0")
        
        let boolean = dict.GetBool(nsNullKey)
        XCTAssertNotNil(boolean, "Must not be nil")
        XCTAssert(boolean == false, "Has to be false")
        
        let string = dict.GetString(nsNullKey)
        XCTAssertNotNil(string, "Must not be nil")
        XCTAssert(string.length == 0, "Has to be empty")
        
        let dictionary = dict.GetDict(nsNullKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary.allKeys.count == 0, "Has to be empty")
    }
}