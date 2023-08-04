//
//  ProfileViewOutput.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

protocol ProfileViewOutput: AnyObject {

	var numberOfItemsInSection: Int { get }

	func cellConfigure(cell: TagViewCell, at indexPath: IndexPath, and width: CGFloat)

	func editButtonAction()

	func tagButtonAction(_ sender: UIButton)

	func didSelectItemAt(with indexPath: IndexPath)

}
