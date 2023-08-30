//
//  SwipingController+UICollectionView.swift
//  AutoLayoutApp
//
//  Created by Даниил on 30.08.2023.
//

import UIKit

extension SwipingController {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    )
    -> CGFloat {
        return 0
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    )
    -> Int {
        return Pages.pages.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    )
    -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cellId",
            for: indexPath
        ) as! PageCell
        
        let page = Pages.pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    )
    -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

