//
//  CountryFlags.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/8/24.
//

import Foundation

enum CountryFlags: String {
    
    case Britain
    case Malaysia
    case America
    case Canada
    case Italy
    case Tunisia
    case France
    case Greece
    case Poland
    case Portugal
    case Russia
    case Croatia
 
    func asEmoji() -> String {
        switch self {
        case .Britain:
            return "🇬🇧"
        case .Malaysia:
            return "🇲🇾"
        case .America:
            return "🇺🇸"
        case .Canada:
            return "🇨🇦"
        case .Italy:
            return "🇮🇹"
        case .Tunisia:
            return "🇹🇳"
        case .France:
            return "🇫🇷"
        case .Greece:
            return "🇬🇷"
        case .Poland:
            return "🇵🇱"
        case .Portugal:
            return "🇵🇹"
        case .Russia:
            return "🇷🇺"
        case .Croatia:
            return "🇭🇷"
        }
    }
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
