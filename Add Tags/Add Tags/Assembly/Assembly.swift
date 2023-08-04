//
//  Assembly.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

final class Assembly: AssemblyProtocol {

	func createProfile() -> UIViewController {

		let profileViewController = ProfileViewController()

		let profilePresenter = ProfilePresenter()

		profileViewController.output = profilePresenter
		profilePresenter.input = profileViewController

		let navigation = UINavigationController(rootViewController: profileViewController)

		return navigation

	}

}
