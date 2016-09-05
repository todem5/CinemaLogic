//
//  DetailViewController.swift
//  CinemaLogic
//
//  Created by Dmitry Tolmachev on 27.07.16.
//  Copyright © 2016 Dmitry Tolmachev. All rights reserved.
//

import UIKit

//protocol SettingsViewControllerDelegate {
//    func getData(lText: String)
//}

class DetailViewController: UIViewController {
    
    var textL = ""
    var pictLabel: UIImage?
    //var delegate: DetailViewControllerDelegate?

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imgL: UIImageView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        //if let detail = self.detailItem {
            if let label = self.detailLabel {
                label.text = textL
                imgL.image = pictLabel
            }
        //}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

