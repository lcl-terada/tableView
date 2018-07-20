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
    let button = UIButton()
    var thumbnailImageViewSizeConstraint: NSLayoutConstraint!
//    var titleLabelConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //　背景色の設定
//        badgeWrapperView.backgroundColor = UIColor.cyan
        // trueだとコンフリクトしてしまう
        badgeWrapperView.translatesAutoresizingMaskIntoConstraints = false
        // 自分自身に対してbadgeWrapperViewを追加する
        self.addSubview(badgeWrapperView)

        badgeView.backgroundColor = UIColor.blue
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        //badgeWrapperViewに対してbadgeViewを追加する
        badgeWrapperView.addSubview(badgeView)
    
        thumbnailImageView.backgroundColor = UIColor.yellow
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(thumbnailImageView)

//        titleLabel.backgroundColor = UIColor.green
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
//        dateLabel.backgroundColor = UIColor.red
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dateLabel)
        
        badgeWrapperView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        badgeWrapperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        badgeWrapperView.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        badgeWrapperView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        badgeView.centerXAnchor.constraint(equalTo: badgeWrapperView.centerXAnchor).isActive = true
        badgeView.centerYAnchor.constraint(equalTo: badgeWrapperView.centerYAnchor).isActive = true
        badgeView.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
        badgeView.heightAnchor.constraint(equalToConstant: 10.0).isActive = true
        badgeView.layer.cornerRadius = 5.0
        
        thumbnailImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: badgeWrapperView.leadingAnchor, constant: 30.0).isActive = true
        //equalToだとcell + 50.0になるが、equalToConstantだと50.0のみで表示される。
        thumbnailImageViewSizeConstraint = thumbnailImageView.widthAnchor.constraint(equalToConstant: 50.0)
        //画像があるときをtrueとするとif文で分けられる。
        thumbnailImageViewSizeConstraint.isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true

        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 5.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0).isActive = true
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()

        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2.0).isActive = true
        //dateLabelの左側はtitleLabelの左側と同じ位置なのでconstantも消す
        dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        dateLabel.numberOfLines = 0
        dateLabel.sizeToFit()
    }
    //22,23行目とセット
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 新しい関数を定義（関数の中に関数はできない）
    func configure(title: String, date: String, image: Bool){
        titleLabel.text = title
        dateLabel.text = date
        //Boolで画像があるかないかを分けて、あるときは画像サイズの50を表示
        if image == true {
//            thumbnailImageViewSizeConstraint.isActive = true
            thumbnailImageViewSizeConstraint.constant = 50
        } else {
//            thumbnailImageViewSizeConstraint.isActive = false
            thumbnailImageViewSizeConstraint.constant = 0
        }
   }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
