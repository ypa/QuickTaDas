//
//  QuickTaDasApp.swift
//  QuickTaDas
//
//  Created by YAN AUNG on 12/25/21.
//

import SwiftUI

@main
struct QuickTaDasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaDaListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
