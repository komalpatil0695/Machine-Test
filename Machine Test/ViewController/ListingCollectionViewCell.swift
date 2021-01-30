//
//  ListingCollectionViewCell.swift
//  Machine Test
//
//  Created by komal_IT on 30/01/21.
//

import UIKit

class ListingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var idLbl: UILabel!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var bodyLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.shadowOffset = CGSize(width: 0,height: 0.5)
    }
}
