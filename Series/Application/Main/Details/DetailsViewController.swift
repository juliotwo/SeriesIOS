//
//  DetailsViewController.swift
//  Series
//
//  Created by julio vargas bautista on 8/8/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var vistaDinamica: UIView!
    fileprivate(set) lazy var emptyStateView: UIView = {
        guard let view = Bundle.main.loadNibNamed("Sinopsis", owner: nil, options: [:])?.first as? UIView  else {
            return UIView()
        }
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        emptyStateView.frame.size.width = vistaDinamica.frame.size.width
        emptyStateView.frame.size.height = vistaDinamica.frame.size.height
       vistaDinamica.autoresizesSubviews = true
       
       vistaDinamica.addSubview(emptyStateView)
      
    
        
        //vistaDinamica =  emptyStateView
        // Do any additional setup after loading the view.
    }
    

    

}
