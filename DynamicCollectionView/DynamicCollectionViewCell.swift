//
//  DynamicCollectionViewCell.swift
//  DynamicCollectionView
//
//  Created by Chanon Latt on 3/17/22.
//

import UIKit

class DynamicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var contentWidthContraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
