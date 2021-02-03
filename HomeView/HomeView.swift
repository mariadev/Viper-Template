//
//  HomeView.swift
//  ViperTemplate
//
//  Created by Maria on 02/02/2021.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var arrayViewURL = [DataURL]()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    
    func presenterPushDataView(receivedData: [DataURL]) {
        arrayViewURL = receivedData
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showActivity() {
        DispatchQueue.main.async {
            self.spinner.startAnimating()
        }
    }
    
    func hideActivity() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.spinner.hidesWhenStopped = true
        }
    }
    // TODO: implement view output methods
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayViewURL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = arrayViewURL[indexPath.row].dataURL
        return cell
    }
    
}

extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDeatilView(with: DataURL(dataURL:
        arrayViewURL[indexPath.row].dataURL))
    }
}
