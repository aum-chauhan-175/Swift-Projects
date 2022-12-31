import SwiftUI

// MARK: Main Chat View
struct ChatHomeView: View {
    @State var ContactList_Sheet: Bool = false
    @State var CameraError_Sheet: Bool = false
    @EnvironmentObject var Obj_LocalContactChatView : LocalContactsClass
    var body: some View {
        NavigationView {
            List{
                SearchBarView()
                    .listRowSeparator(.hidden)
                ForEach(Obj_LocalContactChatView.contactsDetailArray, id: \.self) { index in
                    NavigationLink {
                        PersonalChat_View(lastChatVar: index)
                            // MARK: Personal Chat View Top Bar
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarItems(
                                leading:
                                    HStack{
                                        Image(systemName: "person.circle.fill")
                                            .font(.title2)
                                            .foregroundColor(.gray)
                                        VStack(alignment: .leading){
                                            Text("\(index.contactName)")
                                                .fontWeight(.bold)
                                            Text("\(index.contactNumber)")
                                                .font(.caption)
                                        }
                                    }
                                ,trailing:
                                    HStack{
                                        Image(systemName: "video")
                                            .foregroundColor(.blue)
                                        
                                        Image(systemName: "phone")
                                            .foregroundColor(.blue)
                                    }
                            )
                        
                    } label: {
                        ChatContactListView(ChatContactList: index)
                    }
                    
                }
                // MARK: Chat List Delete and Move Closures
                .onDelete(perform: { IndexSet in
                    Obj_LocalContactChatView.contactsDetailArray.remove(atOffsets: IndexSet)
                })
                .onMove { IndexSet, Int in
                    Obj_LocalContactChatView.contactsDetailArray.move(fromOffsets: IndexSet, toOffset: Int)
                }
                
            }.listStyle(.inset)
            
                .navigationTitle("Chats")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        HStack{
                            Button(action: {
                                CameraError_Sheet.toggle()
                            }, label: {
                                Image(systemName: "camera")
                            })
                            
                            Button(action: {
                                ContactList_Sheet.toggle()
                            }, label: {
                                Image(systemName: "square.and.pencil")
                            })
                        }
                )
        }
        
        // MARK: Sheet For Adding New Contacts
        .sheet(isPresented: $ContactList_Sheet) {
            ContactListSheetViewModels()
        }
        
        .sheet(isPresented: $CameraError_Sheet) {
            VStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 30, height: 4)
                    .foregroundColor(.gray)
                    .padding()
                Spacer()
                Error404PageNotFound()
                Spacer()
            }
        }
    }
}
   
// MARK: (Unicast) Personal Chats View
struct PersonalChat_View: View {
    @State var chattextField: String = ""
    var lastChatVar: contactsListModel
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue.opacity(0.5), .purple.opacity(0.5)], startPoint: .top, endPoint: .bottom)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 35)
                        .foregroundColor(Color("ChatBubbleColor"))
                        .overlay{
                            HStack(){
                                Text("\(lastChatVar.lastMessage)")
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 10)
                                Spacer()
                                VStack{
                                    Spacer()
                                    Text("09:41")
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                        .padding(5)
                                }
                            }
                        }
                }.padding(10)
                
                HStack{
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                        .padding(.vertical, 10)
                        .font(.title2)
                    
                    TextField(" ", text: $chattextField)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 10)
                        .background(Color.init(uiColor: .secondarySystemBackground))
                        .cornerRadius(100)
                        .padding(.vertical, 10)
                    
                    Image(systemName: "camera")
                        .foregroundColor(.blue)
                        .padding(.vertical, 10)
                        .font(.title2)
                    
                    Image(systemName: "mic")
                        .foregroundColor(.blue)
                        .padding(.vertical, 10)
                        .font(.title2)
                }
                .padding(.horizontal, 10)
                .background(.thickMaterial)
            }
        }
    }
}


// MARK: Single Row View -> (Contact Name in Chat View)
struct ChatContactListView: View {
    var link = URL(string: "https://picsum.photos/60")
    var ChatContactList: contactsListModel
    var body: some View {
        HStack{
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
                
            }.padding(.horizontal, 7)
            
            VStack(alignment: .leading){
                Text("\(ChatContactList.contactName)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.vertical, 1)
                Text("\(ChatContactList.lastMessage)")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            Spacer()
            Circle()
                .frame(width: 17)
                .foregroundColor(ChatContactList.readUnreadStatus ? .blue : .white.opacity(0.0))
        }
    }
}

// MARK: Single Row View -> (Add New Contact Sheet)
struct ContactListView: View{
    var link = URL(string: "https://picsum.photos/60")
    var ChatContactList: contactsListModel
    var body: some View{
        HStack{
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
            .padding(.horizontal, 7)
            
            VStack(alignment: .leading){
                Text("\(ChatContactList.contactName)")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("\(ChatContactList.contactNumber)")
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            Spacer()
        }
    }
}

struct ChatCOntactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView(ChatContactList: .init(contactName: "NAme", contactNumber: "876543234", lastMessage: "Okie", readUnreadStatus: false))
    }
}

// MARK: Sheet View -> (Add New Contact Sheet)
struct ContactListSheetViewModels: View{
    @Environment(\.presentationMode) var DismissBtn
    @EnvironmentObject var Obj_LocalContactChatView : LocalContactsClass
    var body: some View {
        VStack{
            HStack{
                Text("")
                Spacer()
                Text("New Chat")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
                Button {
                    DismissBtn.wrappedValue.dismiss()
                } label: {
                    Circle()
                        .frame(width: 25)
                        .foregroundColor(Color.init(uiColor: .secondarySystemBackground))
                        .overlay {
                            Image(systemName: "xmark")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                }
            }.padding(.horizontal,20)
            List{
                SearchBarView().listRowSeparator(.hidden)
                
                ForEach(Obj_LocalContactChatView.contactsDetailArray, id: \.self) { index in
                    ContactListView(ChatContactList: index)
                }
            }.listStyle(.inset)
            
        }
    }
}



struct ChatHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHomeView()
            .environmentObject(LocalContactsClass())
    }
}
