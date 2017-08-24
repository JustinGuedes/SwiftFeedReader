//
//  Language.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//

public enum Language: String {
    
    case Afrikaans = "af"
    case Albanian = "sq"
    case Basque = "eu"
    case Belarusian = "be"
    case Bulgarian = "bg"
    case Catalan = "ca"
    case ChineseSimplified = "zh-cn"
    case ChineseTraditional = "zh-tw"
    case Croatian = "hr"
    case Czech = "cs"
    case Danish = "da"
    case Dutch = "nl"
    case DutchBelgium = "nl-be"
    case DutchNetherlands = "nl-nl"
    case English = "en"
    case EnglishAustralia = "en-au"
    case EnglishBelize = "en-bz"
    case EnglishCanada = "en-ca"
    case EnglishIreland = "en-ie"
    case EnglishJamaica = "en-jm"
    case EnglishNewZealand = "en-nz"
    case EnglishPhillipines = "en-ph"
    case EnglishSouthAfrica = "en-za"
    case EnglishTrinidad = "en-tt"
    case EnglishUnitedKingdom = "en-gb"
    case EnglishUnitedStates = "en-us"
    case EnglishZimbabwe = "en-zw"
    case Estonian = " et"
    case Faeroese = "fo"
    case Finnish = "fi"
    case French = "fr"
    case FrenchBelgium = "fr-be"
    case FrenchCanada = "fr-ca"
    case FrenchFrance = "fr-fr"
    case FrenchLuxembourg = "fr-lu"
    case FrenchMonaco = "fr-mc"
    case FrenchSwitzerland = "fr-ch"
    case Galician = "gl"
    case Gaelic = "gd"
    case German = "de"
    case GermanAustria = "de-at"
    case GermanGermany = "de-de"
    case GermanLiechtenstein = "de-li"
    case GermanLuxembourg = "de-lu"
    case GermanSwitzerland = "de-ch"
    case Greek = "el"
    case Hawaiian = "haw"
    case Hungarian = "hu"
    case Icelandic = "is"
    case Indonesian = "in"
    case Irish = "ga"
    case Italian = "it"
    case ItalianItaly = "it-it"
    case ItalianSwitzerland = "it-ch"
    case Japanese = "ja"
    case Korean = "ko"
    case Macedonian = "mk"
    case Norwegian = "no"
    case Polish = "pl"
    case Portuguese = "pt"
    case PortugueseBrazil = "pt-br"
    case PortuguesePortugal = "pt-pt"
    case Romanian = "ro"
    case RomanianMoldova = "ro-mo"
    case RomanianRomania = "ro-ro"
    case Russian = "ru"
    case RussianMoldova = "ru-mo"
    case RussianRussia = "ru-ru"
    case Serbian = "sr"
    case Slovak = "sk"
    case Slovenian = "sl"
    case Spanish = "es"
    case SpanishArgentina = "es-ar"
    case SpanishBolivia = "es-bo"
    case SpanishChile = "es-cl"
    case SpanishColombia = "es-co"
    case SpanishCostaRica = "es-cr"
    case SpanishDominicanRepublic = "es-do"
    case SpanishEcuador = "es-ec"
    case SpanishElSalvador = "es-sv"
    case SpanishGuatemala = "es-gt"
    case SpanishHonduras = "es-hn"
    case SpanishMexico = "es-mx"
    case SpanishNicaragua = "es-ni"
    case SpanishPanama = "es-pa"
    case SpanishParaguay = "es-py"
    case SpanishPeru = "es-pe"
    case SpanishPuertoRico = "es-pr"
    case SpanishSpain = "es-es"
    case SpanishUruguay = "es-uy"
    case SpanishVenezuela = "es-ve"
    case Swedish = "sv"
    case SwedishFinland = "sv-fi"
    case SwedishSweden = "sv-se"
    case Turkish = "tr"
    case Ukranian = "uk"
    
}

extension Language {
    
    static var parameter: Parameter<Language> {
        return Parameter(apiDescription: "language") {
            guard let languageStr = $0 as? String,
                let language = Language(rawValue: languageStr) else {
                    throw SwiftFeedReaderError.cannotParse("language")
            }
            
            return language
        }
    }
    
}
