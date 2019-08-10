//
//  Settings.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/8/10.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    @State var receive = true
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form{
                Toggle(isOn: $receive) {
                    Text("Receive notifications")
                }
                
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }
                
                Picker(selection: $selection, label: Text("Favorite course")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                
                DatePicker(selection: $date) {
                    Text("Date")
                }
                
                Section(header: Text("Email")) {
                    TextField("Your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    self.submit.toggle()
                }) {
                    Text("Submit")
                }
            }
        }
        .navigationBarTitle("Settings")
        .alert(isPresented: $submit) { () -> Alert in
            Alert(title: Text("Thanks!"),
                  message: Text("\(number) email per month\nFavorite: \(selection) Date: \(date)"))
        }
    }
}

#if DEBUG
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
#endif
