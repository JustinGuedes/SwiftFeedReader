//
//  RSSTextInputTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class RSSTextInputTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = RSS.TextInput.parameter
    
    let textInputDictionary: [String: Any] = ["title": "Text Input Title",
                                              "description": "Description",
                                              "name": "Name",
                                              "link": "http://www.google.com"]
    
    func testShouldThrowParameterNotFoundWhenParsingEmptyDictionary() {
        let emptyDict: [String: Any] = [:]
        
        XCTAssertParameterNotFound(inDictionary: emptyDict)
    }
    
    func testShouldThrowParameterNotFouncWhenParsingDictionaryWithoutTitle() {
        let key = "title"
        var dictionaryWithoutTitle = textInputDictionary
        dictionaryWithoutTitle.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutTitle)
    }
    
    func testShouldThrowParameterNotFouncWhenParsingDictionaryWithoutDescription() {
        let key = "description"
        var dictionaryWithoutDescription = textInputDictionary
        dictionaryWithoutDescription.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutDescription)
    }
    
    func testShouldThrowParameterNotFouncWhenParsingDictionaryWithoutName() {
        let key = "name"
        var dictionaryWithoutName = textInputDictionary
        dictionaryWithoutName.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutName)
    }
    
    func testShouldThrowParameterNotFouncWhenParsingDictionaryWithoutLink() {
        let key = "link"
        var dictionaryWithoutLink = textInputDictionary
        dictionaryWithoutLink.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutLink)
    }
    
    func testShouldParseDictionaryIntoTextInputObject() {
        let expectedTextInput = RSS.TextInput(title: textInputDictionary["title"] as! String,
                                              description: textInputDictionary["description"] as! String,
                                              name: textInputDictionary["name"] as! String,
                                              link: URL(string: textInputDictionary["link"] as! String)!)
        
        XCTAssertEqualParameter(expectedTextInput, withValue: textInputDictionary)
    }
    
}
