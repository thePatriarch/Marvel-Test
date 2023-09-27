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
    
    func getCharacter(id: Int)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getCharacter(id: id)).map(CharacterAPIModel.self)
    }
    func getComics(id: Int)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getComics(id: id)).map(CharacterAPIModel.self)
    }
    func getEvents(id: Int)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getEvents(id: id)).map(CharacterAPIModel.self)
    }
    func getSeries(id: Int)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getSeries(id: id)).map(CharacterAPIModel.self)
    }
    func getStories(id: Int)->Single<CharacterAPIModel>{
        return self.provider.rx.request(.getStories(id: id)).map(CharacterAPIModel.self)
    }
}
