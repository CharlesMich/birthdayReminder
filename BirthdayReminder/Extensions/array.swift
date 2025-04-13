//
//  array.swift
//  BirthdayReminder
//
//  Created by Charles Michael on 4/12/25.
//

import Foundation

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String){
        
        guard let data = rawValue.data(using: .utf8) else {
            return nil
        }
        guard let result = try? JSONDecoder().decode([Element].self, from: data) else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self) else {
            return "[]"
        }
        return String(data: data, encoding: .utf8) ?? "[]"
    }
}

