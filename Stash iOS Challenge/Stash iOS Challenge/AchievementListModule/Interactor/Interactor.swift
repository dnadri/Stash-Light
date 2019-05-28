//
//  Interactor.swift
//  Stash iOS Challenge
//
//  Created by David Nadri on 1/29/19.
//  Copyright © 2019 David Nadri. All rights reserved.
//

import Foundation

class Interactor: PresenterToInteractorProtocol {
   
    weak var presenter: InteractorToPresenterProtocol?
    
    func fetchAchievements() {
        
        guard let url = Bundle.main.url(forResource: "achievements", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let json = try decoder.decode(Achievements.self, from: data)
            let achievements = json.achievements
            
            self.presenter?.achievementsFetched(achievements: achievements)
            
        } catch {
            print("Error: \(error)")
            self.presenter?.achievementsFetchFailed()
        }
        
    }
    
}
