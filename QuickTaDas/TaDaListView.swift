//
//  TaDaListView.swift
//  QuickTaDas
//
//  Created by YAN AUNG on 12/29/21.
//

import SwiftUI

struct TaDaListView: View {
    var body: some View {
        NavigationView {
            Text("TaDa List View")
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
}

struct TaDaListView_Previews: PreviewProvider {
    static var previews: some View {
        TaDaListView()
    }
}
