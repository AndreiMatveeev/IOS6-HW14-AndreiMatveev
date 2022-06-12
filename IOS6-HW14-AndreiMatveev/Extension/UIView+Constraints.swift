//
//  UIView+Constraints.swift
//  IOS6-HW14-AndreiMatveev
//
//  Created by Владелец on 12.06.2022.
//

import UIKit

 extension UIView {

     func addSubviewsForAutoLayout(_ views: [UIView]) {
         for view in views {
             view.translatesAutoresizingMaskIntoConstraints = false
             addSubview(view)
         }
     }
 }
