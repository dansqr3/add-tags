//
//  TagCollectionView.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

final class TagCollectionView: UICollectionView {

	weak var profileViewControllerDelegate: ProfileViewControllerDelegate?

	init() {
		let layout = UICollectionViewFlowLayout()
		super.init(frame: .zero, collectionViewLayout: layout)

		setupCollectionView()
		cellRegister()
		
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupCollectionView() {
		showsVerticalScrollIndicator = false

		isScrollEnabled = false

		collectionViewLayout = setupViewLayout()
	}

	private func setupViewLayout() -> UICollectionViewLayout {

		let itemSize = NSCollectionLayoutSize(
			widthDimension: .estimated(80),
			heightDimension: .fractionalHeight(1.0)
		)

		let item = NSCollectionLayoutItem(layoutSize: itemSize)

		let groupSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1.0),
			heightDimension: .absolute(Constants.CollectionView.heightDimension)
		)
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
		group.interItemSpacing = .fixed(Constants.CollectionView.spacing)

		let section = NSCollectionLayoutSection(group: group)
		section.interGroupSpacing = Constants.CollectionView.spacing

		let layout = UICollectionViewCompositionalLayout(section: section)
		return layout

	}

	private func cellRegister() {
		register(
			TagViewCell.self,
			forCellWithReuseIdentifier: Constants.CollectionView.cellIdentifier
		)
	}

}
