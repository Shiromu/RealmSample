//
//  TableViewController.swift
//  RealmSample
//
//  Created by Shiromu on 2018/11/05.
//  Copyright © 2018 Shiromu. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {

    var todoItems: Results<Todo>!   //追加
//    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        追加
        let realm = try! Realm()
        todoItems = realm.objects(Todo.self)
//        追加ここまで
//        最初の処理でrealmを一度だけ読み込む様にした
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "作成", style: .plain, target: self, action: #selector(self.goCreate))

    }
    
//    @objc func goCreate() {
//        performSegue(withIdentifier: "goCreate", sender: nil)
//    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let todoCollection = realm.objects(Todo.self)
        // Realmに保存されているTodo型のobjectsを取得。
        
        return todoItems.count // 総todo数を返している
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let object = todoItems[indexPath.row]
        cell.textLabel?.text = object.title

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
