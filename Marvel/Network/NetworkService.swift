//
//  AppDelegate.swift
//  Marvel
//
//  Created by Apple on 9/23/23.
//


import Foundation
import Moya
import CommonCrypto


enum NetworkService {
    
    case getCharacters(params: [String:Any])
    case getCharacter(id: Int, params: [String:Any])
    case getComics(id: Int, params: [String:Any])
    case getEvents(id: Int, params: [String:Any])
    case getSeries(id: Int, params: [String:Any])
    case getStories(id: Int, params: [String:Any])
    
}


extension NetworkService: TargetType {
    
    var baseURL: URL {
        return URL(string: Constants.Network.baseURl)!
    }
    
    var path: String {
        switch self{
        case .getCharacters:
            return "characters"
        case .getCharacter(let id, _):
            return "characters/\(id)"
        case .getComics(let id, _):
            return "characters/\(id)/comics"
        case .getEvents(let id, _):
            return "characters/\(id)/events"
        case .getSeries(let id, _):
            return "characters/\(id)/series"
        case .getStories(let id, _):
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
            
        case let .getCharacters(params),
            let .getCharacter(_,params),
            let .getComics(_,params),
            let .getEvents(_,params),
            let .getSeries(_,params),
            let .getStories(_,params):
            return .requestParameters(parameters: self.generateServerSideAuthenticationParams(params: params), encoding: URLEncoding.queryString)
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


extension NetworkService {
    func generateServerSideAuthenticationParams(params: [String:Any]) -> [String:Any]{
        
        var tempDict = params
        let publicKey = Constants.Network.apiKey
        let privateKey = Constants.Network.privateKey
        let timestamp = String(Date().timeIntervalSince1970)
        
        let hashInput = timestamp + privateKey + publicKey
        
        if let data = hashInput.data(using: .utf8) {
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            _ = data.withUnsafeBytes { (buffer: UnsafeRawBufferPointer) in
                CC_MD5(buffer.baseAddress, CC_LONG(buffer.count), &hash)
            }
            
            let hashString = hash.map { String(format: "%02hhx", $0) }.joined()
            
            tempDict["ts"] = timestamp
            tempDict["apikey"] = publicKey
            tempDict["hash"] = hashString
            return tempDict
        }
        
        return params
    }
}
