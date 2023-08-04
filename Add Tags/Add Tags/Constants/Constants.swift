//
//  Constants.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

enum Constants {

	enum Space {
		static let leading: CGFloat = 16
		static let top: CGFloat = 24
	}

	enum Profile {
		static var backgroundColor: UIColor {
			UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1)
		}

		static var subTitleColor: UIColor {
			UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
		}

		enum Image {

			enum Size {
				static let height: CGFloat = 120
				static let width: CGFloat = 120
			}

			static let photo = "photo"
			static let location = "location"
		}

		enum Font {
			static let title: UIFont = .systemFont(ofSize: 24, weight: .bold)
			static let subTitle: UIFont = .systemFont(ofSize: 14)
		}

	}

	enum Skills {
		enum Button {
			static let edit = "buttonEdit"
			static let done = "buttonDone"
		}

		enum Font {
			static let title: UIFont = .systemFont(ofSize: 16)
		}
	}

	enum About {
		enum Font {
			static let title: UIFont = .systemFont(ofSize: 16, weight: .medium)
			static let subTitle: UIFont = .systemFont(ofSize: 14)
		}
	}

	enum CollectionView {
		static let cellIdentifier = "CellIdentifier"
		static let cellButton = "cellButton"

		static let heightDimension: CGFloat = 56
		static let spacing: CGFloat = 12
	}

	enum Cell {

		static let cornerRadius: CGFloat = 12

		static let stackViewSpace: CGFloat = 10

		enum Font {
			static let title: UIFont = .systemFont(ofSize: 14)
		}

		enum Space {
			static let leading: CGFloat = 24
			static let top: CGFloat = 12
		}
	}

}
