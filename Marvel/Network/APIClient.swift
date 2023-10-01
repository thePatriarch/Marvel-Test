//
//  AppDelegate.swift
//  Marvel
//
//  Created by Apple on 9/23/23.
//


import Foundation
import Moya
import RxSwift


class  APIClient {
    
    static let shared = APIClient()
    private let provider : MoyaProvider<NetworkService>
    
    
    init(){
        provider = MoyaProvider<NetworkService>()
    }
    
    func getCharacters(params: [String:Any]? = nil)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getCharacters(params: params ?? [:])).map(CharacterAPIModel.self)
    }
    func getCharacter(id: Int, params: [String:Any]? = nil)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getCharacter(id: id, params: params ?? [:])).map(CharacterAPIModel.self)
    }
    func getComics(id: Int, params: [String:Any]? = nil)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getComics(id: id, params: params ?? [:])).map(CharacterAPIModel.self)
    }
    func getEvents(id: Int, params: [String:Any]? = nil)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getEvents(id: id, params: params ?? [:])).map(CharacterAPIModel.self)
    }
    func getSeries(id: Int, params: [String:Any]? = nil)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getSeries(id: id, params: params ?? [:])).map(CharacterAPIModel.self)
    }
    func getStories(id: Int, params: [String:Any]? = nil)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getStories(id: id, params: params ?? [:])).map(CharacterAPIModel.self)
    }
}
