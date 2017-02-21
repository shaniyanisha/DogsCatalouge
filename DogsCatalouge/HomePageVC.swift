//
//  ViewController.swift
//  DogsCatalouge
//
//  Created by Appinventiv on 21/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import AlamofireImage
class HomePageVC : UIViewController {
    
    //Mark: outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dogsImageCollectionView: UICollectionView!
    
     // dogsImagesList contains all the images getting from json
     var dogsImagesList = [ImageInformationModel]()
    
    
    //Mark: START VIEW LIFE CYCLE
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false
        
        //Register the collection cell
        let CollectionCellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        dogsImageCollectionView.register(CollectionCellNib, forCellWithReuseIdentifier: "CollectionViewCellID")
        
        dogsImageCollectionView.dataSource = self
        dogsImageCollectionView.delegate = self
        
        // searchBar gets
        searchBar.delegate = self
        
        
        
        //setting the additional properties of cells
        let objectOfFlowLayout = UICollectionViewFlowLayout()
        objectOfFlowLayout.scrollDirection = .vertical
        objectOfFlowLayout.minimumLineSpacing = 3
        objectOfFlowLayout.minimumInteritemSpacing = 2
        objectOfFlowLayout.itemSize = CGSize(width: 110, height: 110)
        dogsImageCollectionView.collectionViewLayout = objectOfFlowLayout
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
 }


//Mark datasource and Delegate of collectionview
extension HomePageVC : UICollectionViewDataSource,UICollectionViewDelegate {
    
    //number of iteams in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return  dogsImagesList.count
        
      }
    
     // returns the cell for iteam
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellID", for: indexPath) as? CollectionViewCell else {
        
        fatalError("Cell Not Founds")
            
      }
        
        
        if let url = URL(string: dogsImagesList[indexPath.row].previewURL) {
        
              cell.dogsImages.af_setImage(withURL : url)
            
      }
    
              cell.dogsImages.contentMode = .scaleAspectFill
              //cell bordewidth
              cell.layer.borderWidth = 2
              //cell border color
              cell.layer.borderColor = UIColor.black.cgColor
            return cell
        
       }
    
    
    
    //did select function for selection particular cell with animation
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let previewImage = self.storyboard?.instantiateViewController(withIdentifier: "ImagePreview") as? ImagePreview else{
        
        fatalError()
        
        }
        
        previewImage.imageURL = URL(string: dogsImagesList[indexPath.row].webformatURL)
        self.navigationController?.pushViewController(previewImage, animated: true)
        UIView.animate(withDuration: 0.75, animations: { () -> Void in
        //  UIView.setAnimationCurve(UIViewAnimationCurve.easeInOut)
        UIView.setAnimationTransition(UIViewAnimationTransition.curlUp, for: self.navigationController!.view!, cache: false)
           })

 }
    
}

// extension of homepagevc
extension HomePageVC :  UISearchBarDelegate {
    
    
        // when seach bar tapped
       func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        Webservices().fetchDataFromPixabay(withQuery: searchBar.text!, success: { (images : [ImageInformationModel]) in
            self.dogsImagesList = images
            self.dogsImageCollectionView.reloadData()
        }) { (error : Error) in
            
        }
        searchBar.endEditing(true)
       dogsImageCollectionView.reloadData()
        

    }
    
}


