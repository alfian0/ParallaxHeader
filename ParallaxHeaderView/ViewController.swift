//
//  ViewController.swift
//  ParallaxHeaderView
//
//  Created by alfian on 28/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class ViewController: ParallaxController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
            cell.textLabel?.text = "Stretch Header"
            cell.selectionStyle = .None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController: IParallax {
    func setHeaderView() -> UIView {
        let headerView = NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil)[0] as! HeaderView
        return headerView
    }
    
    func setHeaderHeight() -> CGFloat {
        return 200
    }
    
    func setHeaderCut() -> CGFloat {
        return 0
    }
}