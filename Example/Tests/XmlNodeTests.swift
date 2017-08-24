//
//  XmlNodeTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/24.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class XmlNodeTests: XCTestCase {
    
    func testShouldConvertBasicXmlToJson() {
        let basicXml = XmlNode(name: "root")
        
        let result = basicXml.json
        
        
    }
    
}
