//
//  AddTaDaView.swift
//  QuickTaDas
//
//  Created by YAN AUNG on 12/29/21.
//

import SwiftUI

struct AddTaDaView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var toDoTitle = ""
    @FocusState var titleFocus: Bool
    
    var body: some View {
        VStack {
            TextField("Buy Cheese", text: $toDoTitle)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .focused($titleFocus)
                .submitLabel(.go)
                .onSubmit {
                    addToDo()
                }
                .padding()
                .toolbar {
                    Button(action: {
                        addToDo()
                    }) {
                        Text("Add to List")
                    }
                }
            Spacer()
        }
        // Make Keyboard to show up when title field is focus
        .onAppear {
            /* Workaround a bug with XCode older version : not needed anymore
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
             titleFocus = true
             }
             */
            titleFocus = true
        }
    }

    func addToDo() {
        let newToDo = ToDo(context: viewContext)
        newToDo.title = toDoTitle

        do {
            try viewContext.save()
            // pop back up to the previous view
            presentationMode.wrappedValue.dismiss()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
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
