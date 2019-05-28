//
//  AchievementCollectionViewCell.swift
//  Stash iOS Challenge
//
//  Created by David Nadri on 1/29/19.
//  Copyright © 2019 David Nadri. All rights reserved.
//

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {
    
    lazy var circleView: CircleView = {
        let circle = CircleView(frame: .zero)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    lazy var levelTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .black
        label.text = "Level"
        label.font = UIFont.LatoRegularFontOfSize(size: 17)
        label.textAlignment = .center
        return label
    }()
    
    lazy var levelNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.LatoBlackFontOfSize(50)
        label.textAlignment = .center
        return label
    }()
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.LatoBoldFontOfSize(17)
        label.textAlignment = .left
        return label
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.LatoBoldFontOfSize(17)
        label.textAlignment = .right
        return label
    }()
    
    lazy var progressView: UIProgressView = {
        let pv = UIProgressView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.trackTintColor = .white
        pv.progressTintColor = UIColor(red: 102.0/255.0, green: 195.0/255.0, blue: 82.0/255.0, alpha: 1.0)
        pv.layer.cornerRadius = 5
        pv.layer.masksToBounds = true
        // Set rounded corners for the inner bar
        pv.layer.sublayers?[1].cornerRadius = 5
        pv.subviews[1].clipsToBounds = true
        return pv
    }()
    
    weak var bgImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCellLayout()
        configureImageView()
        configureCircleControls()
        configureBottomControls()
        
    }
    
    fileprivate func configureCellLayout() {
        
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    fileprivate func configureImageView() {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        self.contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        bgImageView = imageView
    }
    
    fileprivate func configureCircleControls() {
        
        // Configure circle view
        self.contentView.addSubview(circleView)
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            circleView.heightAnchor.constraint(equalToConstant: contentView.bounds.height / 2),
            circleView.widthAnchor.constraint(equalToConstant: contentView.bounds.height / 2),
            circleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            ])
        
        /* Add circle subviews */
        // Level Text
        self.circleView.addSubview(levelTextLabel)
        NSLayoutConstraint.activate([
            levelTextLabel.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 20),
            levelTextLabel.leadingAnchor.constraint(equalTo: circleView.leadingAnchor),
            levelTextLabel.trailingAnchor.constraint(equalTo: circleView.trailingAnchor),
            levelTextLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            ])

        // Level Number
        self.circleView.addSubview(levelNumberLabel)
        NSLayoutConstraint.activate([
            levelNumberLabel.bottomAnchor.constraint(equalTo: circleView.bottomAnchor, constant: -8),
            levelNumberLabel.leadingAnchor.constraint(equalTo: circleView.leadingAnchor),
            levelNumberLabel.trailingAnchor.constraint(equalTo: circleView.trailingAnchor),
            levelNumberLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            ])
        
    }
    
    fileprivate func configureBottomControls() {
        
        // StackView holding bottom controls
        let bottomControlsStackView = UIStackView(arrangedSubviews:
            [progressLabel, totalLabel])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        self.contentView.addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            ])
        
        // Progress Bar
        self.contentView.addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.bottomAnchor.constraint(equalTo: bottomControlsStackView.topAnchor, constant: -8),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            progressView.heightAnchor.constraint(equalToConstant: 10)
            ])

    }
    
    func configure(forAchievement achievement: Achievements.Achievement) {

        let url = URL(string: achievement.bgImageURL)!
        
        // Natively download image from URL
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn, animations: {
                        self.bgImageView.alpha = 1.0
                        self.bgImageView.image = UIImage(data: data)
                    }, completion: nil)
                }
            } else {
                DispatchQueue.main.async {
                    self.bgImageView.image = #imageLiteral(resourceName: "placeholderImage")
                }
            }
        }
        
        // Level Label
        self.levelNumberLabel.text = achievement.level
        
        // Progress Label
        self.progressLabel.text = "\(achievement.progress)pts"
        
        // Total Label
        self.totalLabel.text = "\(achievement.total)pts"
        
        // Progress Bar
        self.progressView.progress = Float(achievement.progress) / Float(achievement.total)
        
        self.enable(on: achievement.accessible)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fatalError("Interface Builder is not supported!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
}
