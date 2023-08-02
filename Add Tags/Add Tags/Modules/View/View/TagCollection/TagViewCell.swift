//
//  TagViewCell.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

class TagViewCell: UICollectionViewCell {

	var titleLabel: UILabel!

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupHierarchy()
		setupConstraints()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {
		backgroundColor = Constants.Profile.backgroundColor

		layer.cornerRadius = 12
		layer.masksToBounds = true

		titleLabel = UILabel(
			text: "",
			textColor: .label,
			font: .systemFont(ofSize: 14),
			numberOfLines: 1,
			alignment: .center
		)
	}

	private func setupHierarchy() {
		contentView.addSubview(titleLabel)
	}

	private func setupConstraints() {

		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
			titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
		])
	}

	func configure(_ model: CellModel) {
		titleLabel.text = model.title
	}

}
