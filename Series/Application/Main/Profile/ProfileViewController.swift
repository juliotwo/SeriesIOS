//
//  ProfileViewController.swift
//  Series
//
//  Created by julio vargas bautista on 9/10/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        // Do any additional setup after loading the view.
        addSlideMenuButton()
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        view.addSubview(newView)
      
        newView.translatesAutoresizingMaskIntoConstraints = false
        let bottonMargin = NSLayoutConstraint(item: newView, attribute:.bottomMargin, relatedBy:.equal, toItem: view, attribute:.bottomMargin, multiplier: 1, constant: -30)
        let topMargin = NSLayoutConstraint(item: newView, attribute: .topMargin, relatedBy:.equal, toItem: view, attribute:.topMargin, multiplier: 1, constant: view.safeAreaInsets.bottom + 30)
        //let widthConstraint = NSLayoutConstraint(item: newView, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: view.frame.width)
        //let heightConstraint = NSLayoutConstraint(item: newView, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: 100)
        let leftMargin  = NSLayoutConstraint(item: newView, attribute: .leftMargin, relatedBy:.equal, toItem: view, attribute:.leftMargin, multiplier: 1, constant: 30)
         let rightMargin  = NSLayoutConstraint(item: newView, attribute: .rightMargin, relatedBy:.equal, toItem: view, attribute:.rightMargin, multiplier: 1, constant: -30)
        NSLayoutConstraint.activate([topMargin, bottonMargin, leftMargin, rightMargin])
      
        
    }
    

   
}
