import SwiftUI

// MARK: Call View
struct CallView: View {
    @State var CallTypeSelection: String = "Missed"
    @EnvironmentObject var Obj_CallList: LocalContactsClass
    
    var body: some View {
        NavigationView {
            VStack(spacing:10){
                
                SearchBarView().padding(.horizontal, 15)
                
                Picker(selection: $CallTypeSelection) {
                    Text("Missed").tag("Missed")
                    Text("All").tag("All")
                } label: {
                    Text("Call")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 120)
                
                // MARK: Switching View For "All Calls & Missed Call"
                if CallTypeSelection == "All" {
                    List{
                        ForEach(Obj_CallList.AllCallDetails, id: \.self) { index in
                            CallListView(StucutObject_AllCallDetails: index)
                        }
                        ForEach(Obj_CallList.callDetails, id: \.self) { index in
                            MissedCallListView(StucutObject_AllCallDetails: index)
                        }
                        .onDelete { IndexSet in
                            Obj_CallList.AllCallDetails.remove(atOffsets: IndexSet)
                        }
                    }.listStyle(.inset)
                }
                else if CallTypeSelection == "Missed" {
                    List{
                        ForEach(Obj_CallList.callDetails, id: \.self) { index in
                            MissedCallListView(StucutObject_AllCallDetails: index)
                        }
                        .onDelete { IndexSet in
                            Obj_CallList.AllCallDetails.remove(atOffsets: IndexSet)
                        }
                    }.listStyle(.inset)
                }
                Spacer()
            }
            
            .navigationTitle("Calls")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink {
                        Error404PageNotFound()
                    } label: {
                        Image(systemName: "phone.badge.plus")
                    }
            )
            
        }
    }
}

struct CallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView()
            .environmentObject(LocalContactsClass())
    }
}

// MARK: All Call List View
struct CallListView: View {
    var link = URL(string: "https://picsum.photos/60")
    var StucutObject_AllCallDetails: AllCallListModel
    var body: some View {
            HStack{
                AsyncImage(url: link) { Image in
                    Image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                } placeholder: {
                    Circle()
                        .frame(width: 40)
                        .foregroundColor(Color.init(uiColor: .secondarySystemBackground))
                        .overlay {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 40))
                                .foregroundColor(.gray.opacity(0.5))
                        }
                }
                
                VStack(alignment: .leading, spacing: 2){
                    Text("\(StucutObject_AllCallDetails.contactName)")
                        .font(.body)
                    HStack(spacing:1){
                        Image(systemName: StucutObject_AllCallDetails.videoCall ? "video.fill" : "phone.fill")
                            .foregroundColor(.gray)
                            .font(.callout)
                        Text( StucutObject_AllCallDetails.outgoing ? "Outgoing" : "Incoming")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
            }
    }
}

// MARK: Missed Call List View
struct MissedCallListView: View {
    var link = URL(string: "https://picsum.photos/60")
    var StucutObject_AllCallDetails: MissedCallListModel
    var body: some View {
            HStack{
                AsyncImage(url: link) { Image in
                    Image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                } placeholder: {
                    Circle()
                        .frame(width: 40)
                        .foregroundColor(Color.init(uiColor: .secondarySystemBackground))
                        .overlay {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 50))
                                .foregroundColor(.gray.opacity(0.5))
                        }
                }
                
                VStack(alignment: .leading, spacing: 2){
                    Text("\(StucutObject_AllCallDetails.contactName)")
                        .font(.body)
                        .foregroundColor(.red)
                    HStack(spacing:1){
                        Image(systemName: StucutObject_AllCallDetails.videoCall ? "video.fill" : "phone.fill")
                            .foregroundColor(.gray)
                            .font(.callout)
                        Text( StucutObject_AllCallDetails.outgoing ? "Outgoing" : "Incoming")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
            }
    }
}

struct CallListView_Previews: PreviewProvider {
    static var previews: some View {
//        MissedCallListView(StucutObject_AllCallDetails: .init(contactName: "Hello", videoCall: false, outgoing: true))
        CallListView(StucutObject_AllCallDetails: .init(contactName: "H", videoCall: false, outgoing: true))
    }
}
