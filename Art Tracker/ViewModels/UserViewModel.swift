//
//  UserViewModel.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import Foundation
import SwiftUI

final class UserViewModel: ObservableObject {
    @AppStorage("userName") var userNameStorage: String?
    @Published var userName = ""
    @Published var isPresentUser = false
    init () {
        userName = userNameStorage ?? ""
    }
    func saveName() {
        userNameStorage = userName
    }
}
