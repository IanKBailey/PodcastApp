//
//  PodcastViewController.swift
//  PodcastApp
//
//  Created by Ian Bailey on 12/17/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import UIKit

class PodcastViewController: UIViewController {

    @IBOutlet weak var podcastTableView: UITableView!
    
    
    
    
    private var podcasts = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.podcastTableView.reloadData()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPodcasts()
        podcastTableView.dataSource = self
        podcastTableView.delegate = self
    }
    
    private func loadPodcasts (){
        PodcastAPIClient.fetchPodcast { (result) in
            switch result {
                
            case .success(let data):
                self.podcasts = data
            case .failure(let appError):
                print("appError \(appError)")
                }
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let podcastDetailViewController = segue.destination as? PodcastDetailViewController, let indexPath = podcastTableView.indexPathForSelectedRow else {
            fatalError("Couldn't segue missing indexPath")
        }
        let podcast = podcasts[indexPath.row]
        podcastDetailViewController.pod
    }
    }









extension PodcastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "podcastCell", for: indexPath) as? CustomPodcastCell else {
            fatalError("failed to dequeue customCell")
        }
        let podcast = podcasts[indexPath.row]
        cell.configureCell(podcast: podcast)
        return cell
    }
    
    
}
extension PodcastViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

