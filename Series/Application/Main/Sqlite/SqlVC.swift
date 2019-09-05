//
//  SqlViewController.swift
//  Series
//
//  Created by julio vargas bautista on 9/2/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class SqlVC: UIViewController {
    let database = Database()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func insert(_ sender: Any) {
        database.insertUser(view: self)
    }
    
    @IBAction func obtener(_ sender: Any) {
        database.selectUsers()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
