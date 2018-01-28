//
//  PostTableViewCell.swift
//  PlaylistAssignment
//
//  Created by Thanasi Stratigakis on 1/26/18.
//  Copyright © 2018 thanasistratigakis. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = UILabel()
    let bodyLabel: UILabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(titleLabel)
        self.addSubview(bodyLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(2)
            make.bottom.equalTo(self.snp.centerY)
        }
        
        bodyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(2)
            make.bottom.equalToSuperview()
        }
    }

}
