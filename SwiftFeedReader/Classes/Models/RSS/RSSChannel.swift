//
//  RSSChannel.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//


/// Structure of RSS Channel as defined by https://validator.w3.org/feed/docs/rss2.html
public struct RSSChannel {
    
    /// Required Parameters
    
    /*
         The name of the channel. It's how people refer to your service. If
         you have an HTML website that contains the same information as your RSS file,
         the title of your channel should be the same as the title of your website.
     
         Example: GoUpstate.com News Headlines
    */
    public let title: String
    
    /*
         The URL to the HTML website corresponding to the channel.
     
         Example: http://www.goupstate.com/
    */
    public let link: String
    
    /*
     Phrase or sentence describing the channel.
     
     Example: The latest news from GoUpstate.com, a Spartanburg Herald-Journal
     Web site.
     */
    public let description: String
    
    /// Optional Parameters
    
    
    public let language: Language?
    public let copyright: String?
    public let managingEditor: String?
    
}
