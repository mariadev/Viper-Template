//
//  HomeRemoteDataManager.swift
//  ViperTemplate
//
//  Created by Maria on 02/02/2021.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var getUrl = [CategoryURL]()
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    func externalGetData() {
        let session = URLSession.shared
        
        var request = URLRequest(url: URL(string: "https://cfeapps.com/wp-json/wp/v2/categories")!)
        
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        session.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil, let response = response as?
                    HTTPURLResponse else {
                print("connexion error : \(error!)")
                return
            }
            if response.statusCode == 200 {
                print("server: \(data)")
                do {
              
                    let decoder = JSONDecoder()
                    self.getUrl = try decoder.decode([CategoryURL].self, from: data)
                    
                    self.remoteRequestHandler?.remoteDataManagerCallBackData(with:
                        self.getUrl)
                }catch {
                    print("error: \(error.localizedDescription)")
                }
                
            }else {
                print("Error: \(response.statusCode)")
            }
            
        }.resume()
    }
    
}
