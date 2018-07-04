//
//  ManjiViewController.swift
//  jikanwari
//
//  Created by Kohei Adachi on 2018/07/04.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import UIKit

class ManjiViewController: UIViewController {
    let userDefaults = UserDefaults.standard
    var SubjectNames = Array(repeating:"", count:25)
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.tabBarController?.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func jikanwariDelete(_ sender: Any) {
        userDefaults.set(SubjectNames,forKey: "Subject")
        userDefaults.synchronize()
    }
    //userDefaults.removeObject(forKey: "Subject")
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension ManjiViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
