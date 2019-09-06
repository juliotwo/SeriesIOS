//
//  LoginViewController.swift
//  Series
//
//  Created by SalvadorKano on 7/29/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userNameImage = UIImage(named: "emailIcon") else { return }
        addLeftIconTo(textField: userName, andICon: userNameImage)
        
        guard let passwordImage = UIImage(named: "passwordIcon") else { return }
        addLeftIconTo(textField: password, andICon: passwordImage)
       
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
