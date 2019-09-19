//
//  CustomTextField.swift
//  Series
//
//  Created by julio vargas bautista on 9/5/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation
import UIKit
func addLeftIconTo(textField: UITextField, andICon image: UIImage) {
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 50))
    imageView.frame = CGRect(x: 13.0, y: 13.0, width: 24.0, height: 24.0)
    //For Setting extra padding other than Icon.
    let seperatorView = UIView(frame: CGRect(x: 50, y: 0, width: 10, height: 50))
    //seperatorView.backgroundColor = UIColor(red: 80/255, green: 89/255, blue: 94/255, alpha: 1)
    view.addSubview(seperatorView)
    textField.leftViewMode = .always
    view.addSubview(imageView)
    //view.backgroundColor = .darkGray
    textField.leftViewMode = UITextField.ViewMode.always
    textField.leftView = view
    
}

class SAAuthTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpField()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        setUpField()
    }
    
    
    private func setUpField() {
        borderStyle           = .none
        layer.cornerRadius    = frame.size.height/2
        tintColor             = Colors.seanDarkGrey
        textColor             = Colors.seanDarkGrey
        font                  = UIFont(name: Fonts.avenirNextMedium, size: 16)
        backgroundColor       = UIColor.white.withAlphaComponent(0.7)
        autocorrectionType    = .no
        clipsToBounds         = true
        
        let placeholder       = self.placeholder != nil ? self.placeholder! : ""
        let placeholderFont   = UIFont(name: Fonts.avenirNextMedium, size: 16)!
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes:
            [NSAttributedString.Key.foregroundColor: Colors.seanDarkGrey,
             NSAttributedString.Key.font: placeholderFont])
        
        let indentView        = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftView              = indentView
        leftViewMode          = .always
    }
}
