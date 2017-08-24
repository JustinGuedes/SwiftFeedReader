//
//  XmlNodeType.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

protocol XmlNodeType {
    
    var name: String { get }
    var value: String { get }
    var attributes: [String: Any] { get }
    var parent: XmlNodeType? { get }
    var children: [XmlNodeType] { get }
    
    func appendChild(_ child: XmlNodeType)
    func updateValue(_ value: String)
    
    var json: Any { get }
    
}
