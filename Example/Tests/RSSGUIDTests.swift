//
//  RSSGUIDTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/24.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class RSSGUIDTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = RSSChannel.GUID.parameter
    
    let guidDictionaryWithPermaLink: [String: Any] = ["guid": "unique",
                                                      "isPermaLink": true]
    
    let guidDictionaryWithoutPermaLink: [String: Any] = ["guid": "unique"]
    
    func testShouldThrowParameterNotFoundWhenParsingEmptyDictionary() {
        let emptyDict: [String: Any] = [:]
        
        XCTAssertParameterNotFound(inDictionary: emptyDict)
    }
    
    func testShouldThrowParameterNotFoundWhenParsingDictionaryWithoutGuid() {
        let key = "guid"
        var dictionaryWithoutGuid = guidDictionaryWithPermaLink
        dictionaryWithoutGuid.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutGuid)
    }
    
    func testShouldParseDictionaryWithPermaLinkIntoGUIDObject() {
        let expectedGuid = RSSChannel.GUID(uniqueId: guidDictionaryWithPermaLink["guid"] as! String,
                                           isPermaLink: guidDictionaryWithPermaLink["isPermaLink"] as? Bool)
        
        XCTAssertEqualParameter(expectedGuid, withValue: guidDictionaryWithPermaLink)
    }
    
    func testShouldParseDictionaryWithoutPermaLinkIntoGUIDObject() {
        let expectedGuid = RSSChannel.GUID(uniqueId: guidDictionaryWithoutPermaLink["guid"] as! String,
                                           isPermaLink: .none)
        
        XCTAssertEqualParameter(expectedGuid, withValue: guidDictionaryWithoutPermaLink)
    }
    
}
