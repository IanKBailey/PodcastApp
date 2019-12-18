//
//  CustomPodcastCell.swift
//  PodcastApp
//
//  Created by Ian Bailey on 12/17/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import UIKit

class CustomPodcastCell: UITableViewCell {

  
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    
    
    func configureCell(podcast: Results) {
        nameLabel.text = podcast.trackName
        artistLabel.text = podcast.artistName
        
        cellImage.getImage(with: podcast.artworkUrl600) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.cellImage.image = image
                }
            case .failure:
                DispatchQueue.main.async {
                    self.cellImage.image = UIImage(systemName: "person.fill")
                }
            }
        }
    }
}




