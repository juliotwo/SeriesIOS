//
//  CustomLabel.swift
//  Series
//
//  Created by julio vargas bautista on 9/20/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

public class CustomLabel: UILabel{
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }
    
    private func setupLabel() {
        tintColor = UIColor.darkGray
        backgroundColor     = .white
        font = UIFont(name: Fonts.avenirNextMedium, size: 20)
        layer.cornerRadius  = 20
        //frame.size.width = UIScreen.main.bounds.width/3
        layer.masksToBounds = true
        textAlignment = .center
        
    }
}
