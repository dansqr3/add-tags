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

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		updateCollectionHeight()
	}

	private func setupDelegate() {
		profileView.profileViewControllerDelegate = self
//		tagsCollection.profileViewControllerDelegate = self

		profileView.skillsCollectionView.dataSource = self
//		profileView.skillsCollectionView.delegate = self
	}

	private func setupViews() {
		title = "Профиль"

		navigationController?.hidesBarsOnSwipe = true
		navigationController?.navigationBar.backgroundColor = Constants.Profile.backgroundColor

		collectionViewHeightConstraint = profileView.skillsCollectionView.heightAnchor.constraint(equalToConstant: (44 + 6) * 5)
		collectionViewHeightConstraint.isActive = true
	}

	private func updateCollectionHeight() {

		let currentContentHeight: CGFloat =
			profileView
				.skillsCollectionView
				.collectionViewLayout
				.collectionViewContentSize
				.height

		if currentContentHeight > 0 {
			profileView.setupConstraints()
			collectionViewHeightConstraint = profileView
				.skillsCollectionView
				.heightAnchor
				.constraint(equalToConstant: currentContentHeight)
			collectionViewHeightConstraint.isActive = true
		}
	}

}
