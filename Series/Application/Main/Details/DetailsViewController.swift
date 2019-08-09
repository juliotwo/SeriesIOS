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
    @IBOutlet var animationsButtons: [UIButton]!
    @IBOutlet weak var animationLayout: NSLayoutConstraint!
    
    fileprivate(set) lazy var SinopsisView: UIView = {
        guard let view = Bundle.main.loadNibNamed("Sinopsis", owner: nil, options: [:])?.first as? UIView  else {
            return UIView()
        }
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        SinopsisView.frame.size.width = vistaDinamica.frame.size.width
        SinopsisView.frame.size.height = vistaDinamica.frame.size.height
       vistaDinamica.autoresizesSubviews = true
       
       vistaDinamica.addSubview(SinopsisView)
      
    
        
        //vistaDinamica =  emptyStateView
        // Do any additional setup after loading the view.
    }
    
    fileprivate(set) lazy var EpisodesView: UIView = {
        guard let view = Bundle.main.loadNibNamed("Episodes", owner: nil, options: [:])?.first as? UIView  else {
            return UIView()
        }
        return view
    }()
    
    fileprivate(set) lazy var ActorsView: UIView = {
        guard let view = Bundle.main.loadNibNamed("Actors", owner: nil, options: [:])?.first as? UIView  else {
            return UIView()
        }
        return view
    }()

    @IBAction func animateHeader(sender: UIButton) {
        animationLayout.constant = sender.frame.origin.x
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }) { (completed) in
            self.animationsButtons.forEach {
                $0.setTitleColor( UIColor(named: "TextColor") , for: .normal)
                sender.setTitleColor( UIColor.white , for: .normal)
            }
        }
    }

}
