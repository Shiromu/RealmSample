//
//  ViewController.swift
//  RealmSample
//
//  Created by Shiromu on 2018/11/04.
//  Copyright © 2018 Shiromu. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var todoItems: Results<Todo>!   //追加
    @IBOutlet var table:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //テーブル初期設定 ソースの場所 高さ  デリゲート宣言
        table.dataSource = self
        table.delegate = self

        let realm = try! Realm()
        todoItems = realm.objects(Todo.self)
        //ここで一旦テーブルの表示をリロード
        table.reloadData()
        
    }
    
    //画面が表示される前に実行される処理
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    
    //セル数設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count // 総todo数を返している
    }
    
    //セル表示処理
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let object = todoItems[indexPath.row]
        cell.textLabel?.text = object.title
        
        return cell
    }
    //cellのスワイプ→削除の流れの処理
    //参考 : https://qiita.com/Simmon/items/7f93e82b0a043008e227
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //先にrealmの該当データを消してからリロードさせると上手くいく アニメーションはなくなるけど。
            deleteTodo(at: indexPath.row)
            table.reloadData()
        }
    }
    
    func deleteTodo(at index: Int){
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(todoItems[index])
        }
    }


}

