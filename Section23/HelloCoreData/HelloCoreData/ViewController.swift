//
//  ViewController.swift
//  HelloCoreData
//
//  Created by mikewang on 2017/9/19.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDel?.persistentContainer.viewContext else { return }
        // 儲存資料到 CoreData
//        let aUser = User(context: context)
//        aUser.username = "Mike Wang"
//        aUser.password = "12345678"
//        appDel?.saveContext()
        
        // 讀取CoreData 的資料
        do {
            let results = try context.fetch(User.fetchRequest())
            for item in results {
                guard let aUser = item as? User else { return }
                print("\(aUser.username!)")
                print("\(aUser.password!)")
            }
        } catch { }
        
        // 修改特定資料
        do {
            let results = try context.fetch(User.fetchRequest())
            for (i, item) in results.enumerated() {
                guard let aUser = item as? User else { return }
                if aUser.username! == "Mike Wang NO1" {
                    aUser.username = "Peter Pan NO1"
                }
                appDel?.saveContext()
            }
        } catch { }
        
        
        // 刪除特定資訊
        do {
            let results = try context.fetch(User.fetchRequest())
            for (i, item) in results.enumerated() {
                guard let aUser = item as? User else { return }
                if aUser.username! == "Mike Wang NO3" {
                    context.delete(aUser)
                }
                appDel?.saveContext()
            }
        } catch { }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

