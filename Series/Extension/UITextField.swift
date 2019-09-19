//
//  UITextField.swift
//  Series
//
//  Created by julio vargas bautista on 9/6/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit.UITextField

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
  
}
