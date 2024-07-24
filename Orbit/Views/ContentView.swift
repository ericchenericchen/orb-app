//
//  ContentView.swift
//  Orbit
//
//  Created by Eric Chen on 7/15/24.
//

import SwiftUI
import SwiftData

// Custom view for circular item
struct CircularItemView: View {
    var timestamp: Date

    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 150, height: 150)
            .overlay(
                Text(timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    .foregroundColor(.white)
                    .padding(10)
            )
            .padding(5)
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        HStack {
                            Spacer()
                            CircularItemView(timestamp: item.timestamp)
                            Spacer()
                        }
                        .listRowBackground(Color.clear) // Make row background clear
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
