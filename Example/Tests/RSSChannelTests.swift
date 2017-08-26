//
//  RSSChannelTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/24.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class RSSChannelTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = RSS.Channel.parameter
    
    static let categories: [[String: Any]] = [["category": "Example"],
                                              ["category": "Example 2",
                                               "domain": "http://www.google.com"]]
    
    static let cloudDictionary: [String: Any] = ["domain": "radio.xmlstoragesystem.com",
                                                 "port": 80,
                                                 "path": "/RPC2",
                                                 "registerProcedure": "xmlStorageSystem.rssPleaseNotify",
                                                 "protocol": "xml-rpc"]
    
    static let imageDictionary: [String: Any] = ["url": "http://www.imageUrl.com",
                                                 "title": "Image Title",
                                                 "link": "http://www.linkToWebsite.com",
                                                 "width": 100,
                                                 "height": 100]
    
    static let textInputDictionary: [String: Any] = ["title": "Text Input Title",
                                                     "description": "Description",
                                                     "name": "Name",
                                                     "link": "http://www.google.com"]
    
    static let itemDictionary: [String: Any] = ["title": "Title",
                                                "link": "http://www.google.com",
                                                "description": "Description",
                                                "author": "Author",
                                                "category": [
                                                    ["category": "Example 3"],
                                                    ["category": "Example 5",
                                                     "domain": "http://www.googles.com"]],
                                                "comments": "http://www.google.com/comments",
                                                "enclosure": ["url": "http://www.google.com",
                                                              "length": 12345,
                                                              "type": "audio/mpeg"],
                                                "guid": ["guid": "GUID One"],
                                                "pubDate": "Sun, 19 May 2002 15:21:36 GMT",
                                                "source": ["source": "Channel Source",
                                                           "url": "http://www.google.com"]]
    
    let channelDictionary: [String: Any] = ["title": "Title",
                                            "link": "http://www.google.com",
                                            "description": "Description",
                                            "language": "en",
                                            "copyright": "Copyright 2017",
                                            "managingEditor": "justin.guedes@gmail.com",
                                            "webMaster": "justin.guedes@gmail.com",
                                            "pubDate": "Sat, 07 Sep 2002 0:00:01 GMT",
                                            "lastBuildDate": "Sat, 07 Sep 2002 9:42:31 GMT",
                                            "category": categories,
                                            "generator": "Generator",
                                            "docs": "http://www.google.com",
                                            "cloud": cloudDictionary,
                                            "ttl": 60,
                                            "image": imageDictionary,
                                            "textInput": textInputDictionary,
                                            "skipHours": [1, 2, 3, 4],
                                            "skipDays": [5, 6, 7, 8],
                                            "item": [itemDictionary, itemDictionary]]
    
    let channelDictionaryWithRequiredFields: [String: Any] = ["title": "Title",
                                                              "link": "http://www.google.com",
                                                              "description": "Description"]
    
    func testShouldThrowParameterNotFoundErrorWhenParsingEmptyDictionary() {
        let emptyDict: [String: Any] = [:]
        
        XCTAssertParameterNotFound(inDictionary: emptyDict)
    }
    
    func testShouldThrowParameterNotFoundErrorWhenParsingDictionaryWithoutTitle() {
        let key = "title"
        var dictionaryWithoutTitle = channelDictionaryWithRequiredFields
        dictionaryWithoutTitle.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutTitle)
    }
    
    func testShouldThrowParameterNotFoundErrorWhenParsingDictionaryWithoutLink() {
        let key = "link"
        var dictionaryWithoutLink = channelDictionaryWithRequiredFields
        dictionaryWithoutLink.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutLink)
    }
    
    func testShouldThrowParameterNotFoundErrorWhenParsingDictionaryWithoutDescription() {
        let key = "description"
        var dictionaryWithoutDescription = channelDictionaryWithRequiredFields
        dictionaryWithoutDescription.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutDescription)
    }
    
    func testShouldParseDictionaryWithOnlyRequiredFieldsIntoRSSChannelObject() {
        let expectedChannel = RSS.Channel(title: channelDictionaryWithRequiredFields["title"] as! String,
                                          link: URL(string: channelDictionaryWithRequiredFields["link"] as! String)!,
                                          description: channelDictionaryWithRequiredFields["description"] as! String,
                                          language: .none,
                                          copyright: .none,
                                          managingEditor: .none,
                                          webMaster: .none,
                                          publicationDate: .none,
                                          lastBuildDate: .none,
                                          categories: .none,
                                          generator: .none,
                                          docs: .none,
                                          cloud: .none,
                                          timeToLive: .none,
                                          image: .none,
                                          textInput: .none,
                                          skipHours: .none,
                                          skipDays: .none,
                                          items: .none)
        
        XCTAssertEqualParameter(expectedChannel, withValue: channelDictionaryWithRequiredFields)
    }
    
    func testShouldParseDictionaryIntoRSSChannelObject() {
        let expectedLanguage = try! Language.parameter.parse(channelDictionary["language"]!)
        let expectedPublicationDate = try! Date.parameter.parse(channelDictionary["pubDate"]!)
        let expectedLastBuildDate = try! Date.parameter.parse(channelDictionary["lastBuildDate"]!)
        let expectedCategories = try! Array.parameterOf(RSS.Category.parameter).parse(channelDictionary["category"]!)
        let expectedCloud = try! RSS.Cloud.parameter.parse(channelDictionary["cloud"]!)
        let expectedImage = try! RSS.Image.parameter.parse(channelDictionary["image"]!)
        let expectedTextInput = try! RSS.TextInput.parameter.parse(channelDictionary["textInput"]!)
        let expectedItems = try! Array.parameterOf(RSS.Item.parameter).parse(channelDictionary["item"]!)
        let expectedChannel = RSS.Channel(title: channelDictionary["title"] as! String,
                                          link: URL(string: channelDictionary["link"] as! String)!,
                                          description: channelDictionary["description"] as! String,
                                          language: expectedLanguage,
                                          copyright: channelDictionary["copyright"] as? String,
                                          managingEditor: channelDictionary["managingEditor"] as? String,
                                          webMaster: channelDictionary["webMaster"] as? String,
                                          publicationDate: expectedPublicationDate,
                                          lastBuildDate: expectedLastBuildDate,
                                          categories: expectedCategories,
                                          generator: channelDictionary["generator"] as? String,
                                          docs: URL(string: channelDictionary["docs"] as! String),
                                          cloud: expectedCloud,
                                          timeToLive: channelDictionary["ttl"] as? Int,
                                          image: expectedImage,
                                          textInput: expectedTextInput,
                                          skipHours: channelDictionary["skipHours"] as? [Int],
                                          skipDays: channelDictionary["skipDays"] as? [Int],
                                          items: expectedItems)
        
        XCTAssertEqualParameter(expectedChannel, withValue: channelDictionary)
    }
    
}
