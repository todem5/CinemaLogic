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
    var menus = [Menu]()
    
    func loadMenu() {
        let label01 = UIImage(named: "01")!
        let position1 = Menu(name: "Игра", photo: label01)!
    
        let label02 = UIImage(named: "02")!
        let position2 = Menu(name: "Cтатистика", photo: label02)!
    
        let label03 = UIImage(named: "03")!
        let position3 = Menu(name: "Достижения", photo: label03)!
    
        let label04 = UIImage(named: "04")!
        let position4 = Menu(name: "Помощь", photo: label04)!
    
        let label05 = UIImage(named: "05")!
        let position5 = Menu(name: "Оценить", photo: label05)!
    
        menus += [position1, position2, position3, position4, position5]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMenu()
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
    }

    
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "firstDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
            let nav = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                //let destinationVC = nav.topViewController as! MasterViewController
                //nav.delegate = self
                nav.textL = menus[indexPath.row].name
                nav.pictLabel = menus[indexPath.row].photo
                nav.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                nav.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 3  // section 0 has 3 rows
        case 1: return 2  // section 1 has 2 row
        default: fatalError("Unknown number of sections")
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MasterTableViewCell
        
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0: cell.nameLabel.text = menus[indexPath.row].name
                    cell.imageCell.image = menus[indexPath.row].photo
            case 1: cell.nameLabel.text = menus[indexPath.row].name
                    cell.imageCell.image = menus[indexPath.row].photo
            case 2: cell.nameLabel.text = menus[indexPath.row].name
                    cell.imageCell.image = menus[indexPath.row].photo
            default: break
            }
        case 1: 
            switch(indexPath.row) {
            case 0: cell.nameLabel.text = menus[indexPath.row].name
                    cell.imageCell.image = menus[indexPath.row].photo
            case 1: cell.nameLabel.text = menus[indexPath.row].name
                    cell.imageCell.image = menus[indexPath.row].photo
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
     func controllerDidChangeContent(controller: NSFetchedResultsController) {
         // In the simplest, most efficient, case, reload the table view.
         self.tableView.reloadData()
     }
     */


