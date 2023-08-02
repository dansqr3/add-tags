//
//  UILabel+.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

extension UILabel {

	convenience init(
		text: String,
		textColor: UIColor,
		font: UIFont,
		numberOfLines: Int = 0,
		alignment: NSTextAlignment = .natural
	) {
		self.init()

		self.text = text
		self.textColor = textColor
		self.font = font
		self.numberOfLines = numberOfLines
		self.textAlignment = alignment
	}

	convenience init(
		attributedText: NSAttributedString?,
		textColor: UIColor,
		font: UIFont,
		numberOfLines: Int = 0
	) {
		self.init()

		self.attributedText = attributedText
		self.textColor = textColor
		self.font = font
		self.numberOfLines = numberOfLines
	}

}
