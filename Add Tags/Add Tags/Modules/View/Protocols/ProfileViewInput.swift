//
//  ProfileViewInput.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

protocol ProfileViewInput: AnyObject {

	func editSkills(_ isEdit: Bool)

	func updateCollection()

	func createAlert(_ alertController: UIAlertController)

	func updateTags(_ source: [CellModel])

}
