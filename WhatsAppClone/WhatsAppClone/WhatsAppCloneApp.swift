import SwiftUI

@main
struct WhatsAppCloneApp: App {
    @StateObject var Obj_LocalContacts: LocalContactsClass = LocalContactsClass()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Obj_LocalContacts)
        }
    }
}
