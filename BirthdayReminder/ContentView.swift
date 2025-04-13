//
//  ContentView.swift
//  BirthdayReminder
//
//  Created by Charles Michael on 4/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BirthdayViewModel()
    @State private var showingAddBirthday = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.birthdays){ birthday in
                    NavigationLink(destination: EditBirthdayView(viewModel: viewModel, birthday: birthday)) {
                        VStack (alignment: .leading){
                            Text(birthday.name)
                                .font(.headline)
                            Text("Next birthday in 10 days")
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteBirthday)
            }
            .navigationTitle("Birthdays")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showingAddBirthday = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct AddBirthdayView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: BirthdayViewModel
    @State private var name = ""
    @State private var date = Date()
    
    var body: some View {
        NavigationStack (content: {
            Form {
                TextField("Name", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
        }
            
            .navigationTitle("Add Birthday")
            .toolbar {
                ToolbarItem(placement: .confirmationAction, content: {
                    Button("Save"){
                        viewModel.a
                    }
                })
            }
        })
    }
}

struct EditBirthdayView: View {
    @ObservedObject var viewModel: BirthdayViewModel
    @State var birthday: Birthday
    var body: some View {
        Text("Edit Birthday")
    }
}

#Preview {
    ContentView()
}
