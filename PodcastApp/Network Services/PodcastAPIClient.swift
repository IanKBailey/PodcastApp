//
//  PodcastAPIClient.swift
//  PodcastApp
//
//  Created by Ian Bailey on 12/17/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import Foundation

struct PodcastAPIClient {
    static func fetchPodcast(completion: @escaping (Result <[Results], AppError>) ->()) {
        let podcastURL = "https://itunes.apple.com/search?media=podcast&limit=200&term=swift"
        
        guard let url = URL(string: podcastURL) else {
            completion(.failure(.badURL(podcastURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let podcasts = try JSONDecoder().decode(Podcasts.self, from: data)
                    completion(.success(podcasts.results))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
