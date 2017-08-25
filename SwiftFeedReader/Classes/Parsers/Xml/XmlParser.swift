//
//  XmlParser.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

public struct XmlParser {
    
    public init () {}
    
    public func parse(string: String) -> XmlNode {
        guard let data = string.data(using: .utf8) else {
            fatalError("Must rather throw error")
        }
        
        return parse(withParser: XMLParser(data: data))
    }
    
    public func parse(url: URL) -> XmlNode {
        return parse(withParser: XMLParser(contentsOf: url))
    }
    
    fileprivate func parse(withParser parser: XMLParser?) -> XmlNode {
        let delegate = XmlParserDelegate()
        parser?.delegate = delegate
        parser?.parse()
        return delegate.rootNode
    }
    
    class XmlParserDelegate: NSObject, XMLParserDelegate {
        
        var rootNode: XmlNode
        var nodes: [XmlNode]
        
        override init() {
            self.rootNode = XmlNode(name: "root")
            self.nodes = []
            super.init()
        }
        
        func parserDidStartDocument(_ parser: XMLParser) {
            nodes.append(rootNode)
        }
        
        func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
            let parentNode = nodes.last
            let node = XmlNode(name: elementName,
                               attributes: attributeDict)
            
            parentNode?.appendChild(node)
            nodes.append(node)
        }
        
        func parser(_ parser: XMLParser, foundCharacters string: String) {
            let node = nodes.last
            node?.updateValue(string)
        }
        
        func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            nodes.removeLast()
        }
        
        func parserDidEndDocument(_ parser: XMLParser) {
            if let node = rootNode.children.first, rootNode.children.count == 1 {
                rootNode = node
            }
        }
        
    }
    
}
