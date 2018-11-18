//
//  AddViewController.swift
//  RealmSample
//
//  Created by Shiromu on 2018/11/04.
//  Copyright © 2018 Shiromu. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func CreateButton(_ sender: Any) {
        let realm = try! Realm()
        let todo = Todo()
        todo.title = textField.text!
        try! realm.write {
            realm.add(todo)
        }
        self.navigationController?.popViewController(animated: true)    //変更
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
