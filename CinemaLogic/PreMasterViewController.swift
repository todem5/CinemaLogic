//
//  PreMasterViewController.swift
//  CinemaLogic
//
//  Created by Dmitry Tolmachev on 10.08.16.
//  Copyright © 2016 Dmitry Tolmachev. All rights reserved.
//

import UIKit
import CoreData

class PreMasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    let menuMain2 = ["Быстрая","Легкая","Сложная","Компания","бббб"]
    private struct Storyboard {
        static let NameCell = "Cell2"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }

    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuMain2.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.NameCell, forIndexPath: indexPath)
        cell.textLabel?.text = menuMain2[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}