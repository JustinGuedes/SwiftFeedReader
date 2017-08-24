//
//  XmlNode.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

class XmlNode: XmlNodeType {
    
    let name: String
    var value: String
    let attributes: [String: Any]
    let parent: XmlNodeType?
    var children: [XmlNodeType]
    
    init(name: String) {
        self.name = name
        self.value = ""
        self.attributes = [:]
        self.parent = .none
        self.children = []
    }
    
    init(name: String, attributes: [String: Any], parent: XmlNodeType?) {
        self.name = name
        self.value = ""
        self.attributes = attributes
        self.parent = parent
        self.children = []
    }
    
    func appendChild(_ child: XmlNodeType) {
        self.children.append(child)
    }
    
    func updateValue(_ value: String) {
        self.value += value
    }
    
    var json: Any {
        return ""
    }
    
}
