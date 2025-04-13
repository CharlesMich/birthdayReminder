//
//  Birthday.swift
//  BirthdayReminder
//
//  Created by Charles Michael on 4/12/25.
//

import Foundation

struct Birthday: Codable, Identifiable {
    var id = UUID()
    var name: String
    var date: Date
}
