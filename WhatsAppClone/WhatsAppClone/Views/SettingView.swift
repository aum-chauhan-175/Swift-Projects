import SwiftUI
// MARK: Setting View 
struct SettingView: View {
    @AppStorage("userSignInfo") var userSignedIn: Bool = false
    @AppStorage("UserMobileNumber") var local_Stored_MobileNumber: String?
    @AppStorage("userNameString") var local_Stored_UserName: String?
    
    var link = URL(string: "https://picsum.photos/60")
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    HStack(spacing:15){
                        AsyncImage(url: link) { Image in
                            Image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                        } placeholder: {
                            Circle()
                                .frame(width: 50)
                                .foregroundColor(Color.init(uiColor: .secondarySystemBackground))
                                .overlay {
                                    Image(systemName: "person.crop.circle")
                                        .font(.system(size: 50))
                                        .foregroundColor(.gray.opacity(0.5))
                                }
                        }
                        VStack(alignment: .leading, spacing: 4){
                            Text("\(local_Stored_UserName ?? "UserName")")
                                .fontWeight(.bold)
                            
                            Text("\(local_Stored_MobileNumber ?? "XXXXX-XXXXX")")
                                .font(.callout)
                                .fontWeight(.light)
                        }
                        Spacer()
                        
                        Circle()
                            .frame(width: 35)
                            .foregroundColor(Color.init(uiColor: .secondarySystemBackground))
                            .overlay {
                                Image(systemName: "qrcode")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.blue)
                            }
                    }
                }
                
                Section{
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        listSettings(iconName: "star.fill", SettingName: "Starred Messages", bgColor: .yellow)
                    }
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        listSettings(iconName: "laptopcomputer", SettingName: "Linked Devices", bgColor: .teal)
                    }
                }
                
                Section{
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        listSettings(iconName: "key.fill", SettingName: "Account", bgColor: .blue)
                    }
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        listSettings(iconName: "lock.fill", SettingName: "Privacy", bgColor: .cyan)
                    }
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        listSettings(iconName: "phone.bubble.left.fill", SettingName: "Chats", bgColor: .green)
                    }
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        listSettings(iconName: "app.badge", SettingName: "Notifications", bgColor: .red)
                    }
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        listSettings(iconName: "indianrupeesign.circle", SettingName: "Payments", bgColor: .cyan)
                    }
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        listSettings(iconName: "arrow.up.arrow.down", SettingName: "Storage and Data", bgColor: .green)
                    }
                }
                
                Section{
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        listSettings(iconName: "info", SettingName: "Help", bgColor: .blue)
                    }
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        listSettings(iconName: "heart.fill", SettingName: "Tell a Friend", bgColor: .pink)
                    }
                }
                
                Section{
                    Button {
                        userSignedIn = false
                    } label: {
                        listSettings(iconName: "rectangle.portrait.and.arrow.right", SettingName: "Sign Out", bgColor: .red)
                    }
                }
                
            }.listStyle(.grouped)
                .navigationTitle("Settings")
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

// MARK: Single List View Stucture for Setting (List/Section View)
struct listSettings:View{
    var iconName: String
    var SettingName: String
    var bgColor: Color
    var body: some View{
        HStack{
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 30, height: 30)
                .foregroundColor(bgColor)
                .overlay {
                    Image(systemName: iconName)
                        .foregroundColor(.white)
                        .foregroundColor(.blue)
                }
            
            Text("\(SettingName)")
                .font(.body)
            Spacer()
        }
    }
}


