//
//  CoreDataController.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/29.
//

import CoreData
import Foundation

class CoreDataController: ObservableObject {
    let container = NSPersistentContainer(name: "FavoriteMovie")

    init() {
        container.loadPersistentStores { _, error in
            if let error {
                print("Fail to load core data: \(error.localizedDescription)")
            }
        }
    }
}
