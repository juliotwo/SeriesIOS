//
//  Sqlite.swift
//  Series
//
//  Created by julio vargas bautista on 9/1/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation
import UIKit
import SQLite3

func openDatabase() -> OpaquePointer? {
    var db: OpaquePointer? = nil
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("HeroesDatabase.sqlite")
    
    if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
        print("Successfully opened connection to database at \(fileURL.path)")
        return db
    } else {
        print("Unable to open database. Verify that you created the directory described " +
            "in the Getting Started section.")
       return nil
    }
    
}

