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
        
        // workaround to remove extra padding on the top of tableView section header
        self.automaticallyAdjustsScrollViewInsets = false
        
        // add edit button as Navigation Bar Item
        navigationItem.rightBarButtonItem = editButtonItem
    }

    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            tableView.setEditing(true, animated: true)
        } else {
            tableView.setEditing(false, animated: true)
        }
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Eastern Conference"
        case 1:
            return "Western Conference"
        default:
            return "Please fix me!!"
        }
    }
    
}

// MARK: - TableView Delegate
extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            allNBATeamConference[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}

