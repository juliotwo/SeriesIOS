//
//  CellSearchViewModel.swift
//  Series
//
//  Created by julio vargas bautista on 8/7/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class CellSearchViewModel: UITableViewCell {

    @IBOutlet weak var serieName: UILabel!
    @IBOutlet weak var banner: UIImageView!
    
    var viewModel: SearchSerieViewModel!{
        didSet{
            setUpView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpView() {
        serieName.text = viewModel.seriesName
        banner.image = UIImage()
        
        

    }
    
}
