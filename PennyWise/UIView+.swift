//
//  UIView+.swift
//  PennyWise
//
//  Created by Zhihui Tang on 2019-05-10.
//  Copyright © 2019 Caroline. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func drawGradient(startColor: UIColor, endColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        let colors = [startColor.cgColor, endColor.cgColor] as CFArray
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: colorLocations),
            let context = UIGraphicsGetCurrentContext() else { return }
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
    }
}
