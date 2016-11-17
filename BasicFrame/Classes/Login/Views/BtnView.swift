//
//  BtnView.swift
//  SomeUI
//
//  Created by ning on 16/9/18.
//  Copyright © 2016年 songjk. All rights reserved.
//

import UIKit
//上图片，下文字的button
class BtnView: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = .scaleAspectFit
        self.titleLabel?.contentMode = .center
        self.titleLabel?.textAlignment = .center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let imageX : CGFloat = 0.0
        let imageY : CGFloat = 10.0
        let imageW :CGFloat = contentRect.size.width
        let imageH :CGFloat = 55.0
        return CGRect(x: imageX, y: imageY, width: imageW, height: imageH)
        
        
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleX : CGFloat = 15
        let titleY :CGFloat  = contentRect.size.height - 35
        let titleW :CGFloat = contentRect.size.width - 30
        let titleH : CGFloat = 20
        
        return CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
        
    }
    
    
}
