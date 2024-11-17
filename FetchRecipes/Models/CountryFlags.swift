//
//  CountryFlags.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/8/24.
//

import Foundation

enum CountryFlags: String, CaseIterable {
    
    init(forCountry: String) {
        for flag in CountryFlags.allCases {
            if flag.rawValue.lowercased() == forCountry.lowercased() {
                self = flag
                return
            }
        }
        self = CountryFlags._undefined
    }
    
    case British
    case Malaysian
    case American
    case Canadian
    case Italian
    case Tunisian
    case French
    case Greek
    case Polish
    case Portuguese
    case Russian
    case Croatian
    case _undefined
 
    func asEmojiString() -> String {
        switch self {
        case .British:
            return "🇬🇧"
        case .Malaysian:
            return "🇲🇾"
        case .American:
            return "🇺🇸"
        case .Canadian:
            return "🇨🇦"
        case .Italian:
            return "🇮🇹"
        case .Tunisian:
            return "🇹🇳"
        case .French:
            return "🇫🇷"
        case .Greek:
            return "🇬🇷"
        case .Polish:
            return "🇵🇱"
        case .Portuguese:
            return "🇵🇹"
        case .Russian:
            return "🇷🇺"
        case .Croatian:
            return "🇭🇷"
        case ._undefined:
            return "NIL"
        }
    }
    
//    func getCountryFlag(_ forCountry: String) -> CountryFlags {
//        for flag in CountryFlags.allCases {
//            if flag.rawValue.prefix(3) == forCountry.prefix(3) {
//                return flag
//            }
//        }
//        return CountryFlags._undefined
//    }
    
}

//= "🇬🇧"
//= "🇲🇾"
//= "🇺🇸"
//= "🇨🇦"
//= "🇮🇹"
//= "🇹🇳"
//= "🇫🇷"
//= "🇬🇷"
//= "🇵🇱"
//= "🇵🇹"
//= "🇷🇺"
//= "🇭🇷"
