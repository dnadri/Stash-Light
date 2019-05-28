//
//  Achievements.swift
//  Stash iOS Challenge
//
//  Created by David Nadri on 1/29/19.
//  Copyright © 2019 David Nadri. All rights reserved.
//

import Foundation

struct Achievements: Codable {
    
    let success: Bool
    let status: Int
    let overview: Overview
    let achievements: [Achievement]
    
    struct Overview: Codable {
        let title: String
    }
    
    struct Achievement: Codable {
        let id: Int
        let level: String
        let progress: Int
        let total: Int
        let bgImageURL: String
        let accessible: Bool
        
        // Here we customize key names since the API contains snake-case
        enum CodingKeys: String, CodingKey {
            case id, level, progress, total
            case bgImageURL = "bg_image_url"
            case accessible
        }
    }
    
}

