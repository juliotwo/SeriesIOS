//
//  SinopsisView.swift
//  Series
//
//  Created by SalvadorKano on 8/11/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class SinopsisView: UIView {

    public var id:Int?
    override func awakeFromNib() {
    super.awakeFromNib()
//        guard let id = UserDefaults.standard.string(forKey: "id") else { return }
        print("holaaaaa")
        print(id ?? 012)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
