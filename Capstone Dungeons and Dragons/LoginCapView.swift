//
//  ContentView.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 1/28/23.
//


import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore


//Fix commits
let loginViewBackgroundGradient = LinearGradient(
    colors: [Color("StartingGradientRed"), Color("EndingGradientRed")],
    startPoint: .top, endPoint: .bottom)


struct LoginView: View {
    

    
    @EnvironmentObject var userVM: UserViewModel
    @State var user: User

    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var buttonsDisabled = true
    @State private var presentSheet = false

    let db = Firestore.firestore()
    
    var body: some View{
        ZStack{
            loginViewBackgroundGradient
                .ignoresSafeArea()
            
            VStack {
                Image("DND_Char")
                    .resizable()
                    .scaledToFit()
                Group {
                    TextField("Email", text: $user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .submitLabel(.next)

                        .onChange(of: user.email) { _ in
                            enableButtons()
                        }
                    
                    SecureField("Password", text: $user.password)
                        .textInputAutocapitalization(.never)
                        .submitLabel(.done)

                        .onChange(of: user.password) { _ in
                            enableButtons()
                        }
                }
                .textFieldStyle(.roundedBorder)
                .overlay{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                }
                .padding(.horizontal)
                
                HStack {
                    Button {

                        register()

                    } label: {
                        Text("Sign Up")
                            .foregroundColor(Color.black)
                    }
                    .padding(.trailing)
                    Button {

                        login()

                    } label: {
                        Text("Log In")
                            .foregroundColor(Color.black)
                    }
                    .padding(.leading)
                    
                }
                .disabled(buttonsDisabled)
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .padding(.top)
                
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {}
            }
            
            .onAppear{
                if Auth.auth().currentUser != nil {
                    print("Login Success!")
                    presentSheet = true
                }
            }
            .fullScreenCover(isPresented: $presentSheet) {
                HomePostLogin()
            }
        }
        
       
    }
    
    func enableButtons() {
        let emailIsValid = user.email.count >= 6 && user.email.contains("@")
        let passwordIsValid = user.password.count >= 6
        buttonsDisabled = !(emailIsValid && passwordIsValid)
    }
    
    func register() {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, error in
            if let error = error {
                print("REGISTRATION ERROR: \(error.localizedDescription)")
                alertMessage = "REGISTRATION ERROR: \(error.localizedDescription)"
                showingAlert = true
            } else {
                print("Registration success!")
                let id = result?.user.uid
                db.collection("users").document(id!).setData([
                    "email": user.email,
                    "password": user.password
                ])
                
                
                presentSheet = true
            }
        }
    }
    func login() {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, error in
            if let error = error {
                print("LOGIN ERROR: \(error.localizedDescription)")
                alertMessage = "LOGIN ERROR: \(error.localizedDescription)"
                showingAlert = true
            } else {
                print("Login success!")
                let id = result?.user.uid
                print(id!)
                db.collection("users").document(id!).setData([
                    "email": user.email,
                    "password": user.password
                ])
                presentSheet = true
                
            }
        }
    }
}
    
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(user: User())
            .environmentObject(UserViewModel())
    }
}

