//
//  TestViewController.swift
//  todoApp
//
//  Created by Fede LPL on 02/03/2023.
//

import Foundation
import UIKit

class TestViewController: UITableViewController, TodoSetter {
  var itemArray: [String] = ["test"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.reloadData()
    print("TestView Did load", itemArray)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)
    cell.textLabel?.text = itemArray[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
  }

  func addTodo(todo: String) {
    self.itemArray.append(todo)
    self.tableView.reloadData()
    print("TestVC Added:", todo, itemArray)
  }
}
