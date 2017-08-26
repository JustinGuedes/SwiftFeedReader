//
//  RSSItemTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/24.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class RSSItemTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = RSS.Item.parameter
    
    let itemDictionary: [String: Any] = ["title": "Title",
                                         "link": "http://www.google.com",
                                         "description": "Description",
                                         "author": "Author",
                                         "category": [
                                            ["category": "Example"],
                                            ["category": "Example 2",
                                             "domain": "http://www.google.com"]
                                            ],
                                         "comments": "http://www.google.com/comments",
                                         "enclosure": ["url": "http://www.google.com",
                                                       "length": 12345,
                                                       "type": "audio/mpeg"],
                                         "guid": ["guid": "GUID One"],
                                         "pubDate": "Sun, 19 May 2002 15:21:36 GMT",
                                         "source": ["source": "Channel Source",
                                                    "url": "http://www.google.com"]]
    
    let itemDictionaryWithOnlyTitle: [String: Any] = ["title": "Title"]
    
    func testShouldParseDictionaryIntoItemObject() {
        let expectedCategories = try! Array.parameterOf(RSS.Category.parameter).parse(itemDictionary["category"]!)
        let expectedEnclosure = try! RSS.Enclosure.parameter.parse(itemDictionary["enclosure"]!)
        let expectedGuid = try! RSS.GUID.parameter.parse(itemDictionary["guid"]!)
        let expectedSource = try! RSS.Source.parameter.parse(itemDictionary["source"]!)
        let expectedItem = RSS.Item(title: itemDictionary["title"] as? String,
                                    link: URL(string: itemDictionary["link"] as! String),
                                    description: itemDictionary["description"] as? String,
                                    author: itemDictionary["author"] as? String,
                                    category: expectedCategories,
                                    comments: URL(string: itemDictionary["comments"] as! String),
                                    enclosure: expectedEnclosure,
                                    guid: expectedGuid,
                                    publicationDate: try! Date.parameter.parse(itemDictionary["pubDate"]!),
                                    source: expectedSource)
        
        XCTAssertEqualParameter(expectedItem, withValue: itemDictionary)
    }
    
    func testShouldParseDictionaryWithJustTitleIntoItemObject() {
        let expectedItem = RSS.Item(title: itemDictionaryWithOnlyTitle["title"] as? String,
                                    link: .none,
                                    description: .none,
                                    author: .none,
                                    category: .none,
                                    comments: .none,
                                    enclosure: .none,
                                    guid: .none,
                                    publicationDate: .none,
                                    source: .none)
        
        XCTAssertEqualParameter(expectedItem, withValue: itemDictionaryWithOnlyTitle)
    }
    
}
