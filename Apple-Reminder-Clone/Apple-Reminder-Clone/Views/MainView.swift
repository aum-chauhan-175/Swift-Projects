import SwiftUI

struct MainView: View {
    @State var sheetToogle: Bool = false
    @State var showAlert: Bool = false
    @EnvironmentObject var PublicObj: ListModelView
    var body: some View {
        NavigationView {
            ScrollView{
                HomeView()
            }
            
            .safeAreaInset(edge: .bottom) {
                HStack{
                    Button { sheetToogle.toggle() }
                label: { NewRemiderButtonView() }
                    
                    Spacer()
                    
                    Button {  showAlert.toggle() }
                label: { BottomTabView2() }
                }
                .padding()
                .background(.ultraThinMaterial.opacity(0.5))
            }
            
            .navigationBarItems(trailing:
                    Button{ showAlert.toggle() }
                    label: { Image(systemName: "ellipsis.circle") }
            )
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $sheetToogle) {
            AddReminderView()
        }
        
        .alert(isPresented: $showAlert) {
            Alert(title: Text("All Features Aren't Available On Clone App 🤡🤓"))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ListModelView())
            .environmentObject(ListModelView2())
            .environmentObject(ListModelView3())
    }
}

