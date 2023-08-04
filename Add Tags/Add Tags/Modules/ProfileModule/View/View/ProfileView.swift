//
//  ProfileView.swift
//  Add Tags
//
//  Created by dansqr3 on 01.08.2023.
//

import UIKit

final class ProfileView: UIView {

	weak var profileViewControllerDelegate: ProfileViewControllerDelegate?

	private var scrollView: UIScrollView!

	private var topContainer: UIView!

	private var profileWrapper: UIView!
	private var profileView: UIView!
	private var profileImage: UIImageView!
	private var profileTitle: UILabel!
	private var profileSubTitle: UILabel!

	private var profileLocationStackView: UIStackView!
	private var profileLocationImage: UIImageView!
	private var profileLocationTitle: UILabel!

	private var skillsWrapper: UIView!
	var skillsCollectionView: UICollectionView!
	private var skillsTitle: UILabel!
	var skillsEditButton: UIButton!

	private var aboutView: UIView!
	private var aboutTitle: UILabel!
	private var aboutSubTitle: UILabel!

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()

		setupProfile()
		setupCollection()

		setupHierarchy()
		setupAutoresizingMask()
		setupConstraints()
		addTargets()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {
		backgroundColor = .systemBackground

		scrollView = UIScrollView()
		scrollView.backgroundColor = .systemBackground
		scrollView.showsHorizontalScrollIndicator = false

		skillsWrapper = UIView()

		skillsTitle = UILabel(
			text: "Мои навыки",
			textColor: .label,
			font: Constants.Skills.Font.title,
			numberOfLines: 1
		)
		skillsTitle.backgroundColor = .systemBackground

		skillsEditButton = UIButton()
		skillsEditButton.setImage(UIImage(named: Constants.Skills.Button.edit), for: .normal)

		aboutView = UIView()

		aboutTitle = UILabel(
			text: "О себе",
			textColor: .label,
			font: Constants.About.Font.title,
			numberOfLines: 1
		)

		aboutSubTitle = UILabel(
			text: "Experienced software engineer skilled in developing scalable and maintainable systems",
			textColor: .label,
			font: Constants.About.Font.subTitle,
			numberOfLines: 0
		)

	}

	private func setupCollection() {
		skillsCollectionView = TagCollectionView()
	}

	private func setupProfile() {

		topContainer = UIView()
		topContainer.backgroundColor = Constants.Profile.backgroundColor

		profileWrapper = UIView()
		profileWrapper.backgroundColor = Constants.Profile.backgroundColor

		profileView = UIView()

		profileImage = UIImageView(image: UIImage(named: Constants.Profile.Image.photo))
		profileImage.layer.cornerRadius = Constants.Profile.Image.Size.height / 2
		profileImage.clipsToBounds = true

		profileTitle = UILabel(
			text: "Иванов Иван Иванович",
			textColor: .label,
			font: Constants.Profile.Font.title,
			numberOfLines: 2,
			alignment: .center
		)

		profileSubTitle = UILabel(
			text: "Middle iOS-разработчик, опыт более 2-х лет",
			textColor: Constants.Profile.subTitleColor,
			font: Constants.Profile.Font.subTitle,
			numberOfLines: 2,
			alignment: .center
		)

		profileLocationImage = UIImageView(image: UIImage(named: Constants.Profile.Image.location))

		profileLocationTitle = UILabel(
			text: "Воронеж",
			textColor: Constants.Profile.subTitleColor,
			font: Constants.Profile.Font.subTitle,
			numberOfLines: 1
		)

		profileLocationStackView = UIStackView(
			axis: .horizontal,
			spacing: 2,
			distribution: .fill
		)
	}

	private func setupHierarchy() {

		profileView.addSubview(profileImage)
		profileView.addSubview(profileTitle)
		profileView.addSubview(profileSubTitle)
		profileView.addSubview(profileLocationStackView)
		profileLocationStackView.addArrangedSubview(profileLocationImage)
		profileLocationStackView.addArrangedSubview(profileLocationTitle)

		profileWrapper.addSubview(profileView)

		skillsWrapper.addSubview(skillsTitle)
		skillsWrapper.addSubview(skillsEditButton)
		skillsWrapper.addSubview(skillsCollectionView)

		aboutView.addSubview(aboutTitle)
		aboutView.addSubview(aboutSubTitle)

		scrollView.addSubview(topContainer)
		scrollView.addSubview(profileWrapper)
		scrollView.addSubview(profileView)
		scrollView.addSubview(skillsWrapper)
		scrollView.addSubview(aboutView)

		addSubview(scrollView)
	}

	private func setupAutoresizingMask() {

		topContainer.translatesAutoresizingMaskIntoConstraints = false

		[
			profileWrapper,
			profileView,
			profileImage,
			profileTitle,
			profileSubTitle,

			profileLocationImage,
			profileLocationStackView
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		[
			aboutView,
			aboutTitle,
			aboutSubTitle
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		[
			skillsWrapper,
			skillsTitle,
			skillsEditButton,
			skillsCollectionView
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		scrollView.translatesAutoresizingMaskIntoConstraints = false
	}

	func setupConstraints() {

		setupProfileConstraints()
		setupSkillsConstraints()
		setupAboutConstraints()

	}

	private func setupProfileConstraints() {
		NSLayoutConstraint.activate([

			topContainer.topAnchor.constraint(equalTo: topAnchor),
			topContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			topContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			topContainer.bottomAnchor.constraint(equalTo: profileView.topAnchor),

			scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			scrollView.topAnchor.constraint(equalTo: topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

			profileWrapper.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			profileWrapper.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			profileWrapper.topAnchor.constraint(equalTo: scrollView.topAnchor),

			profileView.leadingAnchor.constraint(equalTo: profileWrapper.leadingAnchor),
			profileView.trailingAnchor.constraint(equalTo: profileWrapper.trailingAnchor),
			profileView.topAnchor.constraint(equalTo: profileWrapper.topAnchor, constant: Constants.Space.top),

			profileImage.topAnchor.constraint(equalTo: profileView.topAnchor),
			profileImage.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
			profileImage.widthAnchor.constraint(equalToConstant: Constants.Profile.Image.Size.width),
			profileImage.heightAnchor.constraint(equalToConstant: Constants.Profile.Image.Size.height),

			profileTitle.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: Constants.Space.leading),
			profileTitle.leadingAnchor.constraint(equalTo: profileView.leadingAnchor),
			profileTitle.trailingAnchor.constraint(equalTo: profileView.trailingAnchor),

			profileSubTitle.topAnchor.constraint(equalTo: profileTitle.bottomAnchor),
			profileSubTitle.leadingAnchor.constraint(equalTo: profileView.leadingAnchor),
			profileSubTitle.trailingAnchor.constraint(equalTo: profileView.trailingAnchor),

			profileLocationImage.widthAnchor.constraint(equalToConstant: Constants.Space.leading),
			profileLocationImage.heightAnchor.constraint(equalToConstant: Constants.Space.leading),

			profileLocationStackView.topAnchor.constraint(equalTo: profileSubTitle.bottomAnchor),
			profileLocationStackView.leadingAnchor.constraint(greaterThanOrEqualTo: profileView.leadingAnchor),
			profileLocationStackView.trailingAnchor.constraint(lessThanOrEqualTo: profileView.trailingAnchor),
			profileLocationStackView.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
			profileLocationStackView.bottomAnchor.constraint(equalTo: profileWrapper.bottomAnchor, constant: -19),
		])
	}

	private func setupSkillsConstraints() {
		NSLayoutConstraint.activate([
			skillsWrapper.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Constants.Space.leading),
		skillsWrapper.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Constants.Space.leading),
		skillsWrapper.topAnchor.constraint(equalTo: profileWrapper.bottomAnchor, constant: 21),
			skillsWrapper.bottomAnchor.constraint(equalTo: aboutView.topAnchor, constant: -Constants.Space.top),
			skillsWrapper.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -(Constants.Space.leading * 2)),

		skillsTitle.topAnchor.constraint(equalTo: skillsWrapper.topAnchor),
		skillsTitle.leadingAnchor.constraint(equalTo: skillsWrapper.leadingAnchor),
		skillsTitle.trailingAnchor.constraint(equalTo: skillsEditButton.leadingAnchor, constant: -(Constants.Space.leading / 2)),

		skillsEditButton.trailingAnchor.constraint(equalTo: skillsWrapper.trailingAnchor),
		skillsEditButton.topAnchor.constraint(equalTo: skillsWrapper.topAnchor),
			skillsEditButton.heightAnchor.constraint(equalToConstant: Constants.Space.top),
			skillsEditButton.widthAnchor.constraint(equalToConstant: Constants.Space.top),

		skillsCollectionView.leadingAnchor.constraint(equalTo: skillsWrapper.leadingAnchor),
		skillsCollectionView.trailingAnchor.constraint(equalTo: skillsWrapper.trailingAnchor),
			skillsCollectionView.topAnchor.constraint(equalTo: skillsEditButton.bottomAnchor, constant: Constants.Space.leading),
		skillsCollectionView.bottomAnchor.constraint(equalTo: skillsWrapper.bottomAnchor),
		skillsCollectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 56),
		])

	}

	private func setupAboutConstraints() {
		NSLayoutConstraint.activate([

			aboutView.topAnchor.constraint(equalTo: skillsWrapper.bottomAnchor, constant: Constants.Space.top),
		aboutView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Constants.Space.leading),
		aboutView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Constants.Space.leading),
		aboutView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			aboutView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -(Constants.Space.leading * 2)),

		aboutTitle.leadingAnchor.constraint(equalTo: aboutView.leadingAnchor),
		aboutTitle.trailingAnchor.constraint(equalTo: aboutView.trailingAnchor),
		aboutTitle.topAnchor.constraint(equalTo: aboutView.topAnchor),

		aboutSubTitle.leadingAnchor.constraint(equalTo: aboutView.leadingAnchor),
		aboutSubTitle.trailingAnchor.constraint(equalTo: aboutView.trailingAnchor),
		aboutSubTitle.topAnchor.constraint(equalTo: aboutTitle.bottomAnchor, constant: Constants.Space.leading / 2),
		aboutSubTitle.bottomAnchor.constraint(equalTo: aboutView.bottomAnchor),

		])
	}

	private func addTargets() {
		skillsEditButton.addTarget(
			self,
			action: #selector(skillsEditButtonAction), for: .touchUpInside
		)
	}

	@objc private func skillsEditButtonAction() {
		profileViewControllerDelegate?.editButtonAction()
	}

}
