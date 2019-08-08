//
//  SearchViewController.swift
//  Series
//
//  Created by SalvadorKano on 7/30/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textValue: UITextField!
    
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

        let name = "Login"
        let viewController = UIStoryboard(name: name, bundle: Bundle.main).instantiateInitialViewController()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = viewController
    }
    var viewModel = SearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.getdata()

    }
    
    @IBAction func search(_ sender: Any) {
        SeriesServices.getSearchSeries(value: textValue.text ?? "", handler: { [weak self] (success, error) in
            if let error = error {
                let alert = UIAlertController(title: "error", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            if success {
                
                print("llego lejos")
//                self?.viewModel.delegate = self
//                self?.viewModel.getdataByValue()
            }
        })
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
    
}
