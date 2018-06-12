//
//  ViewController.swift
//  jikanwari
//
//  Created by Kohei Adachi on 2018/06/08.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerPrevBtn: UIButton!
    @IBOutlet weak var HeaderNextBtn: UIButton!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var calendarHeaderView: UIView!
    @IBOutlet weak var calendarCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedHeaderPrevBtn(sender: UIButton){
    }
    
    @IBAction func tappedHeaderNextBtn(sender: UIButton){
    }

}

