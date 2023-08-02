//
//  ProfileViewController+UICollectionViewDelegate.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

extension ProfileViewController: UICollectionViewDelegate {

//	override func setEditing(_ editing: Bool, animated: Bool) {
//		super.setEditing(editing, animated: animated)
//		print("setediting")
//	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		output?.didSelectItemAt(with: indexPath)
	}
}
