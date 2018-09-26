//
//  UpdateSubjectView.swift
//  jikanwari
//
//  Created by Kohei Adachi on 2018/08/06.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import UIKit
import Eureka
import RealmSwift
class UpdateSubjectView: FormViewController {
    var receiveID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(receiveID)
        var PreSubjectname = Subject.getdata(index: receiveID)
        
        form +++ Section("科目情報")
            <<< NameRow("科目名"){ row in
                row.title = "科目名"
                row.placeholder = PreSubjectname
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
                $0.title = "Update"
                $0.onCellSelection{ [unowned self] cell, row in
                    self.didtapUpdateButton()
                }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didtapUpdateButton(){
        
        let nameRow = form.rowBy(tag: "科目名") as! NameRow
        let name = nameRow.value ?? ""
        
        if(name != ""){
            Subject.updatedata(id: receiveID, updatename: name)
        }
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
