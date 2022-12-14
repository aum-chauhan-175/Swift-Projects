import Foundation
import SwiftUI

struct newReminderStructure: Codable,Identifiable{
    var id: String  = UUID().uuidString
    let ReminderTitle: String
    let isFinish: Bool
    
//    init(id: String = UUID().uuidString, RemiderTitle: String, isFinish: Bool){
//        self.id = id
//        self.RemiderTitle = RemiderTitle
//        self.isFinish = isFinish
//    }
//
//    func updatingTodoList() -> newReminder {
//        return newRemider(id: id, RemiderTitle: RemiderTitle, isFinish: !isFinish)
//    }
    
}

