//
//  PersonTableViewCell.swift
//  Alash
//
//  Created by Admin on 9/19/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    let screenBounds = UIScreen.mainScreen().bounds
    
    var layerView = UIView()
    var personLabel = UILabel()
    var penImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    func setup() {
        
        self.layer.backgroundColor = UIColor(red: 243/255, green: 239/255, blue: 224/255, alpha: 1.0).CGColor
        
        personLabel = UILabel(frame: CGRect(x: screenBounds.width*0.07, y: 0, width: screenBounds.width, height: screenBounds.height/10))
        personLabel.font = UIFont(name: "Helvetica-Light", size: screenBounds.width*0.06)
        personLabel.textAlignment = .Left
        personLabel.textColor = UIColor.blackColor()
        self.addSubview(personLabel)
        
        penImageView = UIImageView(frame: CGRect(x: screenBounds.width*0.85, y: screenBounds.height*0.05-20, width: 30, height: 40))
        penImageView.image = UIImage(named: "pen")
        self.addSubview(penImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
