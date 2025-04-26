//
//  TobTapsTableViewCell.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import UIKit

class TobTapsTableViewCell: UITableViewCell {
    @IBOutlet weak var tapsSegmentControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    private var pageViewController: UIPageViewController?
    private var viewControllers: [UIViewController] = []
    private var parentViewController: UIViewController?
    private var currentIndex = 0
    private var viewModel: UserProfileViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupSegmentedControl()
    }
    
    func setupProducts(viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupSegmentedControl() {
        tapsSegmentControl.removeAllSegments()
        ["Products", "Reviews", "Followers"].enumerated().forEach { index, title in
            tapsSegmentControl.insertSegment(withTitle: title, at: index, animated: false)
        }
        tapsSegmentControl.selectedSegmentIndex = 0
        tapsSegmentControl.addUnderlineForSelectedSegment()
        tapsSegmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    
    func configure(parent: UIViewController) {
        self.parentViewController = parent
        let productsVC = ProductsViewController(nibName: "ProductsViewController", bundle: nil)
        productsVC.viewModel = viewModel
        
        let reviewsVC = ReviewsViewController(nibName: "ReviewsViewController", bundle: nil)
        let followersVC = FollowersViewController(nibName: "FollowersViewController", bundle: nil)
        
        viewControllers = [productsVC, reviewsVC, followersVC]
        
        setupPageViewController()
    }
    
    private func setupPageViewController() {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageVC.setViewControllers([viewControllers[0]], direction: .forward, animated: false)
        
        parentViewController?.addChild(pageVC)
        containerView.addSubview(pageVC.view)
        
        pageVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageVC.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            pageVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            pageVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            pageVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        pageVC.didMove(toParent: parentViewController)
        
        pageVC.dataSource = self
        pageVC.delegate = self
        
        self.pageViewController = pageVC
    }
    
    @objc private func segmentChanged() {
        let index = tapsSegmentControl.selectedSegmentIndex
        tapsSegmentControl.changeUnderlinePosition()
        let direction: UIPageViewController.NavigationDirection = index >= currentIndex ? .forward : .reverse
        pageViewController?.setViewControllers([viewControllers[index]], direction: direction, animated: true)
        currentIndex = index
    }
    
    
    
}

extension TobTapsTableViewCell: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index > 0 else { return nil }
        return viewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count - 1 else { return nil }
        return viewControllers[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let visibleVC = pageViewController.viewControllers?.first, let index = viewControllers.firstIndex(of: visibleVC) {
            tapsSegmentControl.selectedSegmentIndex = index
            currentIndex = index
        }
    }
}
