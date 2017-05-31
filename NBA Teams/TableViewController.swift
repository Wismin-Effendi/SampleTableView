//
//  TableViewController.swift
//  NBA Teams
//
//  Created by Wismin Effendi on 5/31/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    // ui obj
    @IBOutlet weak var tableView: UITableView!
    
    // code obj 
    var allNBATeamConference: [[Team]] = [NBATeam.easternConference, NBATeam.westernConference]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // assign delegate and data source 
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

// MARK: - TableView DataSource
extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return allNBATeamConference.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNBATeamConference[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = allNBATeamConference[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.location
        
        return cell
    }
    
}

// MARK: - TableView Delegate
extension TableViewController: UITableViewDelegate {
    
}

