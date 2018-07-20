//
//  CustomCell.swift
//  tableview
//
//  Created by Kunio Terada on 2018/07/18.
//  Copyright © 2018年 Kunio Terada. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell, UITextFieldDelegate {

    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let thumbnailImageView = UIImageView(image: nil)
    let badgeView = UIView()
    let badgeWrapperView = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        badgeView.backgroundColor = UIColor.brown
        //　背景色の設定
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        // trueだとコンフリクトしてしまう
        self.addSubview(badgeView)
        // addSubviewは
        
        badgeWrapperView.backgroundColor = UIColor.cyan
        badgeWrapperView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(badgeWrapperView)
        
        thumbnailImageView.backgroundColor = UIColor.yellow
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(thumbnailImageView)
        
        titleLabel.backgroundColor = UIColor.green
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        dateLabel.backgroundColor = UIColor.red
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dateLabel)
        
        
        
        badgeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        badgeView.trailingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor, constant: 0.0).isActive = true
        badgeView.widthAnchor.constraint(equalToConstant: 25.0).isActive = true
        badgeView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        badgeView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
//        thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        thumbnailImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0.0).isActive = true
        thumbnailImageView.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: 0.0).isActive = true
        //equalToだとcell + 50.0になるが、equalToConstantだと50.0のみで表示される。
        thumbnailImageView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        thumbnailImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        //titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        // この文を消すことによって一つのセルに２つの文が入る
//        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()

        // ２つの文を一つのセルにいれるときは、上の文のbottomAnchorを消して、下の文のtopAnchorをtitleLabel.bottomAnchorとしていれる。
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0.0).isActive = true
        //dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
        dateLabel.numberOfLines = 0
        dateLabel.sizeToFit()
    }
    //19,20行目とセット
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 新しい関数を定義（関数の中に関数はできない）
    func configure(title: String, date: String){
        
        titleLabel.text = title
        dateLabel.text = date        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
