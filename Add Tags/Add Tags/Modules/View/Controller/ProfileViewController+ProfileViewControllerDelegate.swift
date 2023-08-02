//
//  ProfileViewController+ProfileViewControllerDelegate.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

extension ProfileViewController: ProfileViewControllerDelegate {

	func editButtonAction() {
		output?.editButtonAction()
	}

	func tagButtonAction(_ sender: UIButton) {
		output?.tagButtonAction(sender)
	}

}
