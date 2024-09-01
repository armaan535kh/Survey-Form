//
//  ContentView.swift
//  Survey Form
//
//  Created by Armaan Khan  on 27/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var age : Int = 0
    @State private var selectedOption = ""
    @State private var selectedShare = ""
    @FocusState private var isFocused: Bool
    @State private var comment = ""
    
    let options = ["Beginner", "Intermediate", "Advanced", "Expert"]
    let shares = ["Yes", "No", "Maybe"]
    
    @State private var isChecked: [Bool] = [false, false, false, false, false, false, false, false, false, false]
    
    let programmingLanguages = ["Java", "Python", "Swift", "JavaScript", "C++", "C#", "Ruby", "Go", "Rust", "PHP"]
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Name") {
                    TextField("Ente your name", text: $name)
                }
                
                Section("Email") {
                    TextField("Enter your email", text: $email)
                }
                
                Section("Age") {
                    TextField("Enter your age", value: $age, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .keyboardType(.numberPad)
                        .keyboardType(.numberPad)
                    
                }
                
                Section("What option best describe you") {
                    Picker(" ", selection: $selectedOption) {
                        ForEach(options, id: \.self) {
                            Text($0)
                        }
                    }
                    .labelsHidden()
                    
                    
                }
                
                Section("Would you recommand geeksforgeeks to your friend") {
                    Picker(" ", selection: $selectedShare) {
                        ForEach(shares, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                    
                }
                
                Section("Langugae and Frameworks known (check all that apply)") {
                    List {
                        ForEach(programmingLanguages.indices, id: \.self) { index in
                            HStack {
                                Text(programmingLanguages[index])
                                Spacer()
                                Image(systemName: isChecked[index] ? "checkmark" : "square")
                                    .onTapGesture {
                                        isChecked[index].toggle()
                                    }
                            }
                            
                        }
                    }
                }
                
                Section("Any comment or suggestion") {
                    TextEditor(text: $comment)
                        .frame(minHeight: 100)
                        .border(Color.gray)
                        
                    
                }
                
                Button("Save") {
                    print("The data is sasved")
                }
                
            }
            .navigationTitle("Survey Form")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    ContentView()
}
