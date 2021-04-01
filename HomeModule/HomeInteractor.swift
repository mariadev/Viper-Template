//
//  HomeInteractor.swift
//  ViperTemplate
//
//  Created by Maria on 02/02/2021.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    var arrayURL = [DataURL]()
    
    func interactorGetData(){
        remoteDatamanager?.externalGetData()
        
    }

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    func remoteDataManagerCallBackData(with category: [CategoryURL]) {
        print("hey",category)
        for url in category {
            let urlString = DataURL(dataURL: url._links.selfy[0].href)
            self.arrayURL.append(urlString)
        }
        presenter?.interactorPushDataPresenter(receivedData: self.arrayURL)
    }

}
