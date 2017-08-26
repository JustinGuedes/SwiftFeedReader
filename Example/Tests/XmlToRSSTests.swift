//
//  XmlToRSSTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/25.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class XmlToRSSTests: XCTestCase {
    
    let basicRSS = """
<rss version="2.0">
    <channel>
        <title>Basic</title>
        <link>http://www.google.com</link>
        <description>Basic Description</description>
    </channel>
</rss>
"""
    
    func testShouldParseBasicRSS() {
        let result: RSS
        do {
            result = try XmlToRSS.getRSS(fromString: basicRSS)
        } catch {
            XCTFail("Failed to getRSS [reason: \(error)")
            return
        }
        
        XCTAssertEqual("2.0", result.version)
        XCTAssertEqual("Basic", result.channel.title)
        XCTAssertEqual(URL(string: "http://www.google.com"), result.channel.link)
        XCTAssertEqual("Basic Description", result.channel.description)
    }
    
    let rssWithCategories = """
<rss version="2.0">
    <channel>
        <title>Basic</title>
        <link>http://www.google.com</link>
        <description>Basic Description</description>
        <category>Category1</category>
        <category domain="domainExample">Category2</category>
        <category>Category3</category>
    </channel>
</rss>
"""
    
    func testShouldParseRSSWithCategories() {
        let result: RSS
        do {
            result = try XmlToRSS.getRSS(fromString: rssWithCategories)
        } catch {
            XCTFail("Failed to getRSS [reason: \(error)")
            return
        }
        
        XCTAssertEqual("2.0", result.version)
        XCTAssertEqual("Basic", result.channel.title)
        XCTAssertEqual(URL(string: "http://www.google.com"), result.channel.link)
        XCTAssertEqual("Basic Description", result.channel.description)
        XCTAssertEqual(3, result.channel.categories?.count)
        XCTAssertEqual(RSS.Category(name: "Category1", domain: .none), result.channel.categories?[0])
        XCTAssertEqual(RSS.Category(name: "Category2", domain: "domainExample"), result.channel.categories?[1])
        XCTAssertEqual(RSS.Category(name: "Category3", domain: .none), result.channel.categories?[2])
    }
 
    let rssWithItems = """
<rss version="2.0">
    <channel>
        <title>Basic</title>
        <link>http://www.google.com</link>
        <description>Basic Description</description>
        <item>
            <title>Item1</title>
            <link>http://www.google.com/item1</link>
            <description>Item1 Description</description>
            <source url="http://www.google.com">Source1</source>
        </item>
        <item>
            <title>Item2</title>
            <link>http://www.google.com/item2</link>
            <description>Item2 Description</description>
        </item>
        <item>
            <title>Item3</title>
            <link>http://www.google.com/item3</link>
            <description>Item3 Description</description>
            <source url="http://www.google.com">Source3</source>
        </item>
    </channel>
</rss>
"""
    
    func testShouldParseRSSWithItems() {
        let result: RSS
        do {
            result = try XmlToRSS.getRSS(fromString: rssWithItems)
        } catch {
            XCTFail("Failed to getRSS [reason: \(error)")
            return
        }
        
        XCTAssertEqual("2.0", result.version)
        XCTAssertEqual("Basic", result.channel.title)
        XCTAssertEqual(URL(string: "http://www.google.com"), result.channel.link)
        XCTAssertEqual("Basic Description", result.channel.description)
        XCTAssertEqual(3, result.channel.items?.count)
        XCTAssertEqual("Item1", result.channel.items?[0].title)
        XCTAssertEqual(URL(string: "http://www.google.com/item1"), result.channel.items?[0].link)
        XCTAssertEqual("Item1 Description", result.channel.items?[0].description)
        XCTAssertEqual("Source1", result.channel.items?[0].source?.name)
        XCTAssertEqual(URL(string: "http://www.google.com"), result.channel.items?[0].source?.url)
        XCTAssertEqual("Item2", result.channel.items?[1].title)
        XCTAssertEqual(URL(string: "http://www.google.com/item2"), result.channel.items?[1].link)
        XCTAssertEqual("Item2 Description", result.channel.items?[1].description)
        XCTAssertEqual("Item3", result.channel.items?[2].title)
        XCTAssertEqual(URL(string: "http://www.google.com/item3"), result.channel.items?[2].link)
        XCTAssertEqual("Item3 Description", result.channel.items?[2].description)
        XCTAssertEqual("Source3", result.channel.items?[2].source?.name)
        XCTAssertEqual(URL(string: "http://www.google.com"), result.channel.items?[2].source?.url)
    }
    
}
