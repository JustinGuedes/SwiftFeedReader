//
//  XmlNode.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

public class XmlNode {
    
    public let name: String
    public fileprivate(set) var value: String
    public let attributes: [String: String]
    public fileprivate(set) var parent: XmlNode?
    public fileprivate(set) var children: [XmlNode]
    
    init(name: String) {
        self.name = name
        self.value = ""
        self.attributes = [:]
        self.parent = .none
        self.children = []
    }
    
    init(name: String, attributes: [String: String]) {
        self.name = name
        self.value = ""
        self.attributes = attributes
        self.parent = .none
        self.children = []
    }
    
}

// MARK: - Public Implementation
public extension XmlNode {
    
    func toJson(_ schema: XmlSchema = [:]) -> Any {
        guard children.count > 0 else {
            return attributesToJson(schema) ?? toJson(value, forName: name, withSchema: schema)
        }
        
        var jsonDictionary: [String: Any] = attributes
        children.forEach { node in
            guard let value = jsonDictionary[node.name] else {
                return jsonDictionary[node.name] = node.toJson(schema)
            }
            
            if let arrayOfValues = value as? [Any] {
                jsonDictionary[node.name] = arrayOfValues + [node.toJson(schema)]
            } else {
                let arrayOfValues: [Any] = [value] + [node.toJson(schema)]
                jsonDictionary[node.name] = arrayOfValues
            }
        }
        
        return jsonDictionary
    }
    
}

// MARK: - Internal Implementation
extension XmlNode {
    
    func appendChild(_ child: XmlNode) {
        children.append(child)
        child.parent = self
    }
    
    func updateValue(_ value: String) {
        self.value += value
    }
    
}

// MARK: - Private Implementation
fileprivate extension XmlNode {

    func toJson(_ value: String, forName name: String, withSchema schema: XmlSchema) -> Any {
        return schema[name]?.cast(value: value, withName: name) ?? value
    }
    
    func attributesToJson(_ schema: XmlSchema) -> [String: Any]? {
        guard attributes.count > 0 else {
            return .none
        }
        
        var jsonDictionary: [String: Any] = [name: value]
        attributes.forEach { name, value in
            jsonDictionary[name] = toJson(value, forName: name, withSchema: schema)
        }
        
        return jsonDictionary
    }
    
}
