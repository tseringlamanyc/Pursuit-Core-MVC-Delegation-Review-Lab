//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self 
        data = Movie.allMovies
    }
    
    @IBAction func updateFont (segue: UIStoryboardSegue) {
        guard let vc = segue.source as? SettingViewController else {
            fatalError()
        }
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = data[indexPath.row]
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        return cell
    }
}

