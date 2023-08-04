//
//  ProfilePresenter.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

final class ProfilePresenter: NSObject {

	weak var input: ProfileViewInput?

	private let dataManager: DataManagerProtocol = DataManager()

	var isEditing: Bool = false
	var skillText: String = ""

	lazy var source: [CellModel] = dataManager.fetchTags()
	{
		didSet {
			input?.updateLayout()
		}
	}

}
