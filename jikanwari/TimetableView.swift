//
//  TimetableView.swift
//  jikanwari
//
//  Created by 安達康平 on 2018/06/13.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import UIKit
import RealmSwift
class TimetableView: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate{
    let SubjectData = Subject()
    //let SubjectNames: [String] = ["","プログラム設計","","","人工知能プログラミング","","プログラム設計","","","人工知能プログラミング","言語処理工学","","言語処理工学","実験Ⅱ","OS","OS","離散数学Ⅰ",
    //                              "","実験Ⅱ","離散数学Ⅰ","","","","情報人類学","法律学B"]
   // var SubjectNames = Array(repeating:"", count:25)
    var SubjectID = 0
   // let userDefaults = UserDefaults.standard
    //データの個数を返すメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 25
    }
    
    //データを返すメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        //コレクションビューから識別子「Cell」のセルを取得する。
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        /*
        cell.subjectText.text = SubjectNames[indexPath.item]
        
        cell.subjectText.text = SubjectNames[indexPath.item]
        */
        //indexpathをプライマリーキーに科目をデータベースから読み出す
        cell.subject_label.text = Subject.getdata(index: indexPath.item)
//        cell.subject_label.text = SubjectNames[indexPath.item]
//        
//        cell.subject_label.text = SubjectNames[indexPath.item]

        //セルの背景色をランダムに設定する。
        //cell.backgroundColor = UIColor(red: CGFloat(drand48()),green: CGFloat(drand48()),blue: CGFloat(drand48()),alpha: 1.0)
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.tabBarController?.delegate = self
        //displayTimeTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayTimeTable()
        collectionView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //CalendarCellタップ時の操作
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        print("tap!")
        var ojbdata = Subject.getdata(index: indexPath.item)
        if(ojbdata == ""){
            SubjectID = indexPath.item
            performSegue(withIdentifier: "Segue", sender: nil)
        }
        else{
            SubjectID = indexPath.item
            performSegue(withIdentifier: "Segue2", sender: nil)
            
        }
    }
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "Segue") {
            let vc = segue.destination as! TableView
            vc.receiveID = SubjectID
        }
        else if (segue.identifier == "Segue2") {
            let vc = segue.destination as! UpdateSubjectView
            vc.receiveID = SubjectID
        }
        
    }
    
    func displayTimeTable(){
//        if ((userDefaults.object(forKey: "Subject")) != nil) {
//            //print("データ有り")
//            SubjectNames = userDefaults.array(forKey: "Subject") as! [String]
//            print(SubjectNames)
//        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}


