//
//  ProfilePresenter.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

class ProfilePresenter: NSObject {

	weak var input: ProfileViewInput?

	var isEditing: Bool = false
	var skillText: String = ""

	var source = [
		CellModel(title: "MVVM"),
		CellModel(title: "MVVM"),
		CellModel(title: "MVVMMVVMMVVMMVVMMVVM1"),
		CellModel(title: "MVVMMVVM"),
		CellModel(title: "MVVMMVVMMVVMMVVMMVVM2"),
		CellModel(title: "MVVMMVVMMVVMMVVMMVVM3"),
		CellModel(title: "MVVMMVVMMVVMMVVMMVVM4"),
		CellModel(title: "MVVMMVVMMVVMMVVMMVVM5"),
		CellModel(title: "MVVMMVVMMVVMMVVMMVVM6"),
		CellModel(title: "MVVMMVVMMVVMMVVMMVVM7"),
		CellModel(title: "MVVMMVVM8"),
		CellModel(title: "+")
	]

}

extension ProfilePresenter: ProfileViewOutput {

	func editButtonAction() {
		isEditing = !isEditing
		input?.editSkills(isEditing)
	}

	var numberOfItemsInSection: Int {
		source.count
	}

	func cellConfigure(cell: TagViewCell, at indexPath: IndexPath) {
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

	func tagButtonAction(_ sender: UIButton) {

		if sender.tag != source.count - 1 {

			source.remove(at: sender.tag - 1)
			updateButtonTags()
			input?.updateCollection()
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
			self.source.insert(CellModel(title: self.skillText), at: 0)
			input?.updateCollection()
		}

		alertController.addAction(cancelAction)
		alertController.addAction(addAction)

		alertController.preferredAction =  addAction

		input?.createAlert(alertController)

	}

	private func updateButtonTags() {
		input?.updateTags(source)
	}

}

extension ProfilePresenter: UITextFieldDelegate {

	func textFieldDidEndEditing(_ textField: UITextField) {
		if let text = textField.text {
			skillText = text
		}
	}
}

/*
 private func updateButtonsTag(_ content: [BasketModel]) {

		 content.indices.forEach {
			 guard let cell = basketView.tableView.cellForRow(
				 at: IndexPath(row: $0, section: 0)
			 ) as? BasketTableViewCell else { return }

			 cell.buttonStepperMinus.tag = $0
			 cell.buttonStepperPlus.tag = $0
		 }
	 }
 */
