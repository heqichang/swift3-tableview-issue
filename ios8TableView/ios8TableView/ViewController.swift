//
//  ViewController.swift
//  ios8TableView
//
//  Created by heqichang on 2/23/17.
//  Copyright © 2017 heqichang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let colors = [UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.green, UIColor.red]
    private let heights: [CGFloat] = [150, 500, 150, 150, 150, 300, 100, 300]
    
    private var num = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return num + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("In cellForRow offset: \(tableView.contentOffset)")
        
        let row = indexPath.row
        
        let colorIndex = row % 5
        
        if row == self.num {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nextCell", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.backgroundColor = colors[colorIndex]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heights[indexPath.row % 8]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == self.num {
            self.num += 1
            self.tableView.reloadData()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("In scroll: \(scrollView.contentOffset)")
    }

}



