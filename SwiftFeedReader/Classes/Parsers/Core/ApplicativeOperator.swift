//
//  ApplicativeOperator.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//

infix operator <*>: Apply
precedencegroup Apply {
    associativity: left
}

func <*><A,B>(lhs: DictionaryParser<(A) -> B>, rhs: NamedParameter<A>) -> DictionaryParser<B> {
    var descs = lhs.apiDescriptions
    descs[rhs.key] = rhs.apiDescription
    return DictionaryParser(apiDescriptions: descs) { dict in
        let f = try lhs.parse(dict)
        let x = try rhs.parse(dict)
        return f(x)
    }
}
