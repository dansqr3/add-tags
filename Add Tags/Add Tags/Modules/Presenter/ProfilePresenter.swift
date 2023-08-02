//
//  ProfilePresenter.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

class ProfilePresenter: NSObject {

	weak var input: ProfileViewInput?

	var source = [
		CellModel(title: "MVVM"),
		CellModel(title: "MVVM"),
		CellModel(title: "MVVMMVVMMVVMMVVMMVVM"),
		CellModel(title: "MVVMMVVM"),
	]

}

extension ProfilePresenter: ProfileViewOutput {

	var numberOfItemsInSection: Int {
		source.count
	}

	func cellConfigure(cell: TagViewCell, at indexPath: IndexPath) {
		let model = source[indexPath.row]
		cell.configure(model)
	}

}
