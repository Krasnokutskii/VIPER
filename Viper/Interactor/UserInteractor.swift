//
//  CreateAccountInteractor.swift
//  Viper
//
//  Created by Yaroslav Krasnokutskiy on 30.7.22..
//

import Foundation
// ref to presenter
// api calls

protocol AnyInteractor{
    var presenter: AnyPresenter? {get set}
    
    func getUsers()
}
final class UserInteractor: AnyInteractor{
    var presenter: AnyPresenter?
   
    func getUsers(){
        let users = [
        User(name: "A"),
        User(name: "b"),
        User(name: "c"),
        User(name: "d"),
        User(name: "e"),
        User(name: "f"),
        User(name: "g"),
        User(name: "h")
        ]
        presenter?.interactorDidFetchUsers(with: .success(users))
    }
}
