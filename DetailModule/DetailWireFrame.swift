//
//  DetailWireFrame.swift
//  ViperTemplate
//
//  Created by Maria on 03/02/2021.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {

    static func createDetailModule(with data: DataURL) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "detailView")
        if let view = viewController as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
            let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
            let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
            let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            presenter.dataUrlRecived = data
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
}
