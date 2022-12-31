import SwiftUI

struct ContentView: View {
    @AppStorage("userSignInfo") var userSignedIn: Bool = false

    var body: some View {
        if userSignedIn == false {
            OnBoardingScreen_WA()
        }
        else {
            TabChatView()
        }
    }
}


struct OnBoardingScreen_WA: View {
    @State var nextPageCount: Int = 0
    @State var UserMobileNumber: String = ""
    @State var validNumberALERT: Bool = false
    @FocusState var NumberConfirmation: Bool
    @State var userNameString: String = ""
    @State var profilePhotoAddingSheet: Bool = false
    
    @AppStorage("userSignInfo") var userSignedIn: Bool = false
    @AppStorage("UserMobileNumber") var local_Stored_MobileNumber: String?
    @AppStorage("userNameString") var local_Stored_UserName: String?
    
    var body: some View {
        ZStack{
            switch nextPageCount {
            case 0:
                AgreementPage1
            case 1:
                enterPhoneNumberView2
            case 2:
                verifyingView3
            case 3:
                addUserNameView
            default:
                TabChatView()
            }
        }
    }
}

// MARK: Agreement View (1)
extension OnBoardingScreen_WA {
    private var AgreementPage1: some View{
        VStack(alignment: .center, spacing: 20){
            Spacer()
            Image("WA_StartupPageArt")
                .resizable()
                .scaledToFit()
                .padding(.horizontal,20)
            
            Spacer()
            Text("Welcome to WhatsApp")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal,20)
            
            Text("Read our Privacy Policy. Tap Agree & Continue to accept the Terms of Service.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            Spacer()
            Button {
                nextPageCount += 1
            } label: {
                Text("Agree & Continue")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
    }
}

// MARK: Enter Mobile No. View (2)
extension OnBoardingScreen_WA {
    private var enterPhoneNumberView2: some View{
        NavigationView{
            VStack(alignment: .center, spacing: 0){
                Text("WhatsApp will send an SMS message to verify your phone number carrier charges may apply")
                    .multilineTextAlignment(.center)
                    .padding(35)
                    .font(.caption)
                
                HStack{
                    Text("India")
                        .padding(15)
                        .foregroundColor(.blue)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding(.horizontal, 10)
                }
                .frame(maxWidth: .infinity)
                .background(Color.init(uiColor: .secondarySystemBackground).opacity(0.5))
                .padding(.vertical, 1)
                
                HStack{
                    Text("+91 ")
                    
                    TextField("Enter Your Phone Number", text: $UserMobileNumber)
                        .focused($NumberConfirmation)
                        .keyboardType(.namePhonePad)
                }
                .padding(15)
                .background(Color.init(uiColor: .secondarySystemBackground).opacity(0.5))
                
                Spacer()
            }
            
            .navigationTitle(Text("Enter Your Phone Number"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    Button {
                        validNumberALERT = true
                    } label: {
                        Text("Done")
                            .padding(.horizontal, 10)
                    }.disabled(!checkValidNumberButtinDisabled())
            )
        }
        .alert(isPresented: $validNumberALERT) {
            Alert(
                title: Text("NUMBER CONFIRMATION \n \n +91 \(UserMobileNumber) \n"),
                message: Text("Is your phone number above correct?"),
                primaryButton: .default(Text("Edit"),action: {
                    NumberConfirmation.toggle()
                }),
                secondaryButton: .default(
                    Text("Yes"), action: {
                        local_Stored_MobileNumber = UserMobileNumber
                        nextPageCount += 1
                    })
            )
        }
    }
    
    func checkValidNumberButtinDisabled() -> Bool {
        if UserMobileNumber.count < 10 {
            return false
        }
        else if UserMobileNumber.count > 10 {
            return false
        }
        return true
    }
}

// MARK: Verifying View (3)
extension OnBoardingScreen_WA{
    private var verifyingView3: some View {
        VStack{
            Spacer()
            ProgressView()
            Text("Verifying Number")
                .font(.callout)
                .fontWeight(.light)
                .padding(20)
            Spacer()
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                nextPageCount += 1
            }
        }
    }
}

// MARK: Add User Name View (4)
extension OnBoardingScreen_WA{
    private var addUserNameView: some View{
        NavigationView{
            VStack{
                HStack{
                    Button {
                        profilePhotoAddingSheet.toggle()
                    } label: {
                        Image(systemName: "circle")
                            .font(.system(size: 60))
                            .fontWeight(.ultraLight)
                            .foregroundColor(.gray.opacity(0.3))
                            .overlay {
                                Text("add photo")
                                    .font(.caption)
                                    .padding(13)
                            }
                    }
                    Spacer()
                    
                    Text("Enter your name and add an optional profile picture")
                        .font(.caption)
                        .frame(width: UIScreen.main.bounds.width/1.5)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.light)
                }.padding(.horizontal, 30)
                
                TextField("Your Name", text: $userNameString)
                    .padding(15)
                    .background(Color.init(uiColor: .secondarySystemBackground))
                    .padding(.vertical, 20)
                Spacer()

            }.padding(.vertical, 20)
            
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    Button("Done", action: {
                        local_Stored_UserName = userNameString
                        userSignedIn = true
                        nextPageCount += 1
                    }).disabled(!checkValidUserButtonDisabled())
            )
        }
        
        .sheet(isPresented: $profilePhotoAddingSheet) {
            VStack{
                RoundedRectangle(cornerRadius: 100)
                    .frame(width: 30, height: 5)
                    .foregroundColor(.gray).opacity(0.5)
                    .padding()
                
                Spacer()
                Text("Profile Photo Unavailable ☹️")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
        }
    }
    func checkValidUserButtonDisabled() -> Bool {
        if userNameString.count < 1 {
            return false
        }
        return true
    }
}
struct OnBoardingScreen_WA_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen_WA()
    }
}
