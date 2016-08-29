//
//  MasterViewController.swift
//  CinemaLogic
//
//  Created by Dmitry Tolmachev on 27.07.16.
//  Copyright © 2016 Dmitry Tolmachev. All rights reserved.
//

import UIKit


class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    let group1 = ["Игра","Cтатистика","Достижения"]
    let group2 = ["Помощь","Оценить"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //добавляет конопочку Edit слева вверху
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()

        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject(_:)))
        //self.navigationItem.rightBarButtonItem = addButton
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
           self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "preShow" {
            // это будет нужно выделении строчек
            //if let indexPath = self.tableView.indexPathForSelectedRow {
            //let object = self.fetchedResultsController.objectAtIndexPath(indexPath)
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                //controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            //}
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return group1.count  // section 0 has 3 rows
        case 1: return group2.count  // section 1 has 2 row
        default: fatalError("Unknown number of sections")
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MasterTableViewCell
        
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0: cell.nameLabel.text = group1[indexPath.row]
            case 1: cell.nameLabel.text = group1[indexPath.row]
            case 2: cell.nameLabel.text = group1[indexPath.row]
            default: break
            }
        case 1:
            switch(indexPath.row) {
            case 0: cell.nameLabel.text = group2[indexPath.row]
            case 1: cell.nameLabel.text = group2[indexPath.row]
            default: break
            }
        default: fatalError("Unknown section")
        }

        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //if editingStyle == .Delete {
            //let context = self.fetchedResultsController.managedObjectContext
            //context.deleteObject(self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject)
        //  }
        }
    }
    

    // MARK: - Fetched results controller

    
    /*
     // Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed.
     
     func controllerDidChangeContent(controller: NSFetchedResultsController) {
         // In the simplest, most efficient, case, reload the table view.
         self.tableView.reloadData()
     }
     */


