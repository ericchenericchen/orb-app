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
    @State private var newLabelTitle: String = ""
    @State private var isAddOrbViewVisible: Bool = true
    @State private var isAddCollectionViewVisible: Bool = true

    var body: some View {
        NavigationSplitView {
            ZStack {
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            ZStack {
                                Color.bgBlue
                                VStack {
                                    Text("\"\(item.label)\"")
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                    Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                }
                            }
                            .background(Color.bgBlue)
                        } label: {
                            HStack {
                                Spacer()
                                CircularItemView(label: String(item.label.prefix(40)) + (item.label.count > 40 ? "..." : ""))
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                    .listRowBackground(Color.bgBlue)
                }
                .scrollContentBackground(.hidden)
                if isAddOrbViewVisible {
                    VStack {
                        Spacer()
                        AddOrbView(newLabelText: $newLabelText, newLabelTitle: $newLabelTitle, addItemAction: addItem)
                            .opacity(0.9)
                    }
                    .frame(alignment: .bottom)
                }
                if isAddCollectionViewVisible {
                    VStack {
                        Spacer()
                        AddCollectionView(newLabelText: $newLabelText, newLabelTitle: $newLabelTitle, addItemAction: addItem)
                            .opacity(0.9)
                    }
                    .frame(alignment: .bottom)
                }

                
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            isAddOrbViewVisible.toggle()
                        }) {
                            Text(isAddOrbViewVisible ? "Hide Add Orb" : "Show Add Orb")
                        }
                        Button(action: {
                            isAddCollectionViewVisible.toggle()
                        }) {
                            Text(isAddCollectionViewVisible ? "Hide Add Collection" : "Show Add Collection")
                        }
                        
                        EditButton()
                    }
                }
            }
            .background(Color.bgBlue)
        } detail: {
            Text("Select an item")
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
