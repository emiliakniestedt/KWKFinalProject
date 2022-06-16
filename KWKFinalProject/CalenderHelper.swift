import UIKit
import Foundation

class CalenderHelper{
    
    let calender = Calendar.current
    func plusMonth(date: Date)->Date{
        return calender.date(byAdding: .month, value: 1,to: date)!
    }
    func minusMonth(date: Date)->Date{
        return calender.date(byAdding: .month, value: -1,to: date)!
    }
    func monthString(date: Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    func yearString(date: Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
       /* let str = dateFormatter.string(from: date)
        let index = str.index(str.startIndex, offsetBy: 3)
        let mySubstring = str.prefix(upTo: index)*/
        return dateFormatter.string(from: date)
    }
    func timeString(date: Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
       /* let str = dateFormatter.string(from: date)
        let index = str.index(str.startIndex, offsetBy: 3)
        let mySubstring = str.prefix(upTo: index)*/
        return dateFormatter.string(from: date)
    }
    func daysInMonth(date: Date)->Int{
        let range = calender.range(of: .day, in: .month, for: date)
        return range!.count
    }
    func daysOfMonth(date: Date)->Int{
        let components = calender.dateComponents([.day], from: date)
        return components.day!
    }
    func firstOfMonth(date: Date)->Date{
        let components = calender.dateComponents([.year,.month], from: date)
        return calender.date(from: components)!
    }
    func weekDay(date: Date)->Int{
        let components = calender.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    func addDays(date: Date, days: Int) -> Date {
        return calender.date(byAdding: .day, value: days, to: date)!
    }
    
    func sundayForDate(date: Date)->Date{
        var current = date
        let oneWeekAgo = addDays(date: current, days: -7)
        while (current > oneWeekAgo){
            let currentWeekDay = calender.dateComponents([.weekday], from: current).weekday
            if(currentWeekDay==1){
                return current
            }
            
            current = addDays(date:current,days:-1)
        }
        return current
    }
}
