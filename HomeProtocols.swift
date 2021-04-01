//
//  HomeProtocols.swift
//  ViperTemplate
//
//  Created by Maria on 02/02/2021.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func presenterPushDataView(receivedData: [DataURL])
    func showActivity()
    func hideActivity()
}

protocol HomeWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
    func presentNewViewDeatil(from view: HomeViewProtocol, withData: DataURL)
}

protocol HomePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    func viewDidLoad()
    func showDeatilView(with data: DataURL)
}

protocol HomeInteractorOutputProtocol: class {
    func interactorPushDataPresenter(receivedData: [DataURL]) 
}

protocol HomeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    
     // ineteractor will retrieve data when this fucntion is call fromt the presenter
    func interactorGetData()
}

protocol HomeDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    func externalGetData()
}

protocol HomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallBackData(with category: [CategoryURL])
}

protocol HomeLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
