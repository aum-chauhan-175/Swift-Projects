import SwiftUI

struct ReminderAddedView: View {
    @State var sheetToogle: Bool = false
    @EnvironmentObject var PublicObj: ListModelView
    var body: some View {
        List{
            ForEach(PublicObj.ReminderArrays) { items in
                SIngleListRow(reminderVar: items)
                    .onTapGesture {
                        withAnimation {
                            PublicObj.updateRemider(i: items)
                        }
                    }
            }
            
            .onDelete(perform: PublicObj.DeleteReminder)
            .onMove(perform: PublicObj.MoveItem)
        }.listStyle(.plain)
        
            .safeAreaInset(edge: .bottom) {
                HStack{
                    Button { sheetToogle.toggle() }
                label: { NewRemiderButtonView() }
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial.opacity(0.5))
            }
            .sheet(isPresented: $sheetToogle) {
                AddReminderView()
            }
    }
}

struct ScheduleView: View {
    @State var sheetToogle: Bool = false
    @EnvironmentObject var PublicObj2: ListModelView2
    var body: some View {
        List{
            ForEach(PublicObj2.ScheduleReminderArrays) { items in
                SIngleListRow(reminderVar: items)
                    .onTapGesture {
                        withAnimation {
                            PublicObj2.ScheduleupdateRemider(i: items)
                        }
                    }
            }
            
            .onDelete(perform: PublicObj2.ScheduleDeleteReminder)
            .onMove(perform: PublicObj2.ScheduleMoveItem)
        }.listStyle(.plain)
        
            .safeAreaInset(edge: .bottom) {
                HStack{
                    Button { sheetToogle.toggle() }
                label: { NewRemiderButtonView() }
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial.opacity(0.5))
            }
            .sheet(isPresented: $sheetToogle) {
                AddReminderView2()
            }
    }
}


struct ShopView: View {
    @State var sheetToogle: Bool = false
    @EnvironmentObject var PublicObj3: ListModelView3
    var body: some View {
        List{
            ForEach(PublicObj3.ShopReminderArrays) { items in
                SIngleListRow(reminderVar: items)
                    .onTapGesture {
                        withAnimation {
                            PublicObj3.ShopupdateRemider(i: items)
                        }
                    }
            }
            
            .onDelete(perform: PublicObj3.ShopDeleteReminder)
            .onMove(perform: PublicObj3.ShopMoveItem)
        }.listStyle(.plain)
        
            .safeAreaInset(edge: .bottom) {
                HStack{
                    Button { sheetToogle.toggle() }
                label: { NewRemiderButtonView() }
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial.opacity(0.5))
            }
            .sheet(isPresented: $sheetToogle) {
                AddReminderView3()
            }
    }
}


struct CompletedRemiderVIew: View {
    
    @EnvironmentObject var publicObj: ListModelView
    var body: some View {
        List{
            ForEach(publicObj.CompletedArrayList) { item in
                CompletedRemiderSingleListRow(dsv: item)
            }
        }.listStyle(.plain)
        
    }
}

struct CompletedRemiderSingleListRow: View {
    var dsv: newReminderStructure
    var body: some View {
        Text(dsv.ReminderTitle)
    }}

struct ReminderAddedView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderAddedView()
            .environmentObject(ListModelView())
    }
}

