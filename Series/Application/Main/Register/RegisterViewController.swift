//
//  RegisterViewController.swift
//  Series
//
//  Created by julio vargas bautista on 9/5/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var dataPicker: UIDatePicker!
    let base = Database()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataPicker.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        guard let passwordImage = UIImage(named: "passwordIcon") else { return }
        addLeftIconTo(textField: password, andICon: passwordImage)
        
    }
    

    
    @IBAction func Register(_ sender: Any) {
        validate()
    }
    func validate() {
        do {
            let emailv = try email.validatedText(validationType: ValidatorType.email)
            let namev = try name.validatedText(validationType: ValidatorType.name)
            let lastnamev = try lastName.validatedText(validationType: ValidatorType.lastName)
            let passwordv =  try password.validatedText(validationType: ValidatorType.password)
            self.base.registerUser(name: namev, lastname: lastnamev, email: emailv, password: passwordv)
            DispatchQueue.main.async {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.initialViewController()
            }
        } catch(let error) {
            showAlert(for: (error as! ValidationError).message,view: self)
    }
}


    

}
