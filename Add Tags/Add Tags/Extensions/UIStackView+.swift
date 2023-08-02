//
//  UIStackView+.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

extension UIStackView {

	convenience init(
		axis: NSLayoutConstraint.Axis,
		spacing: CGFloat,
		distribution: UIStackView.Distribution
	) {
		self.init()

		self.axis = axis
		self.spacing = spacing
		self.distribution = distribution
	}

}
