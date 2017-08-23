//
//  RSSCategoryTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class RSSCategoryTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = RSSChannel.Category.parameter
    
    let categoryDictionaryWithDomain: [String: Any] = ["name": "Category Name",
                                                       "domain": "Domain"]
    
    let categoryDictionaryWithoutDomain: [String: Any] = ["name": "Category Name"]
    
    func testShouldThrowParameterNotFoundWhenParsingEmptyDictionary() {
        let emptyDict: [String: Any] = [:]
        
        XCTAssertParameterNotFound(inDictionary: emptyDict)
    }
    
    func testShouldThrowParameterNotFoundWhenParsingDictionaryWithoutName() {
        var dictionaryWithoutName = categoryDictionaryWithDomain
        dictionaryWithoutName.removeValue(forKey: "name")
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutName)
    }
    
    func testShouldParseDictionaryWithDomainIntoCategoryObject() {
        let expectedCategory = RSSChannel.Category(name: categoryDictionaryWithDomain["name"] as! String,
                                                   domain: categoryDictionaryWithDomain["domain"] as? String)
        
        XCTAssertEqualParameter(expectedCategory, withValue: categoryDictionaryWithDomain)
    }
    
    func testShouldParseDictionaryWithoutDomainIntoCategoryObject() {
        let expectedCategory = RSSChannel.Category(name: categoryDictionaryWithoutDomain["name"] as! String,
                                                   domain: .none)
        
        XCTAssertEqualParameter(expectedCategory, withValue: categoryDictionaryWithoutDomain)
    }
    
}
