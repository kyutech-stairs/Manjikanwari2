//
//  CalendarViewController.swift
//  jikanwari
//
//  Created by 陰山賢太 on 2018/06/21.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import Foundation
import UIKit

class CalendarViewController: UIViewController{
    
    @IBOutlet weak var Label: UILabel!
    
    var receiveDate: String = "today"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = receiveDate
        self.navigationItem.title = receiveDate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
