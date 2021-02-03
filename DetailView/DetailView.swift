//
//  DetailView.swift
//  ViperTemplate
//
//  Created by Maria on 03/02/2021.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {

    @IBOutlet weak var label: UILabel!
    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    var data = String()
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    func showDataInLabel(data: DataURL) {
        label.text = data.dataURL
    }
    
    // TODO: implement view output methods
}
