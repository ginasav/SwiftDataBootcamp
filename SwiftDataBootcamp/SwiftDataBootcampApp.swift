//
//  SwiftDataBootcampApp.swift
//  SwiftDataBootcamp
//
//  Created by Gina Saviano on 28/04/25.
//

/* Here we need to create the modelContainer
 */

import SwiftUI
import SwiftData

@main
struct SwiftDataBootcampApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self) //we add `.self` to specify that DataItem is a parameter. Here I'm saying: I want to create a container that stores instances of this typ: `DataItem`.
    }
}
