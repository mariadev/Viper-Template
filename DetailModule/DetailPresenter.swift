//
//  DetailPresenter.swift
//  ViperTemplate
//
//  Created by Maria on 03/02/2021.
//  
//

import Foundation

class DetailPresenter:  DetailPresenterProtocol   {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var dataUrlRecived: DataURL?
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        if let dataRecived = dataUrlRecived {
            view?.showDataInLabel(data: dataRecived)
        }
    }
    
}


extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
