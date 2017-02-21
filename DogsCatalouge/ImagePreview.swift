//
//  ImagePreview.swift
//  DogsCatalouge
//
//  Created by Appinventiv on 21/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ImagePreview: UIViewController {

   
    @IBOutlet weak var contentImage: UIImageView!
    
    var imageURL : URL!
    var titleText: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        
        contentImage.af_setImage(withURL: imageURL)
            }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
