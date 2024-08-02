//
//  ContentView.swift
//  Orbit
//
//  Created by Eric Chen on 7/15/24.
//

import SwiftUI
import SwiftData

struct CircularItemView: View {
    var label: String

    var body: some View {
        ZStack {
            Color.bgBlue
            Circle()
                .fill(Color.blue)
                .frame(width: 150, height: 150)
                .overlay(
                    Text(label)
                        .foregroundColor(.white)
                        .padding(10)
                )
                .padding(5)
        }
            
        }
        
        
}

struct OrbView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var newLabelText: String = ""

   
    var body: some View {
        ZStack{
            NavigationSplitView {
                VStack {
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                ZStack{
                                    Color.bgBlue
                                    VStack {
                                        Text("\"\(item.label)\"")
                                            .foregroundColor(.white)
                                        Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                                
                            }
                            
                        label: {
                                HStack {
                                    Spacer()
                                    CircularItemView(label: item.label)
                                    Spacer()
                                }
                                .listRowBackground(Color.bgBlue)
                            }
                            
                        }
                        .onDelete(perform: deleteItems)
                        .background(Color.bgBlue)
                    }
                    
                    .scrollContentBackground(.hidden)
                    
                    AddItemView(newLabelText: $newLabelText, addItemAction: addItem)
                        .padding()
                        .background(Color.bgBlue)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
                .background(Color.bgBlue)
            } detail: {
                Text("Select an item")
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), label: newLabelText.isEmpty ? "Default Text" : newLabelText)
            modelContext.insert(newItem)
            newLabelText = ""
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
    OrbView()
        .modelContainer(for: Item.self, inMemory: true)
}
