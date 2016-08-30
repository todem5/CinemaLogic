//
//  Menu.swift
//  CinemaLogic
//
//  Created by Dmitry Tolmachev on 30.08.16.
//  Copyright © 2016 Dmitry Tolmachev. All rights reserved.
//

import UIKit

class Menu {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    //var rating: Int
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        //self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.
        //if name.isEmpty || rating < 0 {
        //    return nil
        //}
    }
    
}