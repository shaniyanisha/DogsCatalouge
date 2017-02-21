//
//  Webservices.swift
//  DogsCatalouge
//
//  Created by Appinventiv on 21/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class Webservices {
    
    func fetchDataFromPixabay(withQuery query: String,
                              success : @escaping (([ImageInformationModel]) -> Void),
                              failure : @escaping ((Error) -> Void)) {
        
        let URL = "https://pixabay.com/api/"
        
        let parameters = ["key" : "4611358-957f0eb791824267fb6b35793",
                          "q" : query
        ]
        
        NetworkController().GET(URL: URL,
                                parameters : parameters,
                                success : { (json : JSON) in
                                    
                                    print(json)
                                    
                                    let imagesArray = json["hits"].arrayValue
                                    
                                    var imageModels = [ImageInformationModel]()
                                    
                                    for image in imagesArray {
                                        
                                        imageModels.append(ImageInformationModel(withJSON: image))
                                    }
                                    
                                    success(imageModels)
                                    
        }, failure : { (error : Error) in
            
            failure(error)
        })
        
    }
    
}
