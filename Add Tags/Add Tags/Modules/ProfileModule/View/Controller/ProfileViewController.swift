//
//  ProfileViewController.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

	var output: ProfileViewOutput?

	let profileView = ProfileView()

	private var collectionViewHeightConstraint: NSLayoutConstraint = .init()

	var width: CGFloat {
		profileView.skillsCollectionView.contentSize.width
	}

	override func loadView() {
		view = profileView
	}

	override func viewDidLoad() {
		super.viewDidLoad()


		setupDelegate()

		setupViews()

	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		setupCollectionHeight()
		print("view.frame.width", width)
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		setupCollectionHeight()
	}

	private func setupDelegate() {
		profileView.profileViewControllerDelegate = self

		profileView.skillsCollectionView.dataSource = self
		profileView.skillsCollectionView.delegate = self
	}

	private func setupViews() {
		title = "Профиль"

		navigationController?.hidesBarsOnSwipe = true
		navigationController?.navigationBar.backgroundColor = Constants.Profile.backgroundColor
	}

	func setupCollectionHeight() {

		collectionViewHeightConstraint.isActive = false
		let defaultContentHeight: CGFloat = profileView.skillsCollectionView.contentSize.height

		if defaultContentHeight > 0 {
			collectionViewHeightConstraint = profileView
				.skillsCollectionView
				.heightAnchor
				.constraint(equalToConstant: defaultContentHeight)
			collectionViewHeightConstraint.isActive = true
		}
	}

}
