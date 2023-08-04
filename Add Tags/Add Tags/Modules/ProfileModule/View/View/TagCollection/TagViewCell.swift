//
//  TagViewCell.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

final class TagViewCell: UICollectionViewCell {

	private var titleLabel: UILabel!
	var button: UIButton!
	var stackView: UIStackView!

	var profileViewControllerDelegate: ProfileViewControllerDelegate?

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupHierarchy()
		setupConstraints()
		addTargets()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {
		backgroundColor = Constants.Profile.backgroundColor

		layer.cornerRadius = Constants.Cell.cornerRadius
		layer.masksToBounds = true

		titleLabel = UILabel(
			text: "",
			textColor: .label,
			font: Constants.Cell.Font.title,
			numberOfLines: 1,
			alignment: .center
		)

		button = UIButton()
		button.setImage(UIImage(named: Constants.CollectionView.cellButton), for: .normal)

		stackView = UIStackView(
			axis: .horizontal,
			spacing: Constants.Cell.stackViewSpace,
			distribution: .fill
		)

	}

	private func setupHierarchy() {
		stackView.addArrangedSubview(titleLabel)
		contentView.addSubview(stackView)
	}

	private func setupConstraints() {

		stackView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

			stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Cell.Space.leading),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Cell.Space.leading),
			stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Cell.Space.top),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Cell.Space.top)
		])
	}

	private func addTargets() {
		button.addTarget(
			self,
			action: #selector(buttonAction(sender:)),
			for: .touchUpInside
		)
	}

	func configure(_ model: CellModel, with tag: Int) {
		titleLabel.text = model.title
		button.tag = tag + 1
		button.isHidden = true
		stackView.removeArrangedSubview(button)
	}

	func configureForEdit(_ model: CellModel, with tag: Int, and isButtonHidden: Bool) {

		if isButtonHidden == true {
			stackView.addArrangedSubview(button)
			button.tag = tag + 1
			button.isHidden = false
		} else {
			button.isHidden = true
			stackView.removeArrangedSubview(button)
		}
		titleLabel.text = model.title
	}

	@objc private func buttonAction(sender: UIButton) {
		profileViewControllerDelegate?.tagButtonAction(sender)
	}

}
