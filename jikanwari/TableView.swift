//
//  TableView.swift
//  jikanwari
//
//  Created by Kohei Adachi on 2018/06/14.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import UIKit
import Eureka

class TableView: FormViewController {
    var receiveID = 0
    let userDefaults = UserDefaults.standard
    var SubjectNames = Array(repeating:"", count:25)
    override func viewDidLoad() {
        super.viewDidLoad()
            
            form +++ Section("科目情報")
            <<< NameRow("科目名"){ row in
                row.title = "科目名"
                row.placeholder = "科目名を入力"
                }
            <<< TextRow(){
                $0.title = "教室"
                $0.placeholder = "教室を入力"
            }
            <<< TextRow(){
                $0.title = "教員"
                $0.placeholder = "教員名を入力"
        }
        
        // Button
            +++ Section()
            <<< ButtonRow(){
                $0.title = "Save"
                $0.onCellSelection{ [unowned self] cell, row in
                    self.didtapSaveButton()
                }
        }
        print(receiveID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didtapSaveButton(){
        // Get the value of a single row
        let nameRow = form.rowBy(tag: "科目名") as! NameRow
        let name = nameRow.value!
        //print(name)
        if ((userDefaults.object(forKey: "Subject")) != nil) {
            print("データ有り")
            SubjectNames = userDefaults.array(forKey: "Subject") as! [String]
        }
        
        // SubjectNames = userDefaults.array(forKey: "Subject") as! [String]
        SubjectNames[receiveID] = name
        userDefaults.set(SubjectNames,forKey: "Subject")
        
        self.navigationController?.popViewController(animated: true)
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 

    
}
