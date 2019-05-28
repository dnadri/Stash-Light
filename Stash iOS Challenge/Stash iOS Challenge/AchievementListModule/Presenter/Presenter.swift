//
//  Presenter.swift
//  Stash iOS Challenge
//
//  Created by David Nadri on 1/29/19.
//  Copyright © 2019 David Nadri. All rights reserved.
//

import Foundation

class Presenter: ViewToPresenterProtocol {
    
    weak var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func fetchAchievements() {
        interactor?.fetchAchievements()
    }
    
    func infoButtonTapped() {
        view?.showInfo()
    }
    
}

extension Presenter: InteractorToPresenterProtocol {
   
    func achievementsFetched(achievements: [Achievements.Achievement]) {
        view?.showAchievements(with: achievements)
    }
    
    func achievementsFetchFailed() {
        view?.showError()
    }
    
}
