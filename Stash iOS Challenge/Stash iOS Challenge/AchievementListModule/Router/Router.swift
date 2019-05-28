//
//  Router.swift
//  Stash iOS Challenge
//
//  Created by David Nadri on 1/29/19.
//  Copyright © 2019 David Nadri. All rights reserved.
//

import Foundation

class Router: PresenterToRouterProtocol {
    
    static func createModule() -> AchievementViewController {
        
        let view = AchievementViewController()
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = Presenter()
        let interactor: PresenterToInteractorProtocol = Interactor()
        let router: PresenterToRouterProtocol = Router()
        
        view.presenter = presenter
        presenter.view = view as? PresenterToViewProtocol
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
}
