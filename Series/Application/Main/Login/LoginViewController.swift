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
        
//        LoginViewModel.AccessToken() { [weak self] (success, error) in
//            if let error = error {
//                let alert = UIAlertController(title: "error", message: error.localizedDescription, preferredStyle: .alert)
//                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
//                alert.addAction(ok)
//                self?.present(alert, animated: true, completion: nil)
//                return
//            }
//            if success {
//                self?.performSegue(withIdentifier: "goToMain", sender: self)
//            }
//        }
        //        let token = "https://api.thetvdb.com/login"
        //
        //        let objetoUrl = URL(string: token)
        //
        let body = [
            "apikey" : "PPDZ39EGKOEHNR3R",
            "userkey" : "JOEZYXMFGR0RDBXA",
            "username" : "tavromero2yu"
        ]
        var request = URLRequest(url: URL(string: "https://api.thetvdb.com/login")!)
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let tarea = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    if let parseJson = json {
                        let accessToken = parseJson["token"] as? String
                        
                        let defaults = UserDefaults.standard
                        
                        defaults.set(accessToken, forKey: "token")
                                                print(accessToken!)
                    }
                    
                    
                }catch {
                    print("El procedimiento del JSON tuvo un error")
                }
            }
            
        }
        
        tarea.resume()
    }
    
}
