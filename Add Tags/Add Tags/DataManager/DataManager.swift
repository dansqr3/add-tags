//
//  DataManager.swift
//  Add Tags
//
//  Created by dansqr3 on 03.08.2023.
//

import Foundation

final class DataManager: DataManagerProtocol {

	private var source: [CellModel] = [
		CellModel(title: "Swift"),
		CellModel(title: "UIKit"),
		CellModel(title: "Foundation"),
		CellModel(title: "Autolayout"),
		CellModel(title: "Multithreading"),
		CellModel(title: "Networking"),
		CellModel(title: "REST API"),
		CellModel(title: "JSON"),
		CellModel(title: "Core Data"),
		CellModel(title: "UIViewPropertyAnimator"),
		CellModel(title: "Git"),
		CellModel(title: "MVC"),
		CellModel(title: "MVP"),
		CellModel(title: "MVVM"),
		CellModel(title: "VIPER"),
		CellModel(title: "Combine")
	]

	func fetchTags() -> [CellModel] {
		//...
		var result = source
		result.append(CellModel(title: "+"))
		return result
	}

}
