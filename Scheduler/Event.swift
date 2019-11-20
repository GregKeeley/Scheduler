//
//  Event.swift
//  Scheduler
//
//  Created by Gregory Keeley on 11/20/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct Event {
    var date: Date
    var name: String
    
    static func getTestData() -> [Event] {
        var events = [Event]()
        
        let eventNames = ["code", "Unit assessment", "iOS Social", "Ice cream party", "Jam out", "Sleep"]
        for eventName in eventNames {
            let event = Event(date: Date(), name: eventName)
            events.append(event)
        }
        return events
    }
}
