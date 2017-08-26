# SwiftFeedReader

[![CI Status](http://img.shields.io/travis/JustinGuedes/SwiftFeedReader.svg?style=flat)](https://travis-ci.org/JustinGuedes/SwiftFeedReader)
[![Version](https://img.shields.io/cocoapods/v/SwiftFeedReader.svg?style=flat)](http://cocoapods.org/pods/SwiftFeedReader)
[![License](https://img.shields.io/cocoapods/l/SwiftFeedReader.svg?style=flat)](http://cocoapods.org/pods/SwiftFeedReader)
[![Platform](https://img.shields.io/cocoapods/p/SwiftFeedReader.svg?style=flat)](http://cocoapods.org/pods/SwiftFeedReader)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftFeedReader is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftFeedReader"
```

## How To Use

To get an `RSS` struct, either provide a string of the xml contents or a url pointing to the RSS feed:

```swift
let url = URL(string: "https://feeds.rss")!
let rss: RSS
do {
  rss = try XmlToRss.getRSS(fromUrl: url)
} catch {
  print(error)
}
```

And that's it! :)

## Author

JustinGuedes, justin.guedes@gmail.com

## License

SwiftFeedReader is available under the MIT license. See the LICENSE file for more info.
