import SwiftUI

// MARK: Tab View (Chats/Status/Communities/Calls/Setting)

struct TabChatView: View {
    @State var tabSelect: Int = 3
    var body: some View {
        
        TabView(selection: $tabSelect) {
            StatusView()
                .tabItem {
                    Image(systemName: "circle.dashed")
                    Text("Status")
                }.tag(0)
            
            CallView()
                .tabItem {
                    Image(systemName: "phone")
                    Text("Calls")
                }.tag(1)
            
            CommunityView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Communities")
                }.tag(2)
            
            ChatHomeView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Chats")
                }.tag(3)
            
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(4)
        }
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        TabChatView()
            .environmentObject(LocalContactsClass())
    }
}

// MARK: Search Bar View
struct SearchBarView: View {
    @State var searchBar: String = ""
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            TextField("Search", text: $searchBar)
            Spacer()
            Image(systemName: "mic.fill")
                .foregroundColor(.secondary)
        }
        .padding(.vertical,7)
        .padding(.horizontal,10)
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(10)
    }
}
