//
//  AlbumCell.swift
//  IOS6-HW14-AndreiMatveev
//
//  Created by Владелец on 12.06.2022.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    static let reuseID = "CellId"
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Metric.photoRadius
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var namePhotoLabel: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .left
        lable.font = .systemFont(ofSize: Metric.namePhotoLabelFont)
        return lable
    }()
    
    lazy var numberPhotosLabel: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .left
        lable.font = .systemFont(ofSize: Metric.numberPhotoLabelFont)
        lable.textColor = .gray
        return lable
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubviewsForAutoLayout([
            photoImageView,
            namePhotoLabel,
            numberPhotosLabel,
        ])
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photoImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            namePhotoLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Metric.indent),
            numberPhotosLabel.topAnchor.constraint(equalTo: namePhotoLabel.bottomAnchor, constant: Metric.indent),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Metric

enum Metric {
    static let indent: CGFloat = 4
    static let photoRadius: CGFloat = 10
    static let namePhotoLabelFont: CGFloat = 17
    static let numberPhotoLabelFont: CGFloat = 15
}
