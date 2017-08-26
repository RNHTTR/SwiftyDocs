//
//  SideBar.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 6/10/17.
//  Copyright © 2017 Ryan Hatter. All rights reserved.
//

import UIKit

@objc protocol SideBarDelegate {
    func sideBarDidSelectButtonAtIndex(index: Int)
    @objc optional func sideBarWillClose()
    @objc optional func sideBarWillOpen()
}

class SideBar: NSObject, SidebarTableViewControllerDelegate {
    
    let barWidth: CGFloat = 200.0
    let sideBarTableViewTopInset: CGFloat = 64.0
    let sideBarContainerView: UIView = UIView()
    let sideBarTableViewController: SideBarTableViewController = SideBarTableViewController()
    var originView: UIView!
    
    var animator: UIDynamicAnimator!
    var delegate: SideBarDelegate?
    var isSideBarOpen: Bool = false
    
    override init() {
        super.init()
    }
    
    init(sourceView: UIView, menuItems: [String]) {
        super.init()
        originView = sourceView
        sideBarTableViewController.dataSource = menuItems
        
        setupSideBar()
        
        animator = UIDynamicAnimator(referenceView: originView)
        
        let showGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        showGestureRecognizer.direction = .right
        originView.addGestureRecognizer(showGestureRecognizer)
        
        let hideGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        hideGestureRecognizer.direction = .left
        originView.addGestureRecognizer(hideGestureRecognizer)
        
    }
    
    func setupSideBar() {
        
        sideBarContainerView.frame = CGRect(x: originView.frame.size.width,
                                            y: originView.frame.origin.y,
                                            width: barWidth,
                                            height: 50 * 5)
        
        sideBarContainerView.backgroundColor = .clear
        sideBarContainerView.layer.cornerRadius = 4
        sideBarContainerView.clipsToBounds = false
        
        originView.addSubview(sideBarContainerView)
        
        sideBarTableViewController.delegate = self
        sideBarTableViewController.tableView.frame = sideBarContainerView.bounds
        sideBarTableViewController.tableView.clipsToBounds = false
        sideBarTableViewController.tableView.separatorStyle = .none
        sideBarTableViewController.tableView.backgroundColor = .clear
        sideBarTableViewController.tableView.scrollsToTop = false
        sideBarTableViewController.tableView.contentInset = UIEdgeInsetsMake(sideBarTableViewTopInset, 0, 0, 0)
        sideBarTableViewController.tableView.layer.cornerRadius = 4
        
        sideBarTableViewController.tableView.reloadData()
        
        sideBarContainerView.addSubview(sideBarTableViewController.tableView)
        
    }
    
    func sideBarControlDidSelectRow(indexPath: IndexPath) {
        delegate?.sideBarDidSelectButtonAtIndex(index: indexPath.row)
    }
    
    func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .right {
            showSideBar(shouldOpen: false)
            delegate?.sideBarWillClose?()
        } else {
            showSideBar(shouldOpen: true)
            delegate?.sideBarWillOpen?()
        }
    }
    
    
    func showSideBar(shouldOpen: Bool) {
        
        animator.removeAllBehaviors()
        isSideBarOpen = shouldOpen
        
        print("shouldOpen: \(shouldOpen)")
        
        let boundaryX:  CGFloat = (shouldOpen) ? barWidth + 15 : originView.frame.size.width + barWidth + 2
        let gravityX:   CGFloat = (shouldOpen) ? -1 : 1
        let magnitude:  CGFloat = (shouldOpen) ? -10 : 10
        
        let gravityBehavior: UIGravityBehavior = UIGravityBehavior(items: [sideBarContainerView])
        gravityBehavior.gravityDirection = CGVector(dx: gravityX, dy: 0)
        animator.addBehavior(gravityBehavior)
        
        let collisionBehavior: UICollisionBehavior = UICollisionBehavior(items: [sideBarContainerView])
        collisionBehavior.addBoundary(withIdentifier: "sideBarBoundary" as NSCopying, from: CGPoint(x: boundaryX, y: 20), to: CGPoint(x: boundaryX, y: originView.frame.size.height))
        animator.addBehavior(collisionBehavior)
        
        let pushBehavior: UIPushBehavior = UIPushBehavior(items: [sideBarContainerView], mode: .instantaneous)
        pushBehavior.magnitude = magnitude
        animator.addBehavior(pushBehavior)
        
    }
}
