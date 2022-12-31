import Foundation

struct contactsListModel: Hashable{
    var contactName: String
    var contactNumber: String
    var lastMessage: String
    var readUnreadStatus: Bool
}

struct MissedCallListModel: Hashable{
    var contactName: String
    var videoCall: Bool
    var outgoing: Bool
}

struct AllCallListModel: Hashable{
    var contactName: String
    var videoCall: Bool
    var outgoing: Bool
}
