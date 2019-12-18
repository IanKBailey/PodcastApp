//
//  Podcasts.swift
//  PodcastApp
//
//  Created by Ian Bailey on 12/17/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import Foundation

struct Podcasts: Codable {
    let results: [Results]
    
}

struct Results: Codable {
    let artistName: String?
    let trackName: String
    let artworkUrl600: String

}
