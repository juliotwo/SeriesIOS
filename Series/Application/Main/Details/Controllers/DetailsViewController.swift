//
//  DetailsViewController.swift
//  Series
//
//  Created by julio vargas bautista on 8/8/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var tituloSerieLabel: UILabel!
    
    @IBOutlet weak var vistaDinamica: UIView!
    @IBOutlet var animationsButtons: [UIButton]!
    @IBOutlet weak var animationLayout: NSLayoutConstraint!
    @IBOutlet weak var serieTitle: UILabel!
    
   

    fileprivate(set) lazy var SinopsisView: SinopsisViewModel = {
        guard let view = Bundle.main.loadNibNamed("Sinopsis", owner: nil, options: [:])?.first as? SinopsisViewModel  else {
            return SinopsisViewModel()
        }
        return view
    }()
    
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
    public var id:Int?
    public var seriesName:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "TextLogo")
        imageView.image = image
        navigationItem.titleView = imageView
        // Image needs to be added to project.
//        let buttonIcon = UIImage(named: "imageLogo")
        
//        let leftBarButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.done, target: self, action: #selector(DetailsViewController.myLeftSideBarButtonItemTapped(_:)))
//        leftBarButton.image = buttonIcon
//        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
//        self.navigationItem.title = "Hola"
        reloadView(names: SinopsisView)
        print(id ?? 6)
        print(seriesName ?? "Titulo")
        serieTitle.text = seriesName
        let id = self.id
        let defaults = UserDefaults.standard
        defaults.set(id, forKey: "id")
        //vistaDinamica =  emptyStateView
        // Do any additional setup after loading the view.
    }
    
    @objc func myLeftSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
    {
        print("myLeftSideBarButtonItemTapped")
    }
 

    func reloadView( names:UIView) -> Void {
       
        names.frame.size.width = vistaDinamica.frame.size.width
        names.frame.size.height = vistaDinamica.frame.size.height
        vistaDinamica.autoresizesSubviews = true
        
        vistaDinamica.addSubview(names)
        
    }
    
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
        print(sender.restorationIdentifier!)
        switch sender.restorationIdentifier {
        case "Detalles":
            reloadView(names: SinopsisView)
        case "Temporadas":
            reloadView(names: EpisodesView)
        case "Actores":
            reloadView(names: ActorsView)
        default:
            reloadView(names: SinopsisView)
        }
    }

}
