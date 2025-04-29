//
//  ContentView.swift
//  SwiftDataBootcamp
//
//  Created by Gina Saviano on 28/04/25.
//

/* Here we need to create an @Environment variable to create the context that looks into the container.
 We need to specify the PATH to the context.
*/

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context //reference for this view to the modelContext
    
    @Query private var items: [DataItem] //this query is going to retrieve all the instances from our local data store into an array
    
    var body: some View {
        VStack {
            Text("Tap this button to add data")
            Button("Add item") {
                addItem()
            }
            
            List {
                ForEach(items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Button {
                            updateItem(item)
                        } label: {
                            Image(systemName: "arrow.2.circlepath")
                        }

                    }
                }
                .onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
            }
        }
        .padding()
    }
    
    //MARK: - FUNCTION AREA
    func addItem() {
        //1. Create item
        let item = DataItem(name: "New Item")
        
        //2. Add item to the context
        context.insert(item)
    }
    
    func deleteItem (_ item: DataItem) {
        context.delete(item)
    }
    
    func updateItem (_ item: DataItem) {
        //1. Update the item properties
        item.name = "Updated Item"
        
        //2. Save changes
        do {
            try context.save()
        } catch let error {
            print ("Error saving context: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
