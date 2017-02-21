//
//  ImagesInformationModel.swift
//  DogsCatalouge
//
//  Created by Appinventiv on 21/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ImageInformationModel {
    
    var downloads = 0
    var favorites = 0
    var likes = 0
    var pageURL : String = ""
    var userImageURL : String = ""
    var webformatURL : String = ""
    var previewURL : String = ""
    
    init(withJSON json: JSON) {
        
        self.downloads = json["downloads"].intValue
        self.favorites = json["favorites"].intValue
        self.likes = json["likes"].intValue
        self.pageURL = json["pageURL"].stringValue
        self.userImageURL = json["userImageURL"].stringValue
        self.webformatURL = json["webformatURL"].stringValue
        self.previewURL = json["previewURL"].stringValue
        
    }
    
}

