import SwiftUI


struct MessagingView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalChat_View(lastChatVar: .init(contactName: "Aum", contactNumber: "0987654322", lastMessage: "Ok", readUnreadStatus:false))
    }
}
