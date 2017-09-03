//
//  EscapeCharacter.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/09/03.
//

public enum EscapeCharacter {
    
    case ™
    case €
    case space
    case exclamation
    case quotes
    case hashtag
    case $
    case percent
    case ampersand
    case singleQuote
    case openParenthesis
    case closingParenthesis
    case astericks
    case plus
    case comma
    case dash
    case period
    case forwardslash
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case colon
    case semiColon
    case lessThan
    case equal
    case greaterThan
    case question
    case at
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H
    case I
    case J
    case K
    case L
    case M
    case N
    case O
    case P
    case Q
    case R
    case S
    case T
    case U
    case V
    case W
    case X
    case Y
    case Z
    case openBracket
    case backslash
    case closingBracket
    case caret
    case underscore
    case backTick
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
    case i
    case j
    case k
    case l
    case m
    case n
    case o
    case p
    case q
    case r
    case s
    case t
    case u
    case v
    case w
    case x
    case y
    case z
    case openCurly
    case verticalBar
    case closingCurly
    case tilde
    case NonBreakingSpace
    case iexcl
    case cent
    case pound
    case curren
    case yen
    case brvbar
    case sect
    case ¨
    case copy
    case ª
    case leftArrows
    case not
    case reg
    case ¯
    case degree
    case plusmn
    case ²
    case ³
    case ´
    case µ
    case para
    case ·
    case ¸
    case ¹
    case º
    case raquo
    case ¼
    case ½
    case ¾
    case iquest
    case À
    case Á
    case Â
    case Ã
    case Ä
    case Å
    case Æ
    case Ç
    case È
    case É
    case Ê
    case Ë
    case Ì
    case Í
    case Î
    case Ï
    case Ð
    case Ñ
    case Ò
    case Ó
    case Ô
    case Õ
    case Ö
    case times
    case Ø
    case Ù
    case Ú
    case Û
    case Ü
    case Ý
    case Þ
    case ß
    case à
    case á
    case â
    case ã
    case ä
    case å
    case æ
    case ç
    case è
    case é
    case ê
    case ë
    case ì
    case í
    case î
    case ï
    case ð
    case ñ
    case ò
    case ó
    case ô
    case õ
    case ö
    case divide
    case ø
    case ù
    case ú
    case û
    case ü
    case ý
    case þ
    case ÿ
    case Ā
    case ā
    case Ă
    case ă
    case Ą
    case ą
    case Ć
    case ć
    case Ĉ
    case ĉ
    case Ċ
    case ċ
    case Č
    case č
    case Ď
    case ď
    case Đ
    case đ
    case Ē
    case ē
    case Ĕ
    case ĕ
    case Ė
    case ė
    case Ę
    case ę
    case Ě
    case ě
    case Ĝ
    case ĝ
    case Ğ
    case ğ
    case Ġ
    case ġ
    case Ģ
    case ģ
    case Ĥ
    case ĥ
    case Ħ
    case ħ
    case Ĩ
    case ĩ
    case Ī
    case ī
    case Ĭ
    case ĭ
    case Į
    case į
    case İ
    case ı
    case Ĳ
    case ĳ
    case Ĵ
    case ĵ
    case Ķ
    case ķ
    case ĸ
    case Ĺ
    case ĺ
    case Ļ
    case ļ
    case Ľ
    case ľ
    case Ŀ
    case ŀ
    case Ł
    case ł
    case Ń
    case ń
    case Ņ
    case ņ
    case Ň
    case ň
    case ŉ
    case Ŋ
    case ŋ
    case Ō
    case ō
    case Ŏ
    case ŏ
    case Ő
    case ő
    case Œ
    case œ
    case Ŕ
    case ŕ
    case Ŗ
    case ŗ
    case Ř
    case ř
    case Ś
    case ś
    case Ŝ
    case ŝ
    case Ş
    case ş
    case Š
    case š
    case Ţ
    case ţ
    case Ť
    case ť
    case Ŧ
    case ŧ
    case Ũ
    case ũ
    case Ū
    case ū
    case Ŭ
    case ŭ
    case Ů
    case ů
    case Ű
    case ű
    case Ų
    case ų
    case Ŵ
    case ŵ
    case Ŷ
    case ŷ
    case Ÿ
    case Ź
    case ź
    case Ż
    case ż
    case Ž
    case ž
    case ſ
    case other(String)
    
    init(rawValue: String) {
        switch rawValue {
        case "&#8482;": self = .™
        case "&euro;": self = .€
        case "&#32;", "&nbsp;": self = .space
        case "&#33;": self = .exclamation
        case "&#34;", "&quot;": self = .quotes
        case "&#35;": self = .hashtag
        case "&#36;": self = .$
        case "&#37;": self = .percent
        case "&#38;", "&amp;": self = .ampersand
        case "&#39;": self = .singleQuote
        case "&#40;": self = .openParenthesis
        case "&#41;": self = .closingParenthesis
        case "&#42;": self = .astericks
        case "&#43;": self = .plus
        case "&#44;": self = .comma
        case "&#45;": self = .dash
        case "&#46;": self = .period
        case "&#47;": self = .forwardslash
        case "&#48;": self = .zero
        case "&#49;": self = .one
        case "&#50;": self = .two
        case "&#51;": self = .three
        case "&#52;": self = .four
        case "&#53;": self = .five
        case "&#54;": self = .six
        case "&#55;": self = .seven
        case "&#56;": self = .eight
        case "&#57;": self = .nine
        case "&#58;": self = .colon
        case "&#59;": self = .semiColon
        case "&#60;", "&lt;": self = .lessThan
        case "&#61;": self = .equal
        case "&#62;", "&gt;": self = .greaterThan
        case "&#63;": self = .question
        case "&#64;": self = .at
        case "&#65;": self = .A
        case "&#66;": self = .B
        case "&#67;": self = .C
        case "&#68;": self = .D
        case "&#69;": self = .E
        case "&#70;": self = .F
        case "&#71;": self = .G
        case "&#72;": self = .H
        case "&#73;": self = .I
        case "&#74;": self = .J
        case "&#75;": self = .K
        case "&#76;": self = .L
        case "&#77;": self = .M
        case "&#78;": self = .N
        case "&#79;": self = .O
        case "&#80;": self = .P
        case "&#81;": self = .Q
        case "&#82;": self = .R
        case "&#83;": self = .S
        case "&#84;": self = .T
        case "&#85;": self = .U
        case "&#86;": self = .V
        case "&#87;": self = .W
        case "&#88;": self = .X
        case "&#89;": self = .Y
        case "&#90;": self = .Z
        case "&#91;": self = .openBracket
        case "&#92;": self = .backslash
        case "&#93;": self = .closingBracket
        case "&#94;": self = .caret
        case "&#95;": self = .underscore
        case "&#96;": self = .backTick
        case "&#97;": self = .a
        case "&#98;": self = .b
        case "&#99;": self = .c
        case "&#100;": self = .d
        case "&#101;": self = .e
        case "&#102;": self = .f
        case "&#103;": self = .g
        case "&#104;": self = .h
        case "&#105;": self = .i
        case "&#106;": self = .j
        case "&#107;": self = .k
        case "&#108;": self = .l
        case "&#109;": self = .m
        case "&#110;": self = .n
        case "&#111;": self = .o
        case "&#112;": self = .p
        case "&#113;": self = .q
        case "&#114;": self = .r
        case "&#115;": self = .s
        case "&#116;": self = .t
        case "&#117;": self = .u
        case "&#118;": self = .v
        case "&#119;": self = .w
        case "&#120;": self = .x
        case "&#121;": self = .y
        case "&#122;": self = .z
        case "&#123;": self = .openCurly
        case "&#124;": self = .verticalBar
        case "&#125;": self = .closingCurly
        case "&#126;": self = .tilde
        case "&#160;", "&nbsp;": self = .NonBreakingSpace
        case "&#161;", "&iexcl;": self = .iexcl
        case "&#162;", "&cent;": self = .cent
        case "&#163;", "&pound;": self = .pound
        case "&#164;", "&curren;": self = .curren
        case "&#165;", "&yen;": self = .yen
        case "&#166;", "&brvbar;": self = .brvbar
        case "&#167;", "&sect;": self = .sect
        case "&#168;", "&uml;": self = .¨
        case "&#169;", "&copy;": self = .copy
        case "&#170;", "&ordf;": self = .ª
        case "&#171;": self = .leftArrows
        case "&#172;", "&not;": self = .not
        case "&#174;", "&reg;": self = .reg
        case "&#175;", "&macr;": self = .¯
        case "&#176;", "&deg;": self = .degree
        case "&#177;", "&plusmn;": self = .plusmn
        case "&#178;", "&sup2;": self = .²
        case "&#179;", "&sup3;": self = .³
        case "&#180;", "&acute;": self = .´
        case "&#181;", "&micro;": self = .µ
        case "&#182;", "&para;": self = .para
        case "&#183;", "&middot;": self = .·
        case "&#184;", "&cedil;": self = .¸
        case "&#185;", "&sup1;": self = .¹
        case "&#186;", "&ordm;": self = .º
        case "&#187;", "&raquo;": self = .raquo
        case "&#188;", "&frac14;": self = .¼
        case "&#189;", "&frac12;": self = .½
        case "&#190;", "&frac34;": self = .¾
        case "&#191;", "&iquest;": self = .iquest
        case "&#192;", "&Agrave;": self = .À
        case "&#193;", "&Aacute;": self = .Á
        case "&#194;", "&Acirc;": self = .Â
        case "&#195;", "&Atilde;": self = .Ã
        case "&#196;", "&Auml;": self = .Ä
        case "&#197    &Aring;": self = .Å
        case "&#198;", "&AElig;": self = .Æ
        case "&#199;", "&Ccedil;": self = .Ç
        case "&#200;", "&Egrave;": self = .È
        case "&#201;", "&Eacute;": self = .É
        case "&#202;", "&Ecirc;": self = .Ê
        case "&#203;", "&Euml;": self = .Ë
        case "&#204;", "&Igrave;": self = .Ì
        case "&#205;", "&Iacute;": self = .Í
        case "&#206;", "&Icirc;": self = .Î
        case "&#207;", "&Iuml;": self = .Ï
        case "&#208;", "&ETH;": self = .Ð
        case "&#209;", "&Ntilde;": self = .Ñ
        case "&#210;", "&Ograve;": self = .Ò
        case "&#211;", "&Oacute;": self = .Ó
        case "&#212;", "&Ocirc;": self = .Ô
        case "&#213;", "&Otilde;": self = .Õ
        case "&#214;", "&Ouml;": self = .Ö
        case "&#215;", "&times;": self = .times
        case "&#216;", "&Oslash;": self = .Ø
        case "&#217;", "&Ugrave;": self = .Ù
        case "&#218;", "&Uacute;": self = .Ú
        case "&#219;", "&Ucirc;": self = .Û
        case "&#220;", "&Uuml;": self = .Ü
        case "&#221;", "&Yacute;": self = .Ý
        case "&#222;", "&THORN;": self = .Þ
        case "&#223;", "&szlig;": self = .ß
        case "&#224;", "&agrave;": self = .à
        case "&#225;", "&aacute;": self = .á
        case "&#226;", "&acirc;": self = .â
        case "&#227;", "&atilde;": self = .ã
        case "&#228;", "&auml;": self = .ä
        case "&#229;", "&aring;": self = .å
        case "&#230;", "&aelig;": self = .æ
        case "&#231;", "&ccedil;": self = .ç
        case "&#232;", "&egrave;": self = .è
        case "&#233;", "&eacute;": self = .é
        case "&#234;", "&ecirc;": self = .ê
        case "&#235;", "&euml;": self = .ë
        case "&#236;", "&igrave;": self = .ì
        case "&#237    &iacute;": self = .í
        case "&#238;", "&icirc;": self = .î
        case "&#239;", "&iuml;": self = .ï
        case "&#240;", "&eth;": self = .ð
        case "&#241;", "&ntilde;": self = .ñ
        case "&#242;", "&ograve;": self = .ò
        case "&#243;", "&oacute;": self = .ó
        case "&#244;", "&ocirc;": self = .ô
        case "&#245;", "&otilde;": self = .õ
        case "&#246;", "&ouml;": self = .ö
        case "&#247;", "&divide;": self = .divide
        case "&#248;", "&oslash;": self = .ø
        case "&#249;", "&ugrave;": self = .ù
        case "&#250;", "&uacute;": self = .ú
        case "&#251;", "&ucirc;": self = .û
        case "&#252;", "&uuml;": self = .ü
        case "&#253;", "&yacute;": self = .ý
        case "&#254;", "&thorn;": self = .þ
        case "&#255;": self = .ÿ
        case "&#256;": self = .Ā
        case "&#257;": self = .ā
        case "&#258;": self = .Ă
        case "&#259;": self = .ă
        case "&#260;": self = .Ą
        case "&#261;": self = .ą
        case "&#262;": self = .Ć
        case "&#263;": self = .ć
        case "&#264;": self = .Ĉ
        case "&#265;": self = .ĉ
        case "&#266;": self = .Ċ
        case "&#267;": self = .ċ
        case "&#268;": self = .Č
        case "&#269;": self = .č
        case "&#270;": self = .Ď
        case "&#271;": self = .ď
        case "&#272;": self = .Đ
        case "&#273;": self = .đ
        case "&#274;": self = .Ē
        case "&#275;": self = .ē
        case "&#276;": self = .Ĕ
        case "&#277": self = .ĕ
        case "&#278;": self = .Ė
        case "&#279;": self = .ė
        case "&#280;": self = .Ę
        case "&#281;": self = .ę
        case "&#282;": self = .Ě
        case "&#283;": self = .ě
        case "&#284;": self = .Ĝ
        case "&#285;": self = .ĝ
        case "&#286;": self = .Ğ
        case "&#287;": self = .ğ
        case "&#288;": self = .Ġ
        case "&#289;": self = .ġ
        case "&#290;": self = .Ģ
        case "&#291;": self = .ģ
        case "&#292;": self = .Ĥ
        case "&#293;": self = .ĥ
        case "&#294;": self = .Ħ
        case "&#295;": self = .ħ
        case "&#296;": self = .Ĩ
        case "&#297;": self = .ĩ
        case "&#298;": self = .Ī
        case "&#299;": self = .ī
        case "&#300;": self = .Ĭ
        case "&#301;": self = .ĭ
        case "&#302;": self = .Į
        case "&#303;": self = .į
        case "&#304;": self = .İ
        case "&#305;": self = .ı
        case "&#306;": self = .Ĳ
        case "&#307;": self = .ĳ
        case "&#308;": self = .Ĵ
        case "&#309;": self = .ĵ
        case "&#310;": self = .Ķ
        case "&#311;": self = .ķ
        case "&#312;": self = .ĸ
        case "&#313;": self = .Ĺ
        case "&#314;": self = .ĺ
        case "&#315;": self = .Ļ
        case "&#316;": self = .ļ
        case "&#317": self = .Ľ
        case "&#318;": self = .ľ
        case "&#319;": self = .Ŀ
        case "&#320;": self = .ŀ
        case "&#321;": self = .Ł
        case "&#322;": self = .ł
        case "&#323;": self = .Ń
        case "&#324;": self = .ń
        case "&#325;": self = .Ņ
        case "&#326;": self = .ņ
        case "&#327;": self = .Ň
        case "&#328;": self = .ň
        case "&#329;": self = .ŉ
        case "&#330;": self = .Ŋ
        case "&#331;": self = .ŋ
        case "&#332;": self = .Ō
        case "&#333;": self = .ō
        case "&#334;": self = .Ŏ
        case "&#335;": self = .ŏ
        case "&#336;": self = .Ő
        case "&#337;": self = .ő
        case "&#338;": self = .Œ
        case "&#339;": self = .œ
        case "&#340;": self = .Ŕ
        case "&#341;": self = .ŕ
        case "&#342;": self = .Ŗ
        case "&#343;": self = .ŗ
        case "&#344;": self = .Ř
        case "&#345;": self = .ř
        case "&#346;": self = .Ś
        case "&#347;": self = .ś
        case "&#348;": self = .Ŝ
        case "&#349;": self = .ŝ
        case "&#350;": self = .Ş
        case "&#351;": self = .ş
        case "&#352;": self = .Š
        case "&#353;": self = .š
        case "&#354;": self = .Ţ
        case "&#355;": self = .ţ
        case "&#356;": self = .Ť
        case "&#357": self = .ť
        case "&#358;": self = .Ŧ
        case "&#359;": self = .ŧ
        case "&#360;": self = .Ũ
        case "&#361;": self = .ũ
        case "&#362;": self = .Ū
        case "&#363;": self = .ū
        case "&#364;": self = .Ŭ
        case "&#365;": self = .ŭ
        case "&#366;": self = .Ů
        case "&#367;": self = .ů
        case "&#368;": self = .Ű
        case "&#369;": self = .ű
        case "&#370;": self = .Ų
        case "&#371;": self = .ų
        case "&#372;": self = .Ŵ
        case "&#373;": self = .ŵ
        case "&#374;": self = .Ŷ
        case "&#375;": self = .ŷ
        case "&#376;": self = .Ÿ
        case "&#377;": self = .Ź
        case "&#378;": self = .ź
        case "&#379;": self = .Ż
        case "&#380;": self = .ż
        case "&#381;": self = .Ž
        case "&#382;": self = .ž
        case "&#383;": self = .ſ
        default: self = .other(rawValue)
        }
    }
    
    var readableCharacter: Character {
        switch self {
        case .™: return "™"
        case .€: return "€"
        case .space: return " "
        case .exclamation: return "!"
        case .quotes: return "\""
        case .hashtag: return "#"
        case .$: return "$"
        case .percent: return "%"
        case .ampersand: return "&"
        case .singleQuote: return "'"
        case .openParenthesis: return "("
        case .closingParenthesis: return ")"
        case .astericks: return "*"
        case .plus: return "+"
        case .comma: return ","
        case .dash: return "-"
        case .period: return "."
        case .forwardslash: return "/"
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .colon: return ":"
        case .semiColon: return ";"
        case .lessThan: return "<"
        case .equal: return "="
        case .greaterThan: return ">"
        case .question: return "?"
        case .at: return "@"
        case .A: return "A"
        case .B: return "B"
        case .C: return "C"
        case .D: return "D"
        case .E: return "E"
        case .F: return "F"
        case .G: return "G"
        case .H: return "H"
        case .I: return "I"
        case .J: return "J"
        case .K: return "K"
        case .L: return "L"
        case .M: return "M"
        case .N: return "N"
        case .O: return "O"
        case .P: return "P"
        case .Q: return "Q"
        case .R: return "R"
        case .S: return "S"
        case .T: return "T"
        case .U: return "U"
        case .V: return "V"
        case .W: return "W"
        case .X: return "X"
        case .Y: return "Y"
        case .Z: return "Z"
        case .openBracket: return "["
        case .backslash: return "\\"
        case .closingBracket: return "]"
        case .caret: return "^"
        case .underscore: return "_"
        case .backTick: return "`"
        case .a: return "a"
        case .b: return "b"
        case .c: return "c"
        case .d: return "d"
        case .e: return "e"
        case .f: return "f"
        case .g: return "g"
        case .h: return "h"
        case .i: return "i"
        case .j: return "j"
        case .k: return "k"
        case .l: return "l"
        case .m: return "m"
        case .n: return "n"
        case .o: return "o"
        case .p: return "p"
        case .q: return "q"
        case .r: return "r"
        case .s: return "s"
        case .t: return "t"
        case .u: return "u"
        case .v: return "v"
        case .w: return "w"
        case .x: return "x"
        case .y: return "y"
        case .z: return "z"
        case .openCurly: return "{"
        case .verticalBar: return "|"
        case .closingCurly: return "}"
        case .tilde: return "~"
        case .NonBreakingSpace: return " "
        case .iexcl: return "¡"
        case .cent: return "¢"
        case .pound: return "£"
        case .curren: return "¤"
        case .yen: return "¥"
        case .brvbar: return "¦"
        case .sect: return "§"
        case .¨: return "¨"
        case .copy: return "©"
        case .ª: return "ª"
        case .leftArrows: return "«"
        case .not: return "¬"
        case .reg: return "®"
        case .¯: return "¯"
        case .degree: return "°"
        case .plusmn: return "±"
        case .²: return "²"
        case .³: return "³"
        case .´: return "´"
        case .µ: return "µ"
        case .para: return "¶"
        case .·: return "·"
        case .¸: return "¸"
        case .¹: return "¹"
        case .º: return "º"
        case .raquo: return "»"
        case .¼: return "¼"
        case .½: return "½"
        case .¾: return "¾"
        case .iquest: return "¿"
        case .À: return "À"
        case .Á: return "Á"
        case .Â: return "Â"
        case .Ã: return "Ã"
        case .Ä: return "Ä"
        case .Å: return "Å"
        case .Æ: return "Æ"
        case .Ç: return "Ç"
        case .È: return "È"
        case .É: return "É"
        case .Ê: return "Ê"
        case .Ë: return "Ë"
        case .Ì: return "Ì"
        case .Í: return "Í"
        case .Î: return "Î"
        case .Ï: return "Ï"
        case .Ð: return "Ð"
        case .Ñ: return "Ñ"
        case .Ò: return "Ò"
        case .Ó: return "Ó"
        case .Ô: return "Ô"
        case .Õ: return "Õ"
        case .Ö: return "Ö"
        case .times: return "×"
        case .Ø: return "Ø"
        case .Ù: return "Ù"
        case .Ú: return "Ú"
        case .Û: return "Û"
        case .Ü: return "Ü"
        case .Ý: return "Ý"
        case .Þ: return "Þ"
        case .ß: return "ß"
        case .à: return "à"
        case .á: return "á"
        case .â: return "â"
        case .ã: return "ã"
        case .ä: return "ä"
        case .å: return "å"
        case .æ: return "æ"
        case .ç: return "ç"
        case .è: return "è"
        case .é: return "é"
        case .ê: return "ê"
        case .ë: return "ë"
        case .ì: return "ì"
        case .í: return "í"
        case .î: return "î"
        case .ï: return "ï"
        case .ð: return "ð"
        case .ñ: return "ñ"
        case .ò: return "ò"
        case .ó: return "ó"
        case .ô: return "ô"
        case .õ: return "õ"
        case .ö: return "ö"
        case .divide: return "÷"
        case .ø: return "ø"
        case .ù: return "ù"
        case .ú: return "ú"
        case .û: return "û"
        case .ü: return "ü"
        case .ý: return "ý"
        case .þ: return "þ"
        case .ÿ: return "ÿ"
        case .Ā: return "Ā"
        case .ā: return "ā"
        case .Ă: return "Ă"
        case .ă: return "ă"
        case .Ą: return "Ą"
        case .ą: return "ą"
        case .Ć: return "Ć"
        case .ć: return "ć"
        case .Ĉ: return "Ĉ"
        case .ĉ: return "ĉ"
        case .Ċ: return "Ċ"
        case .ċ: return "ċ"
        case .Č: return "Č"
        case .č: return "č"
        case .Ď: return "Ď"
        case .ď: return "ď"
        case .Đ: return "Đ"
        case .đ: return "đ"
        case .Ē: return "Ē"
        case .ē: return "ē"
        case .Ĕ: return "Ĕ"
        case .ĕ: return "ĕ"
        case .Ė: return "Ė"
        case .ė: return "ė"
        case .Ę: return "Ę"
        case .ę: return "ę"
        case .Ě: return "Ě"
        case .ě: return "ě"
        case .Ĝ: return "Ĝ"
        case .ĝ: return "ĝ"
        case .Ğ: return "Ğ"
        case .ğ: return "ğ"
        case .Ġ: return "Ġ"
        case .ġ: return "ġ"
        case .Ģ: return "Ģ"
        case .ģ: return "ģ"
        case .Ĥ: return "Ĥ"
        case .ĥ: return "ĥ"
        case .Ħ: return "Ħ"
        case .ħ: return "ħ"
        case .Ĩ: return "Ĩ"
        case .ĩ: return "ĩ"
        case .Ī: return "Ī"
        case .ī: return "ī"
        case .Ĭ: return "Ĭ"
        case .ĭ: return "ĭ"
        case .Į: return "Į"
        case .į: return "į"
        case .İ: return "İ"
        case .ı: return "ı"
        case .Ĳ: return "Ĳ"
        case .ĳ: return "ĳ"
        case .Ĵ: return "Ĵ"
        case .ĵ: return "ĵ"
        case .Ķ: return "Ķ"
        case .ķ: return "ķ"
        case .ĸ: return "ĸ"
        case .Ĺ: return "Ĺ"
        case .ĺ: return "ĺ"
        case .Ļ: return "Ļ"
        case .ļ: return "ļ"
        case .Ľ: return "Ľ"
        case .ľ: return "ľ"
        case .Ŀ: return "Ŀ"
        case .ŀ: return "ŀ"
        case .Ł: return "Ł"
        case .ł: return "ł"
        case .Ń: return "Ń"
        case .ń: return "ń"
        case .Ņ: return "Ņ"
        case .ņ: return "ņ"
        case .Ň: return "Ň"
        case .ň: return "ň"
        case .ŉ: return "ŉ"
        case .Ŋ: return "Ŋ"
        case .ŋ: return "ŋ"
        case .Ō: return "Ō"
        case .ō: return "ō"
        case .Ŏ: return "Ŏ"
        case .ŏ: return "ŏ"
        case .Ő: return "Ő"
        case .ő: return "ő"
        case .Œ: return "Œ"
        case .œ: return "œ"
        case .Ŕ: return "Ŕ"
        case .ŕ: return "ŕ"
        case .Ŗ: return "Ŗ"
        case .ŗ: return "ŗ"
        case .Ř: return "Ř"
        case .ř: return "ř"
        case .Ś: return "Ś"
        case .ś: return "ś"
        case .Ŝ: return "Ŝ"
        case .ŝ: return "ŝ"
        case .Ş: return "Ş"
        case .ş: return "ş"
        case .Š: return "Š"
        case .š: return "š"
        case .Ţ: return "Ţ"
        case .ţ: return "ţ"
        case .Ť: return "Ť"
        case .ť: return "ť"
        case .Ŧ: return "Ŧ"
        case .ŧ: return "ŧ"
        case .Ũ: return "Ũ"
        case .ũ: return "ũ"
        case .Ū: return "Ū"
        case .ū: return "ū"
        case .Ŭ: return "Ŭ"
        case .ŭ: return "ŭ"
        case .Ů: return "Ů"
        case .ů: return "ů"
        case .Ű: return "Ű"
        case .ű: return "ű"
        case .Ų: return "Ų"
        case .ų: return "ų"
        case .Ŵ: return "Ŵ"
        case .ŵ: return "ŵ"
        case .Ŷ: return "Ŷ"
        case .ŷ: return "ŷ"
        case .Ÿ: return "Ÿ"
        case .Ź: return "Ź"
        case .ź: return "ź"
        case .Ż: return "Ż"
        case .ż: return "ż"
        case .Ž: return "Ž"
        case .ž: return "ž"
        case .ſ: return "ſ"
        case let .other(str): return str.characters[str.startIndex]
        }
    }
    
}
