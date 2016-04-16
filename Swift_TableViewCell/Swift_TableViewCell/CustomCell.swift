//
//  CustomCell.swift
//  Swift_TableViewCell
//
//  Created by Kerry on 16/4/16.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var iconImageView:UIImageView!
    var appNameLabel:UILabel!
    var decLabel:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView = UIImageView(frame:CGRectMake(10, 5, 40, 40))
        self.addSubview(iconImageView)
        
        appNameLabel = UILabel(frame: CGRectMake(60, 5, 220, 15))
        appNameLabel.font = UIFont .systemFontOfSize(16)
        self.addSubview(appNameLabel)
        
        decLabel = UILabel(frame: CGRectMake(60, 20, 220, 35))
        decLabel.font = UIFont.systemFontOfSize(12)
        decLabel.numberOfLines = 2
        decLabel.textColor = UIColor.lightGrayColor()
        self.addSubview(decLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showAppInfoWithModel(model:AppsModel)
    {
        iconImageView.image = UIImage(named: model.icon)
        appNameLabel.text = model.name
        decLabel.text = model.dec
    }
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
