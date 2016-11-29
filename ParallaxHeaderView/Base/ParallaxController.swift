//
//  ParallaxController.swift
//  ParallaxHeaderView
//
//  Created by alfian on 28/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

public protocol IParallax {
    func setHeaderView() -> UIView
    func setHeaderHeight() -> CGFloat
    func setHeaderCut() -> CGFloat
}

extension IParallax {
    func setHeaderHeight() -> CGFloat {
        return 200
    }
    
    func setHeaderCut() -> CGFloat {
        return 0
    }
}

public class ParallaxController: UITableViewController {
    private var headerView: UIView!
    private var headerLayer: CAShapeLayer!
    private var headerHeight: CGFloat = 0
    private var headerCut: CGFloat = 0
    public var delegate: IParallax? {
        didSet {
            guard let delegate = self.delegate else { return }
            self.tableView.tableHeaderView = delegate.setHeaderView()
            self.headerHeight = delegate.setHeaderHeight()
            self.headerCut = delegate.setHeaderCut()
            self.updateHeaderView()
        }
    }
    
    public override func scrollViewDidScroll(scrollView: UIScrollView) {
        self.setHeaderView()
    }
    
    public func updateHeaderView() {
        guard let tableHeaderView = self.tableView.tableHeaderView else {
            return
        }
        self.tableView.backgroundColor = UIColor.whiteColor()
        self.headerView = tableHeaderView
        self.tableView.tableHeaderView = nil
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.addSubview(self.headerView)

        self.headerLayer = CAShapeLayer()
        self.headerLayer.fillColor = UIColor.blackColor().CGColor
        self.headerView.layer.mask = headerLayer

        let newHeight = self.headerHeight - self.headerCut/2
        
        self.tableView.contentInset = UIEdgeInsets(top: newHeight, left: 0, bottom: 0, right: 0)
        self.tableView.contentOffset = CGPoint(x: 0, y: -newHeight)
        
        self.setHeaderView()
    }
    
    private func setHeaderView() {
        guard let headerView = self.headerView else {
            return
        }
        let newHeight = self.headerHeight - self.headerCut/2
        var getHeaderFrame = CGRect(x: 0, y: -newHeight, width: self.tableView.bounds.width, height: self.headerHeight)
        if self.tableView.contentOffset.y < newHeight {
            getHeaderFrame.origin.y = self.tableView.contentOffset.y
            getHeaderFrame.size.height = -self.tableView.contentOffset.y + self.headerCut/2
        }
        headerView.frame = getHeaderFrame
        let cutDirection = UIBezierPath()
            cutDirection.moveToPoint(CGPoint(x: 0, y: 0))
            cutDirection.addLineToPoint(CGPoint(x: getHeaderFrame.width, y: 0))
            cutDirection.addLineToPoint(CGPoint(x: getHeaderFrame.width, y: getHeaderFrame.height))
            cutDirection.addLineToPoint(CGPoint(x: 0, y: getHeaderFrame.height - self.headerCut))
        self.headerLayer.path = cutDirection.CGPath
    }
}