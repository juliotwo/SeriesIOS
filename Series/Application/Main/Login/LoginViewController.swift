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
        LoginService.obtenerToken(viewContoller: self, handler: { [weak self] (success, error) in
            if let error = error {
                let alert = UIAlertController(title: "error", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            if success {
                print("Antes del error")
                self?.performSegue(withIdentifier: "goToSearch", sender: self)
                print("Despues")
            }
        })
    }
    
}
