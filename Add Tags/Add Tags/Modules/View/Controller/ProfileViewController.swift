//
//  ProfileViewController.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {

	var output: ProfileViewOutput?

	let profileView = ProfileView()

	override func loadView() {
		view = profileView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupDelegate()

		setupViews()

	}

	private func setupDelegate() {
		profileView.profileViewControllerDelegate = self
	}

	private func setupViews() {
		title = "Профиль"

		navigationController?.hidesBarsOnSwipe = true
		navigationController?.navigationBar.backgroundColor = Constants.Profile.backgroundColor
	}

}
