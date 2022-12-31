import SwiftUI

// MARK: Community View
struct CommunityView: View {
    @State var flagStartCommunitySheet: Bool = false
    
    var body: some View {
        NavigationView {
            List{
                Section{
                    HStack{
                        Spacer()
                        Image("WA_Communities_Light")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width/1.5)
                        Spacer()
                    }
                }.listRowSeparator(.hidden)
                
                Section{
                    VStack(alignment:.leading){
                        Text("Introducing Communities")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.vertical, 10)
                        Text("Introducing Communities Easily organize your related groups and send announcements. \n Now, your communities, like neighborhoods or schools, can have their own space.")
                            .multilineTextAlignment(.leading)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 10)
                
                Section{
                    Button {
                        flagStartCommunitySheet.toggle()
                    } label: {
                        Text("Start a Community")
                            .foregroundColor(.blue)
                            .padding(10)
                    }
                }
            }.listStyle(.inset)
                .navigationTitle("Communities")
        }
        
// MARK: Error Sheet Pop-Up for "COMMUNITY VIEW"
        .sheet(isPresented: $flagStartCommunitySheet) {
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

// MARK: Status View
struct StatusView: View {
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
                                Text("My Status")
                                    .fontWeight(.bold)
                                
                                Text("Add to my status")
                                    .font(.callout)
                                    .fontWeight(.light)
                            }
                            Spacer()
                            Circle()
                                .frame(width: 35)
                                .foregroundColor(Color.init(uiColor: .secondarySystemBackground))
                                .overlay {
                                    Image(systemName: "camera.fill")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.blue)
                                }
                            
                            Circle()
                                .frame(width: 35)
                                .foregroundColor(Color.init(uiColor: .secondarySystemBackground))
                                .overlay {
                                    Image(systemName: "pencil")
                                        .font(.headline)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.blue)
                                }
                        }
                    }
                    
                    Section("RECENT UPDATES"){
//MARK: (ToDO) Contact Status
                    }
                }
            .listStyle(.grouped)
            
            .navigationTitle("Status")
            .navigationBarItems(
                leading:
                    NavigationLink("Privacy",
                    destination: {
                        Error404PageNotFound()
                    })
            )
        }
    }
}

//MARK: Error 404 View
struct Error404PageNotFound: View{
    var body: some View {
        VStack{
            Image("Error404")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 20)
                .frame(width: UIScreen.main.bounds.width)
            
            Text("PAGE NOT FOUND")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("pageNotFoundColor"))
                .fontDesign(.monospaced)
                .padding(.vertical, 40)
            
        }
            
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
