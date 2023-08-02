//
//  UIButton+.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

extension UIButton {

	convenience init(
		title: String,
		titleColorForNormal: UIColor,
		titleColorForHighlighted: UIColor,
		backgroundColor: UIColor,
		cornerRadius: CGFloat = 0,
		tag: Int = 0
	) {
		self.init()

		self.setTitle(title, for: .normal)
		self.setTitleColor(titleColorForNormal, for: .normal)
		self.setTitleColor(titleColorForHighlighted, for: .highlighted)
		self.backgroundColor = backgroundColor
		self.layer.cornerRadius = cornerRadius
		self.tag = tag
	}

}
