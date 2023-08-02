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

	private var collectionViewHeightConstraint: NSLayoutConstraint!

	override func loadView() {
		view = profileView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupDelegate()

		setupViews()

	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		updateCollectionHeight()
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

		collectionViewHeightConstraint = profileView
			.skillsCollectionView
			.heightAnchor
			.constraint(equalToConstant: 3000)
		collectionViewHeightConstraint.isActive = true
	}

	private func updateCollectionHeight() {

		let currentContentHeight: CGFloat = profileView.skillsCollectionView.contentSize.height
		print("currentContentHeight", currentContentHeight)

		if currentContentHeight > 0 {
			collectionViewHeightConstraint = profileView
				.skillsCollectionView
				.heightAnchor
				.constraint(equalToConstant: currentContentHeight)
			collectionViewHeightConstraint.isActive = true
		}
	}

}
