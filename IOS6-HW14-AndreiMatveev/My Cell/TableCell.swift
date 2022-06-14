//
//  TableCell.swift
//  IOS6-HW14-AndreiMatveev
//
//  Created by Владелец on 14.06.2022.
//

import UIKit

class TableCell: UICollectionViewCell {
    
    static let reuseID = "TableCellId"
    
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
        button.layer.masksToBounds = true
        let image = UIImage(systemName: "chevron.right", withConfiguration:  UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))?
            .withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        return line
    }()
    
    // MARK: - Settings
    
    func settingViewCell() {
        contentView.addSubviewsForAutoLayout([
            iconView,
            lineSeparators,
            nameLabel,
            button,
            numberPhotosLabel,
        ])
        
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: TableCellMetric.iconSize),
            iconView.widthAnchor.constraint(equalToConstant: TableCellMetric.iconSize),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: TableCellMetric.indent),
            
            lineSeparators.topAnchor.constraint(equalTo: self.bottomAnchor),
            lineSeparators.heightAnchor.constraint(equalToConstant: TableCellMetric.lineHeight),
            lineSeparators.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: TableCellMetric.lineIndent),
            lineSeparators.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: TableCellMetric.lineIndent),
            
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: TableCellMetric.iconSize),
            button.widthAnchor.constraint(equalToConstant: TableCellMetric.iconSize),
            button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -TableCellMetric.indent),
            
            numberPhotosLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            numberPhotosLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -TableCellMetric.lineHeight),
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
    
    // MARK: - Metric
    
    enum TableCellMetric {
        static let indent: CGFloat = 4
        static let lineHeight: CGFloat = 1
        static let lineIndent: CGFloat = 48
        static let iconSize: CGFloat = 28
    }
}

