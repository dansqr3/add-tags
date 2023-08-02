//
//  ProfileViewOutput.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import Foundation

protocol ProfileViewOutput: AnyObject {

	var numberOfItemsInSection: Int { get }

	func cellConfigure(cell: TagViewCell, at indexPath: IndexPath)

}
