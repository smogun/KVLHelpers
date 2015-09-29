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
        let integer = dict.getNumber(integerKey).integerValue
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
        XCTAssert(dictionary == dictionaryValue, "Incorrect value")
    }
    
    func testInValidFetchFromDictionary()
    {
        let integer = dict.getNumber(dictionaryKey).integerValue
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
        XCTAssert(string.length == 0, "Has to be empty")
        
        let dictionary = dict.getDict(stringKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary.allKeys.count == 0, "Has to be empty")
    }
    
    func testMissingObjectsInDictionary()
    {
        let nonExistantValueKey = "bla bla bla"
        let integer = dict.getNumber(nonExistantValueKey).integerValue
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
        XCTAssert(string.length == 0, "Has to be empty")
        
        let dictionary = dict.getDict(nonExistantValueKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary.allKeys.count == 0, "Has to be empty")
    }
    
    
    
    func testNSNullObjectsInDictionary()
    {
        let integer = dict.getNumber(nsNullKey).integerValue
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
        XCTAssert(string.length == 0, "Has to be empty")
        
        let dictionary = dict.getDict(nsNullKey)
        XCTAssertNotNil(dictionary, "Must not be nil")
        XCTAssert(dictionary.allKeys.count == 0, "Has to be empty")
    }
}
