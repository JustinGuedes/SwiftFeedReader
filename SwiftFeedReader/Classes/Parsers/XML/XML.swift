//
//  XML.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/25.
//

public struct XML {
    
    private static let xmlParser = XMLParser()
    
    public static func getRSS(fromUrl url: URL) throws -> RSS {
        let xml = xmlParser.parse(url: url)
        return try getRSS(fromXmlNode: xml)
    }
    
    public static func getRSS(fromString string: String) throws -> RSS {
        let xml = xmlParser.parse(string: string)
        return try getRSS(fromXmlNode: xml)
    }
    
    private static func getRSS(fromXmlNode xml: XMLNode) throws -> RSS {
        let json = xml.toJson(RSS.schema)
        
        return try RSS.parameter.parse(json)
    }
    
}
