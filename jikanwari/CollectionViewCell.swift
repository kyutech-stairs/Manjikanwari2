//
//  CollectionViewCell.swift
//  jikanwari
//
//  Created by Kohei Adachi on 2018/06/14.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var subject_label: UILabel!
    
    @IBOutlet weak var subjectText: UITextView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderWidth = 1.0
        
        self.layer.borderColor = UIColor.black.cgColor
        
        //self.layer.cornerRadius = 8.0
        
    }
}
