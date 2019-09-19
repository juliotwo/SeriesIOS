//
//  CustomComponents.swift
//  Series
//
//  Created by julio vargas bautista on 9/5/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation
import UIKit


public class CustomButton: UIButton{
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setTitleColor(Colors.seanDarkGrey, for: .normal)
        backgroundColor     = .white
        titleLabel?.font    = UIFont(name: Fonts.avenirNextMedium, size: 20)
        layer.cornerRadius  = frame.size.height/2
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        
    }
}
