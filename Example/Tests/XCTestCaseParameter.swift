//
//  XCTestCaseParameter.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

protocol XCTestCaseParameter {
    
    associatedtype ParameterType: Equatable
    
    var parameter: Parameter<ParameterType> { get }
    
}

extension XCTestCaseParameter where Self: XCTestCase {
    
    func XCTAssertEqualParameter(_ expectedValue: ParameterType, withValue value: Any) {
        XCTAssertEqualParameter(expectedValue, forParameter: parameter, withValue: value)
    }
    
    func XCTAssertCannotParse(_ value: Any) {
        XCTAssertCannotParse(forParameter: parameter, withValue: value)
    }
    
    func XCTAssertParameterNotFound(inDictionary dictionary: [String: Any]) {
        XCTAssertParameterNotFound(forParameter: parameter, inDictionary: dictionary)
    }
    
    func XCTAssertParameterNotFound(withKey key: String, inDictionary dictionary: [String: Any]) {
        XCTAssertParameterNotFound(forParameter: parameter, withKey: key, inDictionary: dictionary)
    }
    
}
