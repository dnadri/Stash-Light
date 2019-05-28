//
//  AchievementViewController.swift
//  Stash iOS Challenge
//
//  Created by David Nadri on 1/29/19.
//  Copyright © 2019 David Nadri. All rights reserved.
//

import UIKit

class AchievementViewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?
    weak var collectionView: UICollectionView!
    var achievementsArray = [Achievements.Achievement]()
    
    lazy var infoBarButtonItem: UIBarButtonItem = {
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(handleInfoButton), for: .touchUpInside)
        let button = UIBarButtonItem(customView: infoButton)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            ])
        
        self.collectionView = collectionView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Smart Investing"
        self.navigationItem.rightBarButtonItem = infoBarButtonItem
        
        presenter?.fetchAchievements()
        
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(AchievementCollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellReuseIdentifier)
        
    }
    
    @objc func handleInfoButton() {
        presenter?.infoButtonTapped()
    }

}

extension AchievementViewController: PresenterToViewProtocol {
    func showAchievements(with achievements: [Achievements.Achievement]) {
        achievementsArray = achievements
        collectionView.reloadData()
    }
    
    func showError() {
        print("showError() called")
    }
    
    func showLoading() {
        print("showLoading() called")
    }
    
    func hideLoading() {
        print("hideLoading() called")
    }
    
    func showInfo() {
        print("showInfo() called")
        
        let alertController = UIAlertController(title: "Info", message: "This is a mock screen of the iOS Stash app's Stash Coach feature which displays a list of achievements a user can reach.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }
    
}

extension AchievementViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievementsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! AchievementCollectionViewCell
        let achievement = achievementsArray[indexPath.row]
        cell.configure(forAchievement: achievement)
        
        return cell
        
    }
    
}

extension AchievementViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? AchievementCollectionViewCell else { return }
        let item = achievementsArray[indexPath.item]
        if !item.accessible {
            // level is locked
            cell.shake()
        } else {
            // level is unlocked
            let alertController = UIAlertController(title: "Level \(item.level)", message: "You selected level \(item.level)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alertController, animated: true)
        }
        
    }
    
}

extension AchievementViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width - 50, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
    }
    
}
