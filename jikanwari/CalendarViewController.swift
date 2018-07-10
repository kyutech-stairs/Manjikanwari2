//
//  CalendarViewController.swift
//  jikanwari
//
//  Created by 陰山賢太 on 2018/06/21.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class CalendarViewController: FormViewController{
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    var receiveDate: String = "today"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Label.text = receiveDate
        //navigationTitle.title = receiveDate
        self.navigationItem.title = receiveDate
        form
        +++ Section()
            <<< TextRow("Subject") {
                $0.title = "科目名"
                $0.placeholder = "科目名"
        }
            <<< TextRow("Task") {
                $0.title = "課題名"
                $0.placeholder = "課題名"
        }
            <<< TextRow("Deadline") {
                $0.title = "〆切"
                $0.placeholder = "〆切"
        }
            <<< TextRow("Place") {
                $0.title = "提出場所"
                $0.placeholder = "提出場所"
        }
            // Button
            +++ Section()
            <<< ButtonRow(){
                $0.title = "Save"
                $0.onCellSelection{ [unowned self] cell, row in
                    self.didtapSaveButton()
                }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didtapSaveButton(){
        
        self.navigationController?.popViewController(animated: true)
    }
}
