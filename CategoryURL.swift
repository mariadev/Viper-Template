//
//  CategoryURL.swift
//  ViperTemplate
//
//  Created by Maria on 03/02/2021.
//

import Foundation

struct CategoryURL : Codable {
    
    var _links: Links
   
    struct Links: Codable {
        var selfy: [DataUrl]
        
        enum CodingKeys: String, CodingKey {
            case selfy = "self"
        }
    }
    
    struct DataUrl: Codable {
        var href: String
    }
}
