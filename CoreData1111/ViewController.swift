//
//  ViewController.swift
//  CoreData1111
//
//  Created by Dima on 3/12/19.
//  Copyright © 2019 Dima. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var phoneLable: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    var itemArray = [User]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        loadItems()
        nameLable.text = 
        //phoneLable.text =
        
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let newItem = User(context: self.context)
        
        newItem.name = nameTextField.text
        newItem.phone = phoneTextField.text
        
        itemArray.append(newItem)
        
        saveItems()

    }
    
    func saveItems() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
    }
    
    func loadItems() {
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error featching data from context \(error)")
        }
        
    }
    
}

