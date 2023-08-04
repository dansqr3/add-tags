//
//  ProfileViewController+ProfileViewInput.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

extension ProfileViewController: ProfileViewInput {

	func editSkills(_ isEdit: Bool) {

		profileView.skillsCollectionView.isEditing = isEdit

		switch isEdit {
			case true:
				profileView.skillsEditButton.setImage(
					UIImage(named: Constants.Skills.Button.done),
					for: .normal
				)
			case false:
				profileView.skillsEditButton.setImage(
					UIImage(named: Constants.Skills.Button.edit),
					for: .normal
				)

		}

		updateCollection()

	}

	func updateCollection() {
		profileView.skillsCollectionView.reloadData()
	}

	func createAlert(_ alertController: UIAlertController) {
		present(alertController, animated: true)
	}

	func updateTags(_ source: [CellModel]) {
		source.indices.forEach {
			guard let cell = profileView.skillsCollectionView.cellForItem(
				at: .init(row: $0, section: 0)
			) as? TagViewCell else { return }

			cell.button.tag = $0 + 1
		}

		updateCollection()
	}

	func updateLayout() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
			self.setupCollectionHeight()
		}
	}

}
