//
//  DataIte,.swift
//  SwiftDataBootcamp
//
//  Created by Gina Saviano on 28/04/25.
//

import Foundation
import SwiftData

//Macro `@Model` only works with class. We're going to set this class as the container of our data
@Model
class DataItem: Identifiable { //Identifiable 'cause we're going to create a list for this demo
 
    var id: String
    var name: String
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
