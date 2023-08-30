//
//  SwipingController.swift
//  AutoLayoutApp
//
//  Created by Даниил on 30.08.2023.
//

import UIKit

enum Colors {
    static var mainPink = UIColor(named: "mainPink")
    static var transperentPink = UIColor(named: "transparencyPink")
}

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupBottomControls()

        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }

    // MARK: - CollectionView stuff
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
    }

    // MARK: - Setting layout

    fileprivate func setupBottomControls() {
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50),
            pageControl.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

    }

    fileprivate func addSubviews() {
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.addArrangedSubview(previousButton)
        bottomControlsStackView.addArrangedSubview(pageControl)
        bottomControlsStackView.addArrangedSubview(nextButton)
    }

    // MARK: - UI Elements

    private let bottomControlsStackView: UIStackView = {
        let bottomStackView = UIStackView()
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillProportionally
        return bottomStackView
    }()

    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = Pages.pages.count
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
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(Colors.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Observers

    @objc
    func handlePrevious() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    @objc
    func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, Pages.pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
