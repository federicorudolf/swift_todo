//
//  ViewController.swift
//  todoApp
//
//  Created by Fede LPL on 28/02/2023.
//

import UIKit

class TodoListViewController: UITableViewController {
  
  var itemArray = ["Swift", "AI", "SHW", "ARF", "ML"]
  var doneViewController: DoneViewController?
  let defaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    doneViewController = storyboard?.instantiateViewController(withIdentifier: "DoneViewController") as? DoneViewController
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
    print("TODO: cellForRowAt", cell)
    cell.textLabel?.text = itemArray[indexPath.row]
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("TODO: numberOfRowsInSection", itemArray)
    return itemArray.count
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
      // Here's where the cell should be moved to the DoneTableView -> TODO
      let item = itemArray[indexPath.row]
      tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        self.doneViewController?.todoChangesDelegate = self
        self.doneViewController?.addTodo(todo: item)
        self.itemArray.remove(at: indexPath.row)
        self.tableView.reloadData()
      })
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}

extension TodoListViewController: TodoChangesDelegate {
  func addTodo(todo: String) {
    itemArray.append(todo)
    print("Reloading")
    self.tableView.reloadData()
    print("Called", itemArray)
  }
}

