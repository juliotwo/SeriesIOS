//
//  SQLITEPOD.swift
//  Series
//
//  Created by julio vargas bautista on 9/1/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation
import SQLite
import UIKit

struct ListaUsuarios {
    let data: [EpisodesRequest]
  
}
class Usuarios {
    var id: Int?
    var name: String?
    var email: String?
   

    
}
class Database {
       var database: Connection!
    let usersTable = Table("users")
    
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    init() {
        connectionDatabse()
        createTable()
    }
    func connectionDatabse() {
        do {

            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("database").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
            
        } catch {
            print(error)
        }
    }
    func createTable() {
        print("CREATE TABLE")
        
        let createTable = self.usersTable.create(ifNotExists: true) { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.name)
            table.column(self.email, unique: true)
        }
        
        do {
            try self.database.run(createTable)
            print("Created Table")
        } catch {
            print(error)
        }
    }
    func insertUser(view: UIViewController) {
        print("INSERT TAPPED")
        let alert = UIAlertController(title: "Insert User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "Name" }
        alert.addTextField { (tf) in tf.placeholder = "Email" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
                let email = alert.textFields?.last?.text
                else { return }
            print(name)
            print(email)
            
            let insertUser = self.usersTable.insert(self.name <- name, self.email <- email)
            
            do {
                try self.database.run(insertUser)
                print("INSERTED USER")
            } catch {
                print(error)
            }
            
        }
        alert.addAction(action)
        
        view.present(alert, animated: true, completion: nil)
    }
    func selectUsers()  {
        do{
            let all = Array(try database.prepare(usersTable))
            
            print(all.first?.decoder())
            
        }
        catch{
            print(error)
        }
    }
}
