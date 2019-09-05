//
//  CustomTextField.swift
//  Series
//
//  Created by julio vargas bautista on 9/5/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation
import UIKit
func addLeftIconTo(textFild: UITextField, andICon img: UIImage) {
    let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))

    leftImageView.contentMode = .scaleAspectFit
    leftImageView.image = img
    // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
    leftImageView.tintColor = UIColor.white
    
    textFild.leftView = leftImageView
    textFild.leftViewMode = .always
  
    
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
