//
//  PageCell.swift
//  AutoLayoutApp
//
//  Created by Даниил on 30.08.2023.
//

import UIKit

class PageCell: UICollectionViewCell {
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var page: Page? {
        didSet {
//            print(page?.imageName)
            guard let unwrappedPage = page else { return }

            bearImageView.image = UIImage(named: unwrappedPage.imageName)

            let attributedText = NSMutableAttributedString(
                string: unwrappedPage.headerText,
                attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
            )
            attributedText.append(NSAttributedString(
                string: "\n\n\n\(unwrappedPage.bodyText)",
                attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                    NSAttributedString.Key.foregroundColor: UIColor.gray,
                ]
            ))

            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }

    // MARK: - Setting up layout

    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.heightAnchor.constraint(
                equalTo: heightAnchor,
                multiplier: 0.5
            ),
        ])

        NSLayoutConstraint.activate([
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImageView.heightAnchor.constraint(
                equalTo: topImageContainerView.heightAnchor,
                multiplier: 0.5
            ),
        ])

        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }

    fileprivate func addSubviews() {
        addSubview(descriptionTextView)
        addSubview(topImageContainerView)
        // addSubview(bottomControlsStackView)
        topImageContainerView.addSubview(bearImageView)
    }

    // MARK: - UI Elements

    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let topImageContainerView: UIView = {
        let imageContainerView = UIView()
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        return imageContainerView
    }()

    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white

        let attributedText = NSMutableAttributedString(
            string: "Join us today in out fun and games!",
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        )
        attributedText.append(NSAttributedString(
            string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in out stores soon.",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                NSAttributedString.Key.foregroundColor: UIColor.gray,
            ]
        ))
        textView.attributedText = attributedText

        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
}
