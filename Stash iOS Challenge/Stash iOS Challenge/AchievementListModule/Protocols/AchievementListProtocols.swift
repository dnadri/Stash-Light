//
//  AchievementListProtocols.swift
//  Stash iOS Challenge
//
//  Created by David Nadri on 1/29/19.
//  Copyright © 2019 David Nadri. All rights reserved.
//

//import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    
    func fetchAchievements()
    func infoButtonTapped()
}

protocol PresenterToViewProtocol: class {
    func showAchievements(with achievements: [Achievements.Achievement])
    func showError()
    func showLoading()
    func hideLoading()
    func showInfo()
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> AchievementViewController
    //func pushToDetailScreen(navigationController: UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchAchievements()
}

protocol InteractorToPresenterProtocol: class {
    func achievementsFetched(achievements: [Achievements.Achievement])
    func achievementsFetchFailed()
}


