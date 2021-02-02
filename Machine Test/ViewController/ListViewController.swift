//
//  ViewController.swift
//  Machine Test
//
//  Created by komal_IT on 30/01/21.
//

import UIKit

class ListViewController: UIViewController{
    var dataArr = [result]()
    @IBOutlet var listingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchList()
        
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: listingCollectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        listingCollectionView.collectionViewLayout = flowLayout

    }

    func fetchList() {
        
        ApiManager.sharedInstance.getdata { (response)-> Void in
            
            self.dataArr = response
                
                DispatchQueue.main.async {
                    self.listingCollectionView.reloadData()
                }
          
        }
    }
 
}

extension ListViewController:UICollectionViewDataSource,UICollectionViewDelegate{
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
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

