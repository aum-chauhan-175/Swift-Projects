import Foundation

class LocalContactsClass: ObservableObject {
    
    @Published var contactsDetailArray: [contactsListModel] = [
        contactsListModel(contactName: "Aum", contactNumber: "9876543210", lastMessage: "💀🌚", readUnreadStatus: false),
        contactsListModel(contactName: "Tim", contactNumber: "9876543210", lastMessage: "Ok", readUnreadStatus: false),
        contactsListModel(contactName: "Jimmy", contactNumber: "9876543210", lastMessage: "Yes", readUnreadStatus: true),
        contactsListModel(contactName: "Lorem", contactNumber: "9876543210", lastMessage: "Not Now", readUnreadStatus: true),
        contactsListModel(contactName: "Anderson", contactNumber: "9876543210", lastMessage: "No", readUnreadStatus: true),
        contactsListModel(contactName: "Steven", contactNumber: "9876543210", lastMessage: "Let's See", readUnreadStatus: false),
        contactsListModel(contactName: "Craig", contactNumber: "9876543210", lastMessage: "Great!", readUnreadStatus: true),
        contactsListModel(contactName: "Aakash", contactNumber: "9876543210", lastMessage: "Call You Later!", readUnreadStatus: true),
        contactsListModel(contactName: "Joe", contactNumber: "9876543210", lastMessage: "Send Again!", readUnreadStatus: true),
        contactsListModel(contactName: "Smith", contactNumber: "9876543210", lastMessage: "At 6AM!", readUnreadStatus: true),
        contactsListModel(contactName: "Harry", contactNumber: "9876543210", lastMessage: "Ok", readUnreadStatus: false),
        contactsListModel(contactName: "Steve", contactNumber: "9876543210", lastMessage: "Yes", readUnreadStatus: true),
        contactsListModel(contactName: "Walt", contactNumber: "9876543210", lastMessage: "Not Now", readUnreadStatus: true),
        contactsListModel(contactName: "Issac", contactNumber: "9876543210", lastMessage: "No", readUnreadStatus: true),
        contactsListModel(contactName: "Steven", contactNumber: "9876543210", lastMessage: "Let's See", readUnreadStatus: false),
        contactsListModel(contactName: "Craig", contactNumber: "9876543210", lastMessage: "Great!", readUnreadStatus: true),
        contactsListModel(contactName: "Unknown", contactNumber: "9876543210", lastMessage: "Call You Later!", readUnreadStatus: true),
        contactsListModel(contactName: "Joe", contactNumber: "9876543210", lastMessage: "Send Again!", readUnreadStatus: true),
        contactsListModel(contactName: "Smith", contactNumber: "9876543210", lastMessage: "At 6AM!", readUnreadStatus: true)
    ]
    
    @Published var callDetails: [MissedCallListModel] = [
        MissedCallListModel(contactName: "Tim", videoCall: true, outgoing: false),
        MissedCallListModel(contactName: "Jimmy", videoCall: false, outgoing: true),
        MissedCallListModel(contactName: "Steven", videoCall: true, outgoing: true),
        MissedCallListModel(contactName: "Craig", videoCall: false, outgoing: false),
        MissedCallListModel(contactName: "Tim", videoCall: false, outgoing: false),
        MissedCallListModel(contactName: "Joe", videoCall: false, outgoing: false),
        MissedCallListModel(contactName: "Tim", videoCall: false, outgoing: true),
        MissedCallListModel(contactName: "Harry", videoCall: false, outgoing: true),
        MissedCallListModel(contactName: "Issac", videoCall: false, outgoing: false),
        MissedCallListModel(contactName: "Craig", videoCall: true, outgoing: false),
        MissedCallListModel(contactName: "Tim", videoCall: true, outgoing: false),
        MissedCallListModel(contactName: "Jimmy", videoCall: false, outgoing: false),
        MissedCallListModel(contactName: "Tim", videoCall: true, outgoing: true)
        
    ]
    
    @Published var AllCallDetails: [AllCallListModel] = [
        AllCallListModel(contactName: "Tim", videoCall: true, outgoing: false),
        AllCallListModel(contactName: "Jimmy", videoCall: false, outgoing: true),
        AllCallListModel(contactName: "Steven", videoCall: true, outgoing: true),
        AllCallListModel(contactName: "Craig", videoCall: false, outgoing: false),
        AllCallListModel(contactName: "Tim", videoCall: false, outgoing: false),
        AllCallListModel(contactName: "Joe", videoCall: false, outgoing: false),
        AllCallListModel(contactName: "Tim", videoCall: false, outgoing: true),
        AllCallListModel(contactName: "Harry", videoCall: false, outgoing: true),
        AllCallListModel(contactName: "Tim", videoCall: true, outgoing: false),
        AllCallListModel(contactName: "Jimmy", videoCall: false, outgoing: true),
        AllCallListModel(contactName: "Steven", videoCall: true, outgoing: true),
        AllCallListModel(contactName: "Craig", videoCall: false, outgoing: false),
        AllCallListModel(contactName: "Tim", videoCall: false, outgoing: false),
        AllCallListModel(contactName: "Joe", videoCall: false, outgoing: false),
        AllCallListModel(contactName: "Tim", videoCall: false, outgoing: true),
        AllCallListModel(contactName: "Tim", videoCall: true, outgoing: false),
        AllCallListModel(contactName: "Harry", videoCall: false, outgoing: true),
        AllCallListModel(contactName: "Tim", videoCall: true, outgoing: false),
        AllCallListModel(contactName: "Jimmy", videoCall: false, outgoing: true),
        AllCallListModel(contactName: "Steven", videoCall: true, outgoing: true),
        AllCallListModel(contactName: "Craig", videoCall: false, outgoing: false),
        AllCallListModel(contactName: "Tim", videoCall: false, outgoing: false),
        AllCallListModel(contactName: "Joe", videoCall: false, outgoing: false),
        AllCallListModel(contactName: "Tim", videoCall: false, outgoing: true)
        
        
    ]
}
