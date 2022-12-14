import SwiftUI

struct HomeView: View {
    @State var showAlert: Bool = false
    var body: some View {
        VStack(spacing:15){
            SearchBarView()
            HStack(spacing:15){
                
                NavigationLink {
                    ReminderAddedView()
                        .navigationBarItems(
                            trailing:
                        HStack(spacing: 20){
                        Button {
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        Button {
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                    })
                        .navigationTitle(Text("Today"))
                        .navigationBarTitleDisplayMode(.large)
                } label: {
                    TodayListView()
                }.accentColor(.primary)
                
                NavigationLink {
                    ScheduleView()
                        .navigationBarItems(
                            trailing:
                        HStack(spacing: 20){
                        Button {
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        Button {
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                    })
                        .navigationTitle(Text("Scheduled"))
                        .navigationBarTitleDisplayMode(.large)
                } label: {
                    ScheduleListVIew()
                }.accentColor(.primary)
                
            }
            
            HStack(spacing:15){
                
                NavigationLink {
                    ShopView()
                        .navigationBarItems(
                            trailing:
                        HStack(spacing: 20){
                        Button {
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        Button {
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                    })
                        .navigationTitle(Text("Shoping"))
                        .navigationBarTitleDisplayMode(.large)
                } label: {
                    ShopingListView()
                }.accentColor(.primary)
                
                NavigationLink {
                    CompletedRemiderVIew()
                        .navigationBarItems(
                            trailing:
                        HStack(spacing: 20){
                        Button {
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        Button {
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                    })
                        .navigationTitle(Text("Completed"))
                        .navigationBarTitleDisplayMode(.large)
                } label: {
                    CompletedListView()
                }.accentColor(.primary)
                
            }
            
            Text("My List")
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            
            NavigationLink {
                ReminderAddedView()
                    .navigationBarItems(
                        trailing:
                    HStack(spacing: 20){
                    Button {
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    Button {
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                })
                    .navigationTitle(Text("Reminders"))
                    .navigationBarTitleDisplayMode(.large)
            } label: {
                ReminderSingleRowView()
                    .accentColor(.primary)
            }
            
        }.padding(15)
        
            .alert(isPresented: $showAlert) {
                Alert(title: Text("All Features Aren't Available On Clone App 🤡🤓"))
            }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ListModelView())
            .environmentObject(ListModelView2())
            .environmentObject(ListModelView3())
    }
}
