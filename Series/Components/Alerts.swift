//
//  Alerts.swift
//  Series
//
//  Created by julio vargas bautista on 9/9/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
func showAlert(for alert: String, view: UIViewController) {
    let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
    let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(alertAction)
    view.present(alertController, animated: true, completion: nil)
}
