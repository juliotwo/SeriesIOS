//
//  LoginViewController.swift
//  Series
//
//  Created by SalvadorKano on 7/29/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
import PasswordTextField
import Firebase
class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: PasswordTextField!
    @IBOutlet weak var Access: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    let baseDatos = Database()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userNameImage = UIImage(named: "emailIcon") else { return }
        addLeftIconTo(textField: userName, andICon: userNameImage)
        
        guard let passwordImage = UIImage(named: "passwordIcon") else { return }
        addLeftIconTo(textField: password, andICon: passwordImage)
       Access.isEnabled = false
        Access.backgroundColor = UIColor.darkGray
        // Do any additional setup after loading the view.
        userName.addTarget(self, action: #selector(didChanged), for: UIControl.Event.editingChanged)
        password.addTarget(self, action: #selector(didChanged), for: UIControl.Event.editingChanged)
//        var mobileNumer = "+91987654321"
//        let intLetters = mobileNumer.prefix(3)
//        let endLetters = mobileNumer.suffix(2)
//        
//        let newString = intLetters + "*******" + endLetters   //"+91*******21"
    }
    
    @objc func didChanged (){
       validate()
    
    }
    func validate() {
        do {
            _ = try userName.validatedText(validationType: .email)
            _ = try password.validatedText(validationType: .password)
            Access.isEnabled = true
            Access.backgroundColor = UIColor.white
        } catch {
            print((error as! ValidationError).message )
            Access.isEnabled = true
        }
    }

    
    @IBAction func AccessButton(_ sender: Any) {
        
        //let disableMyButton = sender as? UIButto
        //disableMyButton?.isEnabled = false
        Analytics.logEvent(AnalyticsEventLogin, parameters: nil)
        let exist = baseDatos.SelectUser(emailUser: userName.text ?? "julio" ,passwordUser: password.text ?? "55", view: self)
        if exist
        {
            
                    LoginService.obtainToken { (token, error, succes) in
                        guard let succes = succes else {
                            return
                        }
                        if succes{
                          let ViewController : UIViewController = UIStoryboard(name: "Search", bundle: Bundle.main).instantiateViewController(withIdentifier: "Home")
                            self.navigationController?.pushViewController(ViewController, animated: true)
                        }
                    }
        }
//        LoginService.obtainToken { (token, error, succes) in
//            guard let succes = succes else {
//                return
//            }
//            if succes{
//                self.performSegue(withIdentifier: "goToSearch", sender: self)
//            }
//        }
    }
    
}
