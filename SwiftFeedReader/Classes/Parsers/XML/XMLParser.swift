//
//  XMLParser.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

public struct XMLParser {
    
    public init () {}
    
    public func parse(string: String) -> XMLNode {
        guard let data = string.data(using: .utf8) else {
            fatalError("Must rather throw error")
        }
        
        return parse(withParser: Foundation.XMLParser(data: data))
    }
    
    public func parse(url: URL) -> XMLNode {
        return parse(withParser: Foundation.XMLParser(contentsOf: url))
    }
    
    fileprivate func parse(withParser parser: Foundation.XMLParser?) -> XMLNode {
        let delegate = XMLParserDelegateImplementation()
        parser?.delegate = delegate
        parser?.parse()
        return delegate.rootNode
    }
    
    class XMLParserDelegateImplementation: NSObject, Foundation.XMLParserDelegate {
        
        var rootNode: XMLNode
        var nodes: [XMLNode]
        
        override init() {
            self.rootNode = XMLNode(name: "root")
            self.nodes = []
            super.init()
        }
        
        func parserDidStartDocument(_ parser: Foundation.XMLParser) {
            nodes.append(rootNode)
        }
        
        func parser(_ parser: Foundation.XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
            let parentNode = nodes.last
            let node = XMLNode(name: elementName,
                               attributes: attributeDict)
            
            parentNode?.appendChild(node)
            nodes.append(node)
        }
        
        func parser(_ parser: Foundation.XMLParser, foundCharacters string: String) {
            let node = nodes.last
            node?.updateValue(string)
        }
        
        func parser(_ parser: Foundation.XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            nodes.removeLast()
        }
        
        func parserDidEndDocument(_ parser: Foundation.XMLParser) {
            if let node = rootNode.children.first, rootNode.children.count == 1 {
                rootNode = node
            }
        }
        
    }
    
}
