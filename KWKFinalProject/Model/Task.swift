//
//  Task.swift
//  KWKFinalProject
//
//  Created by Vicky Zhu on 6/15/22.
//

import SwiftUI

//Task Model and Sample Task...

struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

var tasks: [TaskMetaData] = [
    TaskMetaData(task: [
        Task(title: "Talk to iJustine"),
        Task(title: "iPhone 13 great design change"),
        Task(title: "Nothing Much workout")
    ], taskDate: getSampleDate(offset: 1)),
    TaskMetaData(task: [
        Task(title: "Talk to Jenna")
    ], taskDate: getSampleDate(offset: -3)),
    TaskMetaData(task: [
        Task(title: "meeting with tim")
    ], taskDate: getSampleDate(offset: -8)),
    TaskMetaData(task: [
        Task(title: "next version of swift")
    ], taskDate: getSampleDate(offset: 10)),
    TaskMetaData(task: [
        Task(title: "not much workout")
    ], taskDate: getSampleDate(offset: -22)),
    TaskMetaData(task: [
        Task(title: "iPhone 13 great design change")
    ], taskDate: getSampleDate(offset: 15)),
    TaskMetaData(task: [
        Task(title: "k update")
    ], taskDate: getSampleDate(offset: -20)),
]

    


