//
//  Constants.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

enum Constants {

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

	}

	enum Skills {
		enum Button {
			static let edit = "buttonEdit"
			static let done = "buttonDone"
		}
	}

}
