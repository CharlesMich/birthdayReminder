//
//  BirthdayViewModel.swift
//  BirthdayReminder
//
//  Created by Charles Michael on 4/13/25.
//

import SwiftUI

class BirthdayViewModel: ObservableObject {
    @AppStorage("birthdays") private var storedBirthdays: [Birthday] = []
    @Published var birthdays: [Birthday] = []
    
    private func loadBirthdays() {
        birthdays = storedBirthdays
    }
    
    private func saveBirthdays() {
        storedBirthdays = birthdays
    }
    
    private func addBirthday(name: String, date: Date) {
        let newBirthday = Birthday(name: name, date: date)
        birthdays.append(newBirthday)
        saveBirthdays()
    }
    
    func updateBirthday(_ birthday: Birthday){
        if let index = birthdays.firstIndex(where: {$0.id == birthday.id}) {
            birthdays[index] = birthday
            saveBirthdays()
        }
    }
    
    func deleteBirthday(at offset: IndexSet){
        birthdays.remove(atOffsets: offset)
        saveBirthdays()
    }
}
