//
//  LoginViewController.swift
//  Series
//
//  Created by SalvadorKano on 7/29/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    @IBAction func AccessButton(_ sender: Any) {
        
        let disableMyButton = sender as? UIButton
        disableMyButton?.isEnabled = false
        LoginService.obtainToken { (token, error, succes) in
            guard let succes = succes else {
                return
            }
            if succes{
                self.performSegue(withIdentifier: "goToSearch", sender: self)
            }
        }
    }
    
}
