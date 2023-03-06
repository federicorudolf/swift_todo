//
//  TodoSetter.swift
//  todoApp
//
//  Created by Fede LPL on 01/03/2023.
//

import Foundation

protocol TodoChangesDelegate {
  func addTodo(todo: String)
}

extension TodoChangesDelegate {
  func completeTodo(todo: String) {}
  func newTodoAdded(todo: String) {}
}
