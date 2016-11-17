//
//  BannerCollectionViewCell.swift
//  SomeUI
//
//  Created by ning on 16/10/22.
//  Copyright © 2016年 songjk. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    var imageV : UIImageView!
    
    public var imageStr : String! {
        didSet{
            imageV.sd_setImage(with: URL.init(string: imageStr))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor.red
        imageV = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenW, height: frame.size.height))
//        imageV.image = UIImage.init(named: imageStr)
        self.addSubview(imageV)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
