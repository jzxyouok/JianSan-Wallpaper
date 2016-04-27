//
//  JFHomeCell.swift
//  JianSan Wallpaper
//
//  Created by jianfeng on 16/2/4.
//  Copyright © 2016年 六阿哥. All rights reserved.
//

import UIKit
import SnapKit

class JFTableViewCell: UITableViewCell {
    
    var offset: CGFloat = 0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        layer.borderColor = UIColor(red:0.063,  green:0.063,  blue:0.063, alpha:1).CGColor
        layer.borderWidth = 5
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var rect = bounds
        rect.origin.y += offset
        imageView?.frame = rect
    }
    
    func cellOffset() -> CGFloat {
        let centerToWindow = convertRect(bounds, toView: window)
        let centerY = CGRectGetMidY(centerToWindow)
        let windowCenter = superview!.center
        let cellOffsetY = centerY - windowCenter.y
        let offsetDig = cellOffsetY / superview!.frame.size.height * 2
        offset = -offsetDig * (SCREEN_HEIGHT/1.7 - 250) / 2
        imageView!.transform = CGAffineTransformMakeTranslation(0, offset)
        return offset
    }

}
