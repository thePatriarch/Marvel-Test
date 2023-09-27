//
//  AppDelegate.swift
//  Marvel
//
//  Created by Apple on 9/23/23.
//

import UIKit

enum DateFormats : String {
    case appFormat = "E, dd MMM yyyy HH:mm:ss 'GMT'"
}

struct Constants {
    struct Network {
        static let baseURl : String = "https://gateway.marvel.com:443/v1/public/"
        static let apiKey: String = "2bca81e81086741acda7954b28d79385"
    }
}
