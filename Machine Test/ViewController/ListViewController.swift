//
//  ViewController.swift
//  Machine Test
//
//  Created by komal_IT on 30/01/21.
//

import UIKit

class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var dataArr = [result]()

    @IBOutlet var listingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listingCollectionView.delegate = self
        self.listingCollectionView.dataSource = self
        fetchList()
    }

    func fetchList() {
        
        ApiManager.sharedInstance.getdata { (response)-> Void in
            
            self.dataArr = response
                
                DispatchQueue.main.async {
                    self.listingCollectionView.reloadData()
                }
          
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

      return dataArr.count
   }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
       
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListingCollectionViewCell", for: indexPath as IndexPath) as! ListingCollectionViewCell
       cell.idLbl.text = "Title : \(dataArr[indexPath.row].title)"
       cell.titleLbl.text = "Id : \(dataArr[indexPath.row].id)"
       cell.bodyLbl.text = "Body :\(dataArr[indexPath.row].body)"
       return cell
       
   }

  
}

