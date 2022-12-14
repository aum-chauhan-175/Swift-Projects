import Foundation
class ListModelView: ObservableObject{
    @Published var ReminderArrays: [newReminderStructure] = [] {
        didSet{
            saveReminders()
        }
    }
    
    @Published var CompletedArrayList: [newReminderStructure] = []
    
    let DataKey: String = "REMINDERS_KEY"
    
    init(){
        LoadData()
    }
    
    func LoadData(){
        guard
            let data = UserDefaults.standard.data(forKey: DataKey),
            let decode = try? JSONDecoder().decode([newReminderStructure].self, from: data)
        else { return }
        
        self.ReminderArrays = decode
    }
    
    func DeleteReminder(i: IndexSet){
        ReminderArrays.remove(atOffsets: i)
    }
    
    func MoveItem(iS: IndexSet, i : Int){
        ReminderArrays.move(fromOffsets: iS, toOffset: i)
    }
    
    func addItem(title: String){
        let addR = newReminderStructure(ReminderTitle: title, isFinish: false)
        ReminderArrays.append(addR)
        print("Added")
    }
    
    func updateRemider(i: newReminderStructure){
        if let index = ReminderArrays.firstIndex(where: {$0.id == i.id }){
            ReminderArrays[index] = newReminderStructure(ReminderTitle: i.ReminderTitle, isFinish: !i.isFinish)
            
            if (ReminderArrays[index].isFinish == true){
                CompletedArrayList.append(ReminderArrays[index])
            }
        }
    }
    
    func saveReminders(){
        if let encoded = try? JSONEncoder().encode(ReminderArrays){
            UserDefaults.standard.set(encoded, forKey: DataKey)
        }
    }
    
}

// Scheduled View
class ListModelView2: ObservableObject{
    @Published var ScheduleReminderArrays: [newReminderStructure] = [] {
        didSet{
            SchedulesaveReminders()
        }
    }
    
    @Published var ScheduleCompletedArrayList: [newReminderStructure] = []
    
    let ScheduleDataKey: String = "REMINDERS_KEY"
    
    init(){
        ScheduleLoadData()
    }
    
    func ScheduleLoadData(){
        guard
            let data = UserDefaults.standard.data(forKey: ScheduleDataKey),
            let decode = try? JSONDecoder().decode([newReminderStructure].self, from: data)
        else { return }
        
        self.ScheduleReminderArrays = decode
    }
    
    func ScheduleDeleteReminder(i: IndexSet){
        ScheduleReminderArrays.remove(atOffsets: i)
    }
    
    func ScheduleMoveItem(iS: IndexSet, i : Int){
        ScheduleReminderArrays.move(fromOffsets: iS, toOffset: i)
    }
    
    func ScheduleaddItem(title: String){
        let addR = newReminderStructure(ReminderTitle: title, isFinish: false)
        ScheduleReminderArrays.append(addR)
        print("Added")
    }
    
    func ScheduleupdateRemider(i: newReminderStructure){
        if let index = ScheduleReminderArrays.firstIndex(where: {$0.id == i.id }){
            ScheduleReminderArrays[index] = newReminderStructure(ReminderTitle: i.ReminderTitle, isFinish: !i.isFinish)
            
            if (ScheduleReminderArrays[index].isFinish == true){
                ScheduleCompletedArrayList.append(ScheduleReminderArrays[index])
            }
        }
    }
    
    func SchedulesaveReminders(){
        if let encoded = try? JSONEncoder().encode(ScheduleReminderArrays){
            UserDefaults.standard.set(encoded, forKey: ScheduleDataKey)
        }
    }
    
}

// Shopping View
class ListModelView3: ObservableObject{
    @Published var ShopReminderArrays: [newReminderStructure] = [] {
        didSet{
            ShopsaveReminders()
        }
    }
    
    @Published var ShopCompletedArrayList: [newReminderStructure] = []
    
    let ShopDataKey: String = "REMINDERS_KEY"
    
    init(){
        ShopLoadData()
    }
    
    func ShopLoadData(){
        guard
            let data = UserDefaults.standard.data(forKey: ShopDataKey),
            let decode = try? JSONDecoder().decode([newReminderStructure].self, from: data)
        else { return }
        
        self.ShopReminderArrays = decode
    }
    
    func ShopDeleteReminder(i: IndexSet){
        ShopReminderArrays.remove(atOffsets: i)
    }
    
    func ShopMoveItem(iS: IndexSet, i : Int){
        ShopReminderArrays.move(fromOffsets: iS, toOffset: i)
    }
    
    func ShopaddItem(title: String){
        let addR = newReminderStructure(ReminderTitle: title, isFinish: false)
        ShopReminderArrays.append(addR)
        print("Added")
    }
    
    func ShopupdateRemider(i: newReminderStructure){
        if let index = ShopReminderArrays.firstIndex(where: {$0.id == i.id }){
            ShopReminderArrays[index] = newReminderStructure(ReminderTitle: i.ReminderTitle, isFinish: !i.isFinish)
            
            if (ShopReminderArrays[index].isFinish == true){
                ShopCompletedArrayList.append(ShopReminderArrays[index])
            }
        }
    }
    
    func ShopsaveReminders(){
        if let encoded = try? JSONEncoder().encode(ShopReminderArrays){
            UserDefaults.standard.set(encoded, forKey: ShopDataKey)
        }
    }
    
}

