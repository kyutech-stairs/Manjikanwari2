//
//  ViewController.swift
//  jikanwari
//
//  Created by Kohei Adachi on 2018/06/08.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import UIKit

extension UIColor {
    class func lightBlue() -> UIColor {
        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }
    
    class func lightRed() -> UIColor {
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let dateManager = DateManager()
    let daysPerWeek: Int = 7
    let cellMargin: CGFloat = 2.0
    var selectedDate = Date()
    var today: Date!
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
   
    @IBOutlet weak var headerPrevBtn: UIButton!
    @IBOutlet weak var headerNextBtn: UIButton!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var calendarHeaderView: UIView!
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    //Prevタップ時
    @IBAction func tappedHeaderPrevBtn(_ sender: UIButton) {
        selectedDate = dateManager.prevMonth(date: selectedDate)
        calendarCollectionView.reloadData()
        headerTitle.text = changeHeaderTitle()
    }
    //Nextタップ時
    @IBAction func tappedHeaderNextBtn(_ sender: UIButton) {
        selectedDate = dateManager.nextMonth(date: selectedDate)
        calendarCollectionView.reloadData()
        headerTitle.text = changeHeaderTitle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.backgroundColor = UIColor.white
        
        headerTitle.text = changeHeaderTitle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //1
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 2
//    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    
    //2
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Section毎にCellの総数を変える.
        if section == 0 {
            return 7
        } else {
            return dateManager.daysAcquisition() //ここは月によって異なる(後ほど説明します)
        }
    }
    //3
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalendarCell
        //テキストカラー
        if (indexPath.row % 7 == 0) {
            cell.textLabel.textColor = UIColor.lightRed()
        } else if (indexPath.row % 7 == 6) {
            cell.textLabel.textColor = UIColor.lightBlue()
        } else {
            cell.textLabel.textColor = UIColor.gray
        }
        //テキスト配置
        if indexPath.section == 0 {
            cell.textLabel.text = weekArray[indexPath.row]
        } else {
            print("xxx")
            cell.textLabel.text = dateManager.conversionDateFormat(indexPath: indexPath as NSIndexPath)
            //月によって1日の場所は異なる(後ほど説明します)
        }

        return cell
    }
    
    //セルのサイズを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin: CGFloat = 8.0
        let width: CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / CGFloat(daysPerWeek)
        let height: CGFloat = width * 1.0
        return CGSize(width: width, height: height)
        
    }
    
    //セルの垂直方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    //セルの水平方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    //headerの月を変更
    func changeHeaderTitle() -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "M/yyyy"
        let selectMonth = formatter.string(from: selectedDate)
        return selectMonth
    }
    
}

