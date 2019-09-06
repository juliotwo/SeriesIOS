//
//  RegisterViewController.swift
//  Series
//
//  Created by julio vargas bautista on 9/5/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var dataPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataPicker.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        guard let passwordImage = UIImage(named: "passwordIcon") else { return }
        addLeftIconTo(textField: password, andICon: passwordImage)
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
