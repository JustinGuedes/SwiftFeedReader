//
//  RSSCloudTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class RSSCloudTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = RSS.Cloud.parameter
    
    let cloudDictionary: [String: Any] = ["domain": "radio.xmlstoragesystem.com",
                                          "port": 80,
                                          "path": "/RPC2",
                                          "registerProcedure": "xmlStorageSystem.rssPleaseNotify",
                                          "protocol": "xml-rpc"]
    
    func testShouldThrowParameterNotFoundErrorWhenParsingEmptyDictionary() {
        let emptyDict: [String: Any] = [:]
        
        XCTAssertParameterNotFound(inDictionary: emptyDict)
    }
    
    func testShouldThrowParameterNotFoundErrorWhenParsingDictionaryWithoutDomain() {
        let key = "domain"
        var dictWithoutDomain = cloudDictionary
        dictWithoutDomain.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(withKey: key, inDictionary: dictWithoutDomain)
    }
    
    func testShouldThrowParameterNotFoundErrorWhenParsingDictionaryWithoutPort() {
        let key = "port"
        var dictWithoutPort = cloudDictionary
        dictWithoutPort.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(withKey: key, inDictionary: dictWithoutPort)
    }
    
    func testShouldThrowParameterNotFoundErrorWhenParsingDictionaryWithoutPath() {
        let key = "path"
        var dictWithoutPath = cloudDictionary
        dictWithoutPath.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(withKey: key, inDictionary: dictWithoutPath)
    }
    
    func testShouldThrowParameterNotFoundErrorWhenParsingDictionaryWithoutRegisterProcedure() {
        let key = "registerProcedure"
        var dictWithoutRegisterProcedure = cloudDictionary
        dictWithoutRegisterProcedure.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(withKey: key, inDictionary: dictWithoutRegisterProcedure)
    }
    
    func testShouldThrowParameterNotFoundErrorWhenParsingDictionaryWithoutProtocol() {
        let key = "protocol"
        var dictWithoutProtocol = cloudDictionary
        dictWithoutProtocol.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(withKey: key, inDictionary: dictWithoutProtocol)
    }
    
    func testShouldParseDictionaryIntoCloudObject() {
        let expectedCloud = RSS.Cloud(domain: cloudDictionary["domain"] as! String,
                                      port: cloudDictionary["port"] as! Int,
                                      path: cloudDictionary["path"] as! String,
                                      registerProcedure: cloudDictionary["registerProcedure"] as! String,
                                      protocol: cloudDictionary["protocol"] as! String)
        
        XCTAssertEqualParameter(expectedCloud, withValue: cloudDictionary)
    }
    
}
