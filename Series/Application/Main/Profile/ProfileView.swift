//
//  ProfileView.swift
//  Series
//
//  Created by julio vargas bautista on 9/20/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

class ProfileView: UIView {
    fileprivate let contentView = UIScrollView()
    fileprivate let rootFlexContainer = UIView()
    
    let imageProfile = UIImageView()
    
    let labelNameProfile = CustomLabel()
    let labelEmailProfile = CustomLabel()
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "Principal")
        imageProfile.frame.size.height = 100
        let image = UIImage(named: "EmptyState")
       
        imageProfile.image = image?.resize(maxWidthHeight: 50)
        
        labelNameProfile.text = "julio"
        labelEmailProfile.text = "julio@gmail.com"
        
    rootFlexContainer.flex.padding(10).alignItems(.center).define { (flex) in
            flex.addItem(imageProfile).grow(1)
            flex.addItem(labelNameProfile).width(50%).height(40).marginTop(20)
            flex.addItem(labelEmailProfile).width(50%).height(40).marginTop(20)
        
        }
        labelEmailProfile.layer.cornerRadius = 20
        contentView.addSubview(rootFlexContainer)
        
        addSubview(contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        contentView.pin.all(pin.safeArea)
        rootFlexContainer.pin.top().left().right()

        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout(mode: .adjustHeight)
        contentView.contentSize = rootFlexContainer.frame.size

    }
}
