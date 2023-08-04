//
//  ProfilePresenter+ProfileViewOutput.swift
//  Add Tags
//
//  Created by dansqr3 on 03.08.2023.
//

import UIKit

extension ProfilePresenter: ProfileViewOutput {

	var numberOfItemsInSection: Int {
		source.count
	}

	func cellConfigure(cell: TagViewCell, at indexPath: IndexPath, and width: CGFloat) {

		setupCellConstraint(cell, width)

		switch isEditing {
			case true:
				let model = source[indexPath.row]

				var isHidden = true
				if indexPath.row == source.count - 1 {
					isHidden = false
				}

				cell.configureForEdit(model, with: indexPath.row, and: isHidden)
			case false:
				let model = source[indexPath.row]
				cell.configure(model, with: indexPath.row)
		}
	}

	func editButtonAction() {
		isEditing = !isEditing
		input?.editSkills(isEditing)
	}

	func tagButtonAction(_ sender: UIButton) {

		if sender.tag != source.count {

			source.remove(at: sender.tag - 1)
			let sourceTemp = source
			updateButtonTags(in: sourceTemp)
		}
	}

	func didSelectItemAt(with indexPath: IndexPath) {
		guard indexPath.row == source.count - 1 else { return }

		let alertController = UIAlertController(
			title: "Добавление навыка",
			message: "Введите название навыка которым вы владеете",
			preferredStyle: .alert
		)

		alertController.addTextField() { textField in
			textField.delegate = self
		}

		let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
		let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
			guard let self else { return }
			self.source.insert(CellModel(title: self.skillText), at: source.count - 1)
			input?.updateCollection()
		}

		alertController.addAction(cancelAction)
		alertController.addAction(addAction)

		alertController.preferredAction =  addAction

		input?.createAlert(alertController)

	}

	private func setupCellConstraint(_ cell: TagViewCell, _ width: CGFloat) {

		var cellTitleWidthConstraint: NSLayoutConstraint = .init()

		cellTitleWidthConstraint = cell
			.stackView
			.widthAnchor
			.constraint(
				lessThanOrEqualToConstant: width -
				Constants.Space.leading * 2 -
				Constants.Cell.Space.leading
			)
		cellTitleWidthConstraint.isActive = true
	}

	private func updateButtonTags(in source: [CellModel]) {
		input?.updateTags(source)
	}

}
