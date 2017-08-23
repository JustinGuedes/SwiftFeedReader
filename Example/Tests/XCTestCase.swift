//
//  XCTestCase.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

extension XCTestCase {
    
    func XCTAssertEqualParameter<T: Equatable>(_ expectedValue: T, forParameter parameter: Parameter<T>, withValue value: Any) {
        do {
            let result = try parameter.parse(value)
            XCTAssertEqual(expectedValue, result)
        } catch {
            XCTFail("error thrown when expecting parameter value")
        }
    }
    
    func XCTAssertEqualParameter<T: Equatable>(_ expectedValue: [T], forParameter parameter: Parameter<[T]>, withValue value: Any) {
        do {
            let result = try parameter.parse(value)
            XCTAssertEqual(expectedValue, result)
        } catch {
            XCTFail("error thrown when expecting parameter value")
        }
    }
    
    func XCTAssertCannotParse<T>(forParameter parameter: Parameter<T>, withValue value: Any) {
        do {
            _ = try parameter.parse(value)
            XCTFail("failed to throw cannot parse error")
        } catch SwiftFeedReaderError.cannotParse(_) {
            // DO NOTHING
        } catch {
            XCTFail("other error thrown")
        }
    }
    
    func XCTAssertParameterNotFound<T>(forParameter parameter: Parameter<T>, inDictionary dictionary: [String: Any]) {
        do {
            _ = try parameter.parse(dictionary)
            XCTFail("failed to throw parameter not found error")
        } catch SwiftFeedReaderError.parameterNotFound(_) {
            // DO NOTHING
        } catch {
            XCTFail("other error thrown")
        }
    }
    
    func XCTAssertParameterNotFound<T>(forParameter parameter: Parameter<T>, withKey key: String, inDictionary dictionary: [String: Any]) {
        do {
            _ = try parameter.parse(dictionary)
            XCTFail("failed to throw parameter not found error")
        } catch let SwiftFeedReaderError.parameterNotFound(message) {
            XCTAssertTrue(message.contains(key))
        } catch {
            XCTFail("other error thrown")
        }
    }
    
}
