//
//  SearchViewController.swift
//  Series
//
//  Created by SalvadorKano on 7/30/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textValue: UITextField!
    @IBOutlet weak var buttonCerrar: UIBarButtonItem!
    
    private var id: Int?
    private var seriesName: String?
    
    fileprivate(set) lazy var emptyStateView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView
            else {
                return UIView()
        }
        return view
    }()
    
    @IBAction func cerrarSesion(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "session")
        UserDefaults.standard.set(nil, forKey: "token")
       // self.performSegue(withIdentifier: "GoToLogin", sender: self)

//        let name = "Login"
//        let viewController = UIStoryboard(name: name, bundle: Bundle.main).instantiateInitialViewController()
   let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.initialViewController()
//        appDelegate.window?.rootViewController = viewController
    }
    var viewModel = SearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
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
        navigationItem.titleView = stackView
        navigationItem.backBarButtonItem =  UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        viewModel.delegate = self
        viewModel.getdata()

    }
    
    @IBAction func search(_ sender: Any) {
       searchSerie()
        
    }
    func searchSerie()-> Void{
        viewModel.getdataByName(name: textValue.text ?? "") { (lista, error, succes) in
            guard let succes = succes else {return}
            if !succes{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                    self.viewModel = SearchViewModel()
                    self.reloadData()
                }))
                
                
                self.present(alert, animated: true)
            }
       
            
        }
    }
}
extension SearchViewController :  SearchViewModelDelegate{
    func reloadData() {
        
        tableView.reloadData()

    }
}
extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.numberOfitems
        tableView.backgroundView = count == 0 ? emptyStateView : nil
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        return count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellSearchViewModel else{
            return UITableViewCell()
        }
        cell.viewModel = viewModel.item(at: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.id = viewModel.item(at: indexPath).id
        self.seriesName = viewModel.item(at: indexPath).seriesName
        self.performSegue(withIdentifier: "GoToDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pass = segue.destination as? DetailsViewController else { return }
            pass.id = self.id
            pass.seriesName = self.seriesName
        }
    
    }
