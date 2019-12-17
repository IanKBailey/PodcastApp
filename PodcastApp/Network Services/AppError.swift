//
//  AppError.swift
//  PodcastApp
//
//  Created by Ian Bailey on 12/17/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import Foundation

enum AppError: Error, CustomStringConvertible {
  case badURL(String)
  case noResponse
  case networkClientError(Error)
  case noData
  case decodingError(Error)
  case encodingError(Error)
  case badStatusCode(Int)
  case badMimeType(String)
    
    
    
    var description: String {
        return "AppError: \(self)"
    }
}
