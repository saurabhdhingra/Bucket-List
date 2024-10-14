//
//  Task.swift
//  Bucket List
//
//  Created by Saurabh Dhingra on 06/10/24.
//

import SwiftUI


struct Task: Identifiable {
    var id: UUID = . init()
    var taskTitle: String
    var creationDate: Date  = .init()
    var isCompleted: Bool = false
    var tint: Color
}



var sampleTask: [Task] = [
    .init(taskTitle: "Standup",  creationDate: .updateHour(-5), tint: .blue),
    .init(taskTitle: "Kickoff", creationDate: .updateHour(-5),isCompleted: true,   tint: .yellow),
    .init(taskTitle: "Ui Design",  creationDate: .updateHour(-5),isCompleted: false,   tint: .gray),
    .init(taskTitle: "Logo Design",  creationDate: .updateHour(-5),isCompleted: false,   tint: .green),
    .init(taskTitle: "Record Video",  creationDate: .updateHour(-5),isCompleted: false,   tint: .brown),
    .init(taskTitle: "Tweet about new Video!",  creationDate: .updateHour(-5),isCompleted: false,   tint: .red),
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
