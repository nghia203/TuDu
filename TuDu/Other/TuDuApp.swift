//
//  TuDuApp.swift
//  TuDu
//
//  Created by Lê Mai Khanh on 09/08/2023.
//

import FirebaseCore
import SwiftUI

@main
struct TuDuApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
