//
//  ProfileViewController.swift
//  Series
//
//  Created by julio vargas bautista on 9/10/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    fileprivate var mainView: ProfileView {
        return self.view as! ProfileView
    }
    

   
    
    override func loadView() {
         
        view = ProfileView()
    }

   
}
