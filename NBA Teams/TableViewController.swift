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
        
        tableView.allowsSelectionDuringEditing = true
    }

    
    // create temp new row to show "Add New Team" on each section
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            tableView.beginUpdates()
            
            for (index, sectionItems) in allNBATeamConference.enumerated() {
                let indexPath = IndexPath(row: sectionItems.count, section: index)
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            
            tableView.endUpdates()
            tableView.setEditing(true, animated: true)
        } else {
            tableView.beginUpdates()
            
            for (index, sectionItems) in allNBATeamConference.enumerated() {
                let indexPath = IndexPath(row: sectionItems.count, section: index)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            tableView.endUpdates()
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
        let addedRow = isEditing ? 1 : 0
        
        return allNBATeamConference[section].count + addedRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.row >= allNBATeamConference[indexPath.section].count && isEditing {
            cell.textLabel?.text = "Add New Team"
            cell.detailTextLabel?.text = nil
            cell.imageView?.image = nil
        } else {
            let item = allNBATeamConference[indexPath.section][indexPath.row]
            
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = item.location
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let conference = Team.Conference(rawValue: section) else {
            print("Invalid section number \(section) to generate a valid conference")
            return "Invalid conference"
        }
        
        switch conference {
        case .eastern:
            return "Eastern Conference"
        case .western:
            return "Western Conference"
        }
    }
    
}

// MARK: - TableView Delegate
extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            allNBATeamConference[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        } else if editingStyle == .insert {
            let section = indexPath.section
            
            guard let conference = Team.Conference(rawValue: section) else {
                print("Invalid section number \(section) to generate a valid conference")
                return
            }
            
            var newTeamName = "Please set my team name!"
            var newLocation = "Please set my location!"
            
            switch conference {
            case .eastern:
                newTeamName = "New team in Eastern Conference"
                newLocation = "somewhere in East Coast"
            case .western:
                newTeamName = "New team in Western Conference"
                newLocation = "somewhere in West Coast"
            }
            
            let newTeam = Team(name: newTeamName, location: newLocation, conference: conference)
            allNBATeamConference[indexPath.section].append(newTeam)
            tableView.insertRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        let sectionItems = allNBATeamConference[indexPath.section]
        if indexPath.row >= sectionItems.count {
            return .insert
        } else {
            return .delete
        }
    }

    // only allow row selection if it is the 'Add New Team' row
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let sectionItems = allNBATeamConference[indexPath.section]
        if isEditing && indexPath.row < sectionItems.count {
            return nil
        }
        return indexPath
    }
    
    // behaviour when the user tap the row 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sectionItems = allNBATeamConference[indexPath.section]
        if indexPath.row >= sectionItems.count && isEditing {
            self.tableView(tableView, commit: .insert, forRowAt: indexPath)
        }
    }
    
    // MARK: - for moving rows
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        let sectionItems = allNBATeamConference[indexPath.section]
        if indexPath.row >= sectionItems.count && isEditing {
            return false
        }
        return true
    }
    

    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = allNBATeamConference[sourceIndexPath.section][sourceIndexPath.row]
        
        allNBATeamConference[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        
        if sourceIndexPath.section == destinationIndexPath.section {
            // same section
            allNBATeamConference[sourceIndexPath.section].insert(itemToMove, at: destinationIndexPath.row)
        } else {
            allNBATeamConference[destinationIndexPath.section].insert(itemToMove, at: destinationIndexPath.row)
        }
    }
    
    // rules that prohibit move row to certain location 
    // in this case below 'Add New Team'
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        let sectionItems = allNBATeamConference[proposedDestinationIndexPath.section]
        
        // not allowing move below 'Add New Team row'
        if proposedDestinationIndexPath.row >= sectionItems.count  {
            return IndexPath(row: sectionItems.count - 1, section: proposedDestinationIndexPath.section)
        }
        return proposedDestinationIndexPath
    }
}

