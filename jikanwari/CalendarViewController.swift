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
            <<< TextRow("TextFiled") {
                $0.title = "課題名"
                $0.placeholder = "ここに入力"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
