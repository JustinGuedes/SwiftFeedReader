//
//  RSSImageTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/24.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class RSSImageTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = RSSChannel.Image.parameter
    
    let imageWithDimensions: [String: Any] = ["url": "http://www.imageUrl.com",
                                              "title": "Image Title",
                                              "link": "http://www.linkToWebsite.com",
                                              "width": 100,
                                              "height": 100]
    
    let imageWithoutDimensions: [String: Any] = ["url": "http://www.imageUrl.com",
                                                 "title": "Image Title",
                                                 "link": "http://www.linkToWebsite.com"]
    
    func testShouldThrowParameterNotFoundWhenParsingEmptyDict() {
        let emptyDict: [String: Any] = [:]
        
        XCTAssertParameterNotFound(inDictionary: emptyDict)
    }
    
    func testShouldThrowParameterNotFoundWhenParsingDictionaryWithoutUrl() {
        let key = "url"
        var dictionaryWithoutUrl = imageWithDimensions
        dictionaryWithoutUrl.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutUrl)
    }
    
    func testShouldThrowParameterNotFoundWhenParsingDictionaryWithoutTitle() {
        let key = "title"
        var dictionaryWithoutTitle = imageWithDimensions
        dictionaryWithoutTitle.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutTitle)
    }
    
    func testShouldThrowParameterNotFoundWhenParsingDictionaryWithoutLink() {
        let key = "link"
        var dictionaryWithoutLink = imageWithDimensions
        dictionaryWithoutLink.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutLink)
    }
    
    func testShouldParseDictionaryWithDimensionsIntoImageObject() {
        let expectedImage = RSSChannel.Image(url: URL(string: imageWithDimensions["url"] as! String)!,
                                             title: imageWithDimensions["title"] as! String,
                                             link: URL(string: imageWithDimensions["link"] as! String)!,
                                             width: imageWithDimensions["width"] as? Int,
                                             height: imageWithDimensions["height"] as? Int)
        
        XCTAssertEqualParameter(expectedImage, withValue: imageWithDimensions)
    }
    
    func testShouldParseDictionaryWithoutDimensionsIntoImageObject() {
        let expectedImage = RSSChannel.Image(url: URL(string: imageWithoutDimensions["url"] as! String)!,
                                             title: imageWithoutDimensions["title"] as! String,
                                             link: URL(string: imageWithoutDimensions["link"] as! String)!,
                                             width: .none,
                                             height: .none)
        
        XCTAssertEqualParameter(expectedImage, withValue: imageWithoutDimensions)
    }
    
}
