//
//  ViewController.swift
//  ios8TableView23
//
//  Created by heqichang on 2/23/17.
//  Copyright © 2017 heqichang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private let colors = [UIColor.blueColor(), UIColor.brownColor(), UIColor.cyanColor(), UIColor.greenColor(), UIColor.redColor()]
    private let heights: [CGFloat] = [150, 500, 150, 150, 150, 300, 100, 300]
    
    private var num = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return num + 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let colorIndex = row % 5
        
        if row == self.num {
            let cell = tableView.dequeueReusableCellWithIdentifier("nextCell", forIndexPath: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            
            cell.backgroundColor = colors[colorIndex]
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.heights[indexPath.row % 8]
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == self.num {
            self.num += 1
            self.tableView.reloadData()
        }
    }

}

