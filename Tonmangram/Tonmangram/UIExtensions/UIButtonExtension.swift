//
//  UIButtonExtension.swift
//  Tonmangram
//
//  Created by Булат Сунгатуллин on 21.10.2021.
//

import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.90
        pulse.toValue = 1.0
        self.layer.add(pulse, forKey: nil)
    }
}
