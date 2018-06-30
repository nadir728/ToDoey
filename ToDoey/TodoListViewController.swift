//
//  ViewController.swift
//  ToDoey
//
//  Created by nad on 10/16/1439 AH.
//  Copyright © 1439 nader. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var ItemArray = ["find milk","buy rice","buy coffe"]
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let items = UserDefaults.standard.array(forKey: "todolistArray") as? [String] {
            ItemArray = items
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ToDoItemCell" , for:indexPath)
        
        cell.textLabel?.text = ItemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(ItemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        
        let allert = UIAlertController(title: "add todoey", message: "", preferredStyle:.alert)
        let  action = UIAlertAction(title: "add Item", style: .default) { (action) in
            print("succed")
            self.ItemArray.append(textfield.text!)
            self.defaults.set(self.ItemArray, forKey: "todolistArray")
            self.tableView.reloadData()
        }
        allert.addTextField { (alllertTextField) in
            alllertTextField.placeholder = "Creat new one"
textfield = alllertTextField
            
        }
        allert.addAction(action)
            present(allert, animated: true, completion: nil)
        }
    
        
    }
    


