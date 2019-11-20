//
//  ViewController.swift
//  Scheduler
//
//  Created by Gregory Keeley on 11/20/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class ScheduleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        events = Event.getTestData()
    }
    
    @IBAction func addNewEvent(segue: UIStoryboardSegue) {
        guard let createEventController = segue.source as? CreateEventViewController,
            let createdEvent = createEventController.event else {
                fatalError("Failed to access CreateEventViewController")
        }
        events.insert(createdEvent, at: 0) // This is set to put the event at the top of events array
        // create an index path to be inserted into the table view
        let indexPath = IndexPath(row: 0, section: 0) // will represent the top of the table view
        
        // use indexPath to insert into tableView
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
}


extension ScheduleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = event.date.description
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            print("Inserting...")
        case .delete:
            print("Deleting...")
            events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            print(".....")
        }
    }
}

