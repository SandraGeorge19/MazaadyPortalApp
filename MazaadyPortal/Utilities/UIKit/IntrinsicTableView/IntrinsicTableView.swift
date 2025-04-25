//
//  IntrinsicTableView.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation
import UIKit

@IBDesignable
class IntrinsicTableView: UITableView {

    private lazy var heightConstraint: NSLayoutConstraint = {
        let heightConstraint = self.heightAnchor.constraint(equalToConstant: 10)
        heightConstraint.priority = self.contentHuggingPriority(for: .vertical)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(heightConstraint)
        return heightConstraint
    }()

    var animated: Bool = false
    override var contentSize: CGSize {
        didSet {
            estimatedContentSize = contentSize
        }
    }

    private var estimatedContentSize: CGSize = .zero {
        didSet {
            if oldValue.height != estimatedContentSize.height {
                if self.animated {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                        self.heightConstraint.constant = self.estimatedContentSize.height
                        UIView.animate(withDuration: 0.3, animations: {
                            let scrollView = self.parentScrollView
                            (scrollView ?? self.superview)?.superview?.setNeedsLayout()
                            (scrollView ?? self.superview)?.superview?.layoutIfNeeded()
                        })
                    }
                } else {
                    self.heightConstraint.constant = self.estimatedContentSize.height
                }
            }
        }
    }

    private var parentScrollView: UIScrollView? {
        return IntrinsicTableView.getParentScrollView(of: self)
    }

    private static func getParentScrollView(of view: UIView) -> UIScrollView? {
        if let superview = view.superview {
            if let scrollView = superview as? UIScrollView {
                return scrollView
            } else {
                return getParentScrollView(of: superview)
            }
        }
        return nil
    }
}
