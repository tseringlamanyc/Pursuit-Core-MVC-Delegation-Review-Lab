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
    
    var datas = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var fontSize: Double = 16.0 {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self 
        datas = Movie.allMovies
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else {
            fatalError()
        }
        settingVC.defaultFont = fontSize
    }
   
    
    @IBAction func updateFont (segue: UIStoryboardSegue) {
        guard let settingVC = segue.source as? SettingViewController else {
            fatalError()
        }
        fontSize = settingVC.defaultFont
    }
    
 
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = datas[indexPath.row]
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: CGFloat(fontSize) )
        cell.detailTextLabel?.font = UIFont(name: "HelveticaNeue-Light", size: CGFloat(fontSize))
        return cell
    }
}

