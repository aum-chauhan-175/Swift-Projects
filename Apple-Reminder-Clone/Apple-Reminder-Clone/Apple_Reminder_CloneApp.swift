import SwiftUI

@main
struct Apple_Reminders_CloneApp: App {
    @StateObject var PublicObj: ListModelView = ListModelView()
    @StateObject var PublicObj2: ListModelView2 = ListModelView2()
    @StateObject var PublicObj3: ListModelView3 = ListModelView3()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(PublicObj)
                .environmentObject(PublicObj2)
                .environmentObject(PublicObj3)
        }
    }
}
