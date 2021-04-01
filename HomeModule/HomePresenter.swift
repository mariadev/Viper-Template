//
//  HomePresenter.swift
//  ViperTemplate
//
//  Created by Maria on 02/02/2021.
//  
//

import Foundation
import UIKit

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("me ha llamado la vista")
        interactor?.interactorGetData()
        view?.showActivity()
    }
    
    func showDeatilView(with data: DataURL) {
        wireFrame?.presentNewViewDeatil(from: view!, withData: data)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func interactorPushDataPresenter(receivedData: [DataURL]) {
        view?.presenterPushDataView(receivedData: receivedData)
        view?.hideActivity()
    }
}
