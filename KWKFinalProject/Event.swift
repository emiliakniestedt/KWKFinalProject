//
//  Event.swift
//  KWKFinalProject
//
//  Created by Vicky Zhu on 6/16/22.
//

import Foundation

var eventsList = [Event]()

class Event{
    var id: Int!
    var name: String!
    var date: Date!
    
    func eventsForDate(date: Date)->[Event]{
        var daysEvents = [Event]()
        for event in eventsList{
            if (event.date==date){
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
}
