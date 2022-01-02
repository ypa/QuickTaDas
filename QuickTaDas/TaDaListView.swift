//
//  TaDaListView.swift
//  QuickTaDas
//
//  Created by YAN AUNG on 12/29/21.
//

import SwiftUI

struct TaDaListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ToDo.title, ascending: true)], animation: .default)
    private var toDos: FetchedResults<ToDo>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(toDos) { listedToDo in
                    NavigationLink(destination: Text(listedToDo.title!).font(.largeTitle).padding()) {
                        Text(listedToDo.title!)
                            .lineLimit(1)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Quick ToDos")
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: AddTaDaView()) {
                        Label("Add Item", systemImage: "plus.circle.fill")
                    }
                }
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { toDos[$0] }.forEach(viewContext.delete)
            try? viewContext.save()
        }
    }
}

struct TaDaListView_Previews: PreviewProvider {
    static var previews: some View {
        TaDaListView()
    }
}
