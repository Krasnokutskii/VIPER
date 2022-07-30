//
//  UserRouter.swift
//  Viper
//
//  Created by Yaroslav Krasnokutskiy on 30.7.22..
//

import Foundation
import UIKit

// entry point

typealias EntryPoint = AnyView & UIViewController
protocol AnyRouter{
    var entry: EntryPoint? { get }
    static func start()->AnyRouter
}
final class UserRouter: AnyRouter{
    
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        // assign ViP
        var view: AnyView = UserView()
        var interactor: AnyInteractor = UserInteractor()
        var presenter: AnyPresenter = UserPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        // view should be created first
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
       
        router.entry = view as? EntryPoint
        
        
        return router
    }
}
