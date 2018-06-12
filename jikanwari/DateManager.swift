//
//  DateManager.swift
//  jikanwari
//
//  Created by 陰山賢太 on 2018/06/13.
//  Copyright © 2018年 Kohei Adachi. All rights reserved.
//

import UIKit

extension Date {
    func monthAgoDate() -> Date {
        let addValue = -1
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return calendar.date(byAdding: dateComponents, to: self)!
    }
    func monthLaterDate() -> Date {
        let addValue: Int = 1
        let calender = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        
        return calender.date(byAdding: dateComponents, to: self)!
    }
}

class DateManager: NSObject {

    var currentMonthOfDates = [Date]() // 表記する月の配列
    var selectedDate = Date()
    let daysPerWeek: Int = 7
    var numberOfItems: Int = 0 // セルの個数　nilが入らないようにする
    
    // 月ごとのセル数を返すメソッド
    func daysAcquisition() -> Int {
        let rangeOfWeeks = Calendar.current.range(of: .weekOfMonth, in: .month, for: firstDateOfMonth() as Date)
        guard let unwrapedRangeOfWeeks = rangeOfWeeks else {
            return numberOfItems
        }
        
        let numberOfWeeks = unwrapedRangeOfWeeks.count // 月が持つ週の数
        
        numberOfItems = numberOfWeeks * daysPerWeek // 週の数*列の数
        return numberOfItems
    }
    // 月の初日を取得
    func firstDateOfMonth() -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from:selectedDate)
        components.day = 1
        let firstDateMonth = Calendar.current.date(from: components)!
        return firstDateMonth
    }
    
    // 表記する日にちの取得
    func dateForCellAtIndexPath(numberOfItem: Int){
        let ordinalityOfFirstDay = Calendar.current.ordinality(of: .day, in: .weekOfMonth, for: firstDateOfMonth())
        
        for i in 0 ..< numberOfItems {
            // 「月の初日」と「indexPath.item番目のセルに表示する日」の差を計算する
            var dateComponents = DateComponents()
            dateComponents.day = i - (ordinalityOfFirstDay! - 1)
            // 表示する月の初日から計算した差を引いた日付を取得
            let date = Calendar.current.date(byAdding: dateComponents, to: firstDateOfMonth() as Date)!
            
            currentMonthOfDates.append(date)
        }
    }
    
    func conversionDateFormat(indexPath: NSIndexPath) -> String {
        dateForCellAtIndexPath(numberOfItem: numberOfItems)
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: currentMonthOfDates[indexPath.row])
    }
}
