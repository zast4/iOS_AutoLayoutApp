//
//  ViewController.swift
//  AutoLayoutApp
//
//  Created by Даниил on 28.08.2023.
//

import UIKit

enum Colors {
    static var mainPink = UIColor(named: "mainPink")
    static var transperentPink = UIColor(named: "transparencyPink")
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupLayout()
        setupBottomControls()
    }

    // MARK: - Setting up layout

    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.5
            ),
        ])

        NSLayoutConstraint.activate([
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImageView.heightAnchor.constraint(
                equalTo: topImageContainerView.heightAnchor
            ),
        ])

        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }

    fileprivate func setupBottomControls() {
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50),
        ])

        bottomControlsStackView.addArrangedSubview(previousButton)
        bottomControlsStackView.addArrangedSubview(pageControl)
        bottomControlsStackView.addArrangedSubview(nextButton)
    }

    fileprivate func addSubviews() {
        view.addSubview(descriptionTextView)
        view.addSubview(topImageContainerView)
        view.addSubview(bottomControlsStackView)
        topImageContainerView.addSubview(bearImageView)
    }

    // MARK: - UI Elements

    private let topImageContainerView: UIView = {
        let imageContainerView = UIView()
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        return imageContainerView
    }()

    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let descriptionTextView: UITextView = {
        let textView = UITextView()

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

    private let bottomControlsStackView: UIStackView = {
        let bottomStackView = UIStackView()
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        return bottomStackView
    }()

    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = Colors.mainPink
        pc.pageIndicatorTintColor = Colors.transperentPink
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()

    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(Colors.mainPink, for: .normal)
        return button
    }()
}
