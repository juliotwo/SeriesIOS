//
//  SinopsisViewModel.swift
//  Series
//
//  Created by julio vargas bautista on 8/11/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class SinopsisViewModel: UIView {
    @IBOutlet weak var PrimeraEmision: UILabel!
    @IBOutlet weak var CategoriaLabel: UILabel!
    @IBOutlet weak var HorarioLabel: UILabel!
    @IBOutlet weak var CalificacionLabel: UILabel!
    @IBOutlet weak var SinopsisLabel: UITextView!
    
    var serie: DetailsSerieViewModel!{
        didSet{
            setUpView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpView() {
        CategoriaLabel.text = serie.genre
        PrimeraEmision.text = serie.firstAired
        HorarioLabel.text = serie.airsTime
        CalificacionLabel.text = String(serie.rarting)
        SinopsisLabel.text = serie.overview
    }
}
