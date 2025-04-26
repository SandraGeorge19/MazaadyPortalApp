//
//  DynamicCollectionView.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import Foundation
import UIKit

class DynamicCollectionView: UICollectionView {

    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
