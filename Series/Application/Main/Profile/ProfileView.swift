//
//  ProfileView.swift
//  Series
//
//  Created by julio vargas bautista on 9/20/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
import FlexLayout

class ProfileView: UIView {
    fileprivate let contentView = UIScrollView()
    fileprivate let rootFlexContainer = UIView()
    
    let imageProfile = UIImageView()
    
    let nameProfile = UILabel()
    let emailProfile = UILabel()
    init() {
        super.init(frame: .zero)
        imageProfile.image = UIImage(named: "EmptyState")
    rootFlexContainer.flex.justifyContent(.center).padding(10).define { (flex) in
            flex.addItem(imageProfile)
            flex.addItem(nameProfile).marginTop(10)
            flex.addItem(emailProfile).marginTop(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
