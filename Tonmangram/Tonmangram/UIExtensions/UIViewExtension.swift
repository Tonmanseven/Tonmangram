//
//  UITextFieldExtension.swift
//  Tonmangram
//
//  Created by Булат Сунгатуллин on 21.10.2021.
//

import UIKit

extension UIView {
  func animateBorderColor(toColor: UIColor, duration: Double) {
    let animation = CABasicAnimation(keyPath: "borderColor")
    animation.fromValue = layer.borderColor
    animation.toValue = toColor.cgColor
    animation.repeatCount = 1
    animation.duration = duration
    layer.add(animation, forKey: "borderColor")
    layer.borderColor = toColor.cgColor
  }
}
