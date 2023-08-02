//
//  ProfileViewController+UICollectionViewDataSource.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

extension ProfileViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		output?.numberOfItemsInSection ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: Constants.CollectionView.cellIdentifier,
			for: indexPath
		) as? TagViewCell else {
			return UICollectionViewCell()
		}

		cell.profileViewControllerDelegate = self

		output?.cellConfigure(cell: cell, at: indexPath)

		return cell
	}

}


