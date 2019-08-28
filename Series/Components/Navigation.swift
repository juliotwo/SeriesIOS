//
//  File.swift
//  Series
//
//  Created by julio vargas bautista on 8/28/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation
import UIKit

public func navigationTitle(_ controller: UIViewController){
    controller.navigationController?.navigationBar.tintColor = UIColor.white
    
    let label1 = UILabel()
    label1.text = "Medio"
    label1.textColor = .white
    label1.sizeToFit()
    
    let label2 = UILabel()
    label2.text = "Melon"
    label2.textColor = .white
    label2.sizeToFit()
    
    let stackView = UIStackView(arrangedSubviews: [label1,label2])
    stackView.axis = .horizontal
    stackView.frame.size.width = label1.frame.width + label2.frame.width
    stackView.frame.size.height = max(label1.frame.height, label2.frame.height)
    controller.navigationItem.titleView = stackView
    controller.navigationItem.backBarButtonItem =  UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

}
public func navigationBackImage(_ controller: UIViewController){
    let image = UIImage(named: "imageLogo")
    let image2 = image?.resize(maxWidthHeight: 50)
    controller.navigationController?.navigationBar.backIndicatorTransitionMaskImage = image2
    controller.navigationController?.navigationBar.backIndicatorImage = image2
    
}
