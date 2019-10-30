//
//  CheckBoxViewController.swift
//  Series
//
//  Created by Salvador Kano on 9/26/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class CheckBoxViewController: UIViewController {
    
    @IBOutlet weak var firstCheckBox: UIButton!
    @IBOutlet weak var secondCheckBox: UIButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstCheckBoxView: UIButton!
    @IBOutlet weak var secondCheckBoxView: UIButton!
    @IBOutlet weak var ViewA: UIView!
    @IBOutlet weak var ViewB: UIView!
    @IBOutlet weak var ImageA: UIImageView!
    @IBOutlet weak var ImageB: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myFirstView = UITapGestureRecognizer(target: self, action: Selector(("firstSomeAction:")))
        self.firstView.addGestureRecognizer(myFirstView)
        let mySecondView = UITapGestureRecognizer(target: self, action: Selector(("secondSomeAction:")))
        self.secondView.addGestureRecognizer(mySecondView)
//        self.firstCheckBoxView.isSelected = true
        let myViewA = UITapGestureRecognizer(target: self, action: Selector(("someActionA:")))
        self.ViewA.addGestureRecognizer(myViewA)
        let myViewB = UITapGestureRecognizer(target: self, action: Selector(("someActionB:")))
        self.ViewB.addGestureRecognizer(myViewB)
        
        
    }
    func aqui() {
        print("we")
        func firstCheckBox(_ sender: UIButton) {
        
        self.secondCheckBox.isSelected = false
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
        if sender.isSelected {
           sender.isSelected = false
        } else {
            sender.isSelected  = true
            secondCheckBox.isSelected = false

        }
    }
}
    
    @IBAction func secondCheckBox(_ sender: UIButton) {
        
//        self.firstCheckBox.isSelected = false
//        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
//            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//        }) { (success) in
//            sender.isSelected = !sender.isSelected
//            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
//                sender.transform = .identity
//            }, completion: nil)
//        }
//        if sender.isSelected {
//           sender.isSelected = false
//        } else {
//            sender.isSelected  = true
//            firstCheckBox.isSelected = false
//        }
    }
    @objc func firstSomeAction(_ sender:UITapGestureRecognizer){
       print("Si jala")
        self.firstCheckBoxView.isSelected = true
        self.secondCheckBoxView.isSelected = false
        aqui()
        
    }
    @objc func someActionA(_ sender:UITapGestureRecognizer){
    print("Si jalaaa")
        if self.firstCheckBoxView.isSelected == false {
            ImageA.image = UIImage(named: "UnCheckbox")
        }else {
            ImageA.image = UIImage(named: "Checkbox")
        }
    }
    
    @objc func someActionB(_ sender:UITapGestureRecognizer){
    print("Si jalabb")
        if self.firstCheckBoxView.isSelected == false {
            ImageA.image = UIImage(named: "UnCheckbox")
        }else {
            ImageA.image = UIImage(named: "Checkbox")
        }
    }
    
    
    @objc func secondSomeAction(_ sender:UITapGestureRecognizer){
    print("Si jala")
     self.firstCheckBoxView.isSelected = false
     self.secondCheckBoxView.isSelected = true
    }
    
//    func setUpView() {
//        serieName.text = viewModel.seriesName
//        banner.image = UIImage()
//        if viewModel.banner == "" {
//            banner.image = UIImage(named: "EmptyState")
//        }else {
//            banner.load(url: URL(string: "https://www.thetvdb.com/banners/\(viewModel.banner)")!)
//        }
//    }
}
