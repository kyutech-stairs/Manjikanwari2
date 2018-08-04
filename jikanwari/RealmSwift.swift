//
//  RealmSwift.swift
//  jikanwari
//
//  Created by Kohei Adachi on 2018/08/03.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import Foundation
import RealmSwift

class Subject: Object {
    @objc dynamic var name = "";
    @objc dynamic var id : Int = 0;
    // idをプライマリキーに設定
    override static func primaryKey() -> String? {
        return "id"
    }
}
