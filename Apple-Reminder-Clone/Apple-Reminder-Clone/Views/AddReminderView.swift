import SwiftUI

struct AddReminderView: View {
    @State var addNewReminder: String = ""
    @Environment(\.presentationMode) var cancelButtonAction
    @EnvironmentObject var PublicObj: ListModelView
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Button("Cancel") {
                    cancelButtonAction.wrappedValue.dismiss()
                }
                Spacer()
                Button("Add") {
                    AddButtonPressed()
                }
                .disabled(!CheckEmpty())
            }.padding(.bottom, 30)
            
            TextField("Title", text: $addNewReminder)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(15)
            
            Spacer()
        }.padding(15)
    }
    
    func AddButtonPressed(){
        PublicObj.addItem(title: addNewReminder)
        cancelButtonAction.wrappedValue.dismiss()
    }
    
    func CheckEmpty() -> Bool{
        if addNewReminder.count < 2{
            return false
        }
            return true
    }
}

struct AddReminderView2: View {
    @State var addNewReminder2: String = ""
    @Environment(\.presentationMode) var cancelButtonAction2
    @EnvironmentObject var PublicObj2: ListModelView2
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Button("Cancel") {
                    cancelButtonAction2.wrappedValue.dismiss()
                }
                Spacer()
                Button("Add") {
                    AddButtonPressed2()
                }
                .disabled(!CheckEmpty2())
            }.padding(.bottom, 30)
            
            TextField("Title", text: $addNewReminder2)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(15)
            
            Spacer()
        }.padding(15)
    }
    
    func AddButtonPressed2(){
        PublicObj2.ScheduleaddItem(title: addNewReminder2)
        cancelButtonAction2.wrappedValue.dismiss()
    }
    
    func CheckEmpty2() -> Bool{
        if addNewReminder2.count < 2{
            return false
        }
            return true
    }
}


struct AddReminderView3: View {
    @State var addNewReminder3: String = ""
    @Environment(\.presentationMode) var cancelButtonAction3
    @EnvironmentObject var PublicObj3: ListModelView3
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Button("Cancel") {
                    cancelButtonAction3.wrappedValue.dismiss()
                }
                Spacer()
                Button("Add") {
                    AddButtonPressed3()
                }
                .disabled(!CheckEmpty3())
            }.padding(.bottom, 30)
            
            TextField("Title", text: $addNewReminder3)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(15)
            
            Spacer()
        }.padding(15)
    }
    
    func AddButtonPressed3(){
        PublicObj3.ShopaddItem(title: addNewReminder3)
        cancelButtonAction3.wrappedValue.dismiss()
    }
    
    func CheckEmpty3() -> Bool{
        if addNewReminder3.count < 2{
            return false
        }
            return true
    }
}


struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
            .environmentObject(ListModelView())
            .environmentObject(ListModelView2())
    }
}
