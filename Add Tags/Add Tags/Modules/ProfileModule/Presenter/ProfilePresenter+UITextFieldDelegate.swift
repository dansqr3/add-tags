//
//  ProfilePresenter+UITextFieldDelegate.swift
//  Add Tags
//
//  Created by dansqr3 on 03.08.2023.
//

import UIKit

extension ProfilePresenter: UITextFieldDelegate {

	func textFieldDidEndEditing(_ textField: UITextField) {
		if let text = textField.text {
			skillText = text
		}
	}
}
