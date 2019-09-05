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
        addLeftIconTo(textFild: userName, andICon: userNameImage)
        
        guard let passwordImage = UIImage(named: "passwordIcon") else { return }
        addLeftIconTo(textFild: password, andICon: passwordImage)
       
        // Do any additional setup after loading the view.
    }
    
    func addLeftIconTo(textFild: UITextField, andICon img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        textFild.leftView = leftImageView
        textFild.leftViewMode = .always
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
