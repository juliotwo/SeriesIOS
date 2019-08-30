//
//  SinopsisViewModel.swift
//  Series
//
//  Created by julio vargas bautista on 8/11/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class SinopsisViewController: UIViewController {
    @IBOutlet weak var PrimeraEmision: UILabel!
    @IBOutlet weak var CategoriaLabel: UILabel!
    @IBOutlet weak var HorarioLabel: UILabel!
    @IBOutlet weak var CalificacionLabel: UILabel!
    @IBOutlet weak var SinopsisLabel: UITextView!
    @IBOutlet weak var posterImage: UIImageView!
    
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
        CategoriaLabel.text = serie.genre == "" ? "No hay datos" : serie.genre
        PrimeraEmision.text = serie.firstAired  == "" ? "No hay datos" : serie.firstAired
        HorarioLabel.text = serie.airsTime  == "" ? "No hay datos" : serie.airsTime
        CalificacionLabel.text = String(serie.rarting)  == "0.0" ? "No hay datos" : String(serie.rarting)
        SinopsisLabel.text = serie.overview  == "" ? "No hay datos" : serie.overview
        posterImage.image = UIImage()
        if serie.poster == "" {
            posterImage.image = UIImage(named: "EmptyState")
        }else {
            posterImage.load(url: URL(string: serie.poster)!)
        }
    }
}
