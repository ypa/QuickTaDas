//
//  AddTaDaView.swift
//  QuickTaDas
//
//  Created by YAN AUNG on 12/29/21.
//

import SwiftUI

struct AddTaDaView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var toDoTitle = ""
    
    var body: some View {
        TextField("Buy Cheese", text: $toDoTitle)
            .padding()
            .toolbar {
                Button(action: {
                    
                    let newToDo = ToDo(context: viewContext)
                    newToDo.title = toDoTitle
                    
                    do {
                        try viewContext.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                    
                }) {
                    Text("Add to List")
                }
            }
    }
}

struct AddTaDaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaDaView()
        }
    }
}
