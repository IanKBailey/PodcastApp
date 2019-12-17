//
//  Podcasts.swift
//  PodcastApp
//
//  Created by Ian Bailey on 12/17/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import Foundation

struct Podcasts: Decodable {
    let result: [Results]
    
}

struct Results: Decodable {
    let artistName: String
    let collectionName: String
    let artworkUrl600: String
}
