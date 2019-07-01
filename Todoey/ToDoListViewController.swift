//
//  ViewController.swift
//  Todoey
//
//  Created by Глеб on 01/07/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    
    let itemArray = ["find milk", "make my own project", "call mom"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK - Table View Datasource Methodts
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        
        return cell
    }
    
    //MARK - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let attributeString =  NSMutableAttributedString(string: itemArray[indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            attributeString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
            tableView.cellForRow(at: indexPath)?.textLabel?.attributedText = attributeString
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
            tableView.cellForRow(at: indexPath)?.textLabel?.attributedText = attributeString
            
            
        }
    }
    
    func muteString (cellText : String) -> NSMutableAttributedString {
        let attributeString =  NSMutableAttributedString(string: cellText)
        
        return attributeString
    }
}

