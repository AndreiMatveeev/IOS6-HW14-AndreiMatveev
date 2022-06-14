//
//  ГШ.swift
//  IOS6-HW14-AndreiMatveev
//
//  Created by Владелец on 14.06.2022.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviewsForAutoLayout(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
