//
//  TableCell.swift
//  IOS6-HW14-AndreiMatveev
//
//  Created by Владелец on 14.06.2022.
//

import UIKit

class TableCell: UICollectionViewCell {

     lazy var iconView: UIImageView = {
         let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFill
         imageView.layer.masksToBounds = true
         imageView.clipsToBounds = true
         return imageView
     }()

     lazy var nameLabel: UILabel = {
         let label = UILabel()
         label.textAlignment = .left
         label.font = .systemFont(ofSize: 17, weight: .regular)
         label.textColor = .systemBlue
         return label
     }()

     lazy var numberPhotosLabel: UILabel = {
         let label = UILabel()
         label.textAlignment = .left
         label.font = .systemFont(ofSize: 17, weight: .regular)
         label.textColor = .gray
         return label
     }()

     lazy var button: UIButton = {
         let button = UIButton()
         button.imageView?.image = UIImage(systemName: "chevron.right")
         button.imageView?.tintColor = .gray
         return button
     }()

     private lazy var stackView: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.distribution = .fill
         return stackView
     }()

     lazy var lineSeparators: UIView = {
         let line = UIView()
         line.backgroundColor = .systemGray4
         return line
     }()
    
    // MARK: - Settings

        func settingViewCell() {
            contentView.addSubviewsForAutoLayout([
                stackView,
                lineSeparators,
            ])

            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
                stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),

                lineSeparators.topAnchor.constraint(equalTo: stackView.bottomAnchor),
                lineSeparators.heightAnchor.constraint(equalToConstant: TableCellMetric.lineHeight),
                lineSeparators.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
                lineSeparators.rightAnchor.constraint(equalTo: self.rightAnchor),
            ])
        }

     // MARK: - Initialization
     
     override init(frame: CGRect) {
         super.init(frame: .zero)
         settingViewCell()
     }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
 }

 // MARK: - Metric

enum TableCellMetric {
    static let indent: CGFloat = 4
    static let lineHeight: CGFloat = 1
}

