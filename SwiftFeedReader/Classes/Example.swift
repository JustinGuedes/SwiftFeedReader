//
//  Example.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//

struct User {
    let id: Int
    let email: String
    let address: String?
}

let id = NamedParameter(apiDescription: "The id", key: "id", parameter: Int.parameter.check(apiDescription: "non-zero", condition:  { $0 > 0 }))
let email = NamedParameter(apiDescription: "The email address", key: "email", parameter: String.parameter)
let address = NamedParameter(apiDescription: "The street address", key: "address", parameter: String.parameter).optional


let makeUser = { id in { email in { address in User(id: id, email: email, address: address) } } }
let endpoint: DictionaryParser<User> = DictionaryParser(pure: makeUser) <*> id <*> email <*> address

public struct Main {
    
    public init() {}
    
    public func test(_ dict: [String: Any]) {
        do {
            dump(try endpoint.parse(dict))
        } catch {
            dump(error)
        }
    }
    
}
