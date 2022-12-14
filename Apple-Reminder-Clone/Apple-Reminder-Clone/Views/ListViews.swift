import SwiftUI

struct ListViews: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct TodayListView: View {
    @EnvironmentObject var PublicObj: ListModelView
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Image(systemName: "calendar")
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(width: 35, height: 35)
                    .background(.blue)
                    .cornerRadius(1000)
                Spacer()
                Text("\(PublicObj.ReminderArrays.count)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            Text("Today")
                .foregroundColor(.secondary)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color.init(uiColor: .secondarySystemBackground))
        .cornerRadius(15)
    }
}

struct CompletedListView: View {
    @EnvironmentObject var PublicObj: ListModelView
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(width: 35, height: 35)
                    .background(.gray)
                    .cornerRadius(1000)
                Spacer()
                Text("\(PublicObj.CompletedArrayList.count)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            Text("Completed")
                .foregroundColor(.secondary)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color.init(uiColor: .secondarySystemBackground))
        .cornerRadius(15)
    }
}

struct ScheduleListVIew: View {
    @EnvironmentObject var PublicObj2: ListModelView2
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Image(systemName: "calendar")
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(width: 35, height: 35)
                    .background(.red)
                    .cornerRadius(1000)
                Spacer()
                Text("\(PublicObj2.ScheduleReminderArrays.count)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            Text("Scheduled")
                .foregroundColor(.secondary)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color.init(uiColor: .secondarySystemBackground))
        .cornerRadius(15)
    }
}

struct ShopingListView: View {
    @EnvironmentObject var PublicObj3: ListModelView3

    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Image(systemName: "bag.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(width: 35, height: 35)
                    .background(.green)
                    .cornerRadius(1000)
                Spacer()
                Text("\(PublicObj3.ShopReminderArrays.count)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            Text("Shoping")
                .foregroundColor(.secondary)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color.init(uiColor: .secondarySystemBackground))
        .cornerRadius(15)
    }
}



struct ReminderSingleRowView: View {
    @EnvironmentObject var PublicObj: ListModelView
    var body: some View {
        HStack(spacing: 10){
            Image(systemName: "person.badge.shield.checkmark.fill")
                .foregroundColor(.white)
                .frame(width: 35, height: 35)
                .background(.purple)
                .cornerRadius(1000)
            
            Text("Reminders")
                .font(.title3)
            
            Spacer()
            
            Text("\(PublicObj.ReminderArrays.count)")
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
            
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 7)
        .background(Color.init(uiColor: .secondarySystemBackground))
        .cornerRadius(15)
    }
}


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
        .padding(.vertical,10)
        .padding(.horizontal,10)
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(15)
    }
}

struct NewRemiderButtonView: View {
    var body: some View {
        HStack{
            Image(systemName: "plus.circle.fill")
                .font(.headline)
                .foregroundColor(.accentColor)
            Text("New Remider")
                .font(.headline)
                .foregroundColor(.accentColor)
        }
    }
}


struct BottomTabView2: View {
    var body: some View {
        Text("Add List")
            .font(.headline)
            .foregroundColor(.accentColor)
    }
}

struct SIngleListRow: View {
    var reminderVar: newReminderStructure
    var body: some View {
        HStack{
            Image(systemName: reminderVar.isFinish ? "circle.circle.fill" : "circle")
                .foregroundColor(.gray)
                .font(.title3)
            
            Text(reminderVar.ReminderTitle)
        }
    }
}

struct ListViews_Previews: PreviewProvider {
    static var previews: some View {
        //        ListViews()
        NewRemiderButtonView()
    }
}
