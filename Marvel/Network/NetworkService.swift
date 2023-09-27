//
//  AppDelegate.swift
//  Marvel
//
//  Created by Apple on 9/23/23.
//


import Foundation
import Moya


enum NetworkService {
    
    case getCharacter(id: Int)
    case getComics(id: Int)
    case getEvents(id: Int)
    case getSeries(id: Int)
    case getStories(id: Int)
    
}


extension NetworkService: TargetType {
    
    var baseURL: URL {
        return URL(string: Constants.Network.baseURl)!
    }
    
    var path: String {
        switch self{
        case .getCharacter(let id):
            return "characters/\(id)"
        case .getComics(let id):
            return "characters/\(id)/comics"
        case .getEvents(let id):
            return "characters/\(id)/events"
        case .getSeries(let id):
            return "characters/\(id)/series"
        case .getStories(let id):
            return "characters/\(id)/stories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self{
        default:
            return .requestParameters(parameters: ["apikey":Constants.Network.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.appFormat.rawValue
        
        return ["Content-Type": "application/json; charset=utf-8",
                "Date":dateFormatter.string(from: Date())]
    }
    
    var validationType : ValidationType {
        return .successCodes
    }
}
