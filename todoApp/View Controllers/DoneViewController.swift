//
//  DoneViewController.swift
//  todoApp
//
//  Created by Fede LPL on 28/02/2023.
//

import Foundation
import UIKit

class DoneViewController: UITableViewController, TodoChangesDelegate {
  var itemArray: [String] = ["test"]
  var todoChangesDelegate: TodoChangesDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DoneItemCell", for: indexPath)
    print("DONE: cellForRowAt")
    cell.textLabel?.text = itemArray[indexPath.row]
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("DONE: numberOfRowsInSection", itemArray)
    return itemArray.count
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("DONE: didSelectRowAt")
    if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
      tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    } else {
      tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
    
  }

  func addTodo(todo: String) {
    self.itemArray.append(todo)
    self.tableView.reloadData()
  }
}
