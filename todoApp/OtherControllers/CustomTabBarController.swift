//
//  CustomTabBarController.swift
//  todoApp
//
//  Created by Fede LPL on 28/02/2023.
//

import UIKit

class CustomTabBarController: UITabBarController {
  @IBInspectable var initialIndex: Int = 0
  private let floatingAddButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
  private var todoListViewController: TodoListViewController? = nil
  override func viewDidLoad() {
    super.viewDidLoad()
    selectedIndex = initialIndex
    createButton()
    view.addSubview(floatingAddButton)
    floatingAddButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    todoListViewController = viewControllers?[0] as? TodoListViewController
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    floatingAddButton.frame = CGRect(x: view.frame.size.width - 75, y: view.frame.size.height - 120, width: 60, height: 60)
  }
  
  func createButton() {
    let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold))
    floatingAddButton.setImage(image, for: .normal)
//    floatingAddButton.layer.masksToBounds = true
    floatingAddButton.layer.cornerRadius = 30
    floatingAddButton.backgroundColor = .systemRed
    floatingAddButton.layer.shadowRadius = 10
    floatingAddButton.layer.shadowOpacity = 0.3
    floatingAddButton.tintColor = .white
  }
  
  @objc private func didTapButton(){
    let alertController = UIAlertController(title: "Add Todo", message: "Add your todo to the list", preferredStyle: .alert)
    alertController.addTextField { (textField: UITextField!) in
      textField.placeholder = "Apples"
    }
    let saveAction = UIAlertAction(title: "Ok", style: .default, handler: { alert -> Void in
      if let textField = alertController.textFields?[0] {
        if textField.text!.count > 0 {
          if let todo = textField.text {
            self.todoListViewController?.addTodo(todo: todo)
          }
        }
      }
    })
    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in })
    alertController.addAction(saveAction)
    alertController.addAction(cancelAction)
    present(alertController, animated: true)
  }
}
