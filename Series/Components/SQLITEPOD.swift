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


class Database {
    var database: Connection!
    let usersTable = Table("users")
    
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let lastname = Expression<String>("lastname")
    let password = Expression<String>("password")

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
            table.column(self.password)
            table.column(self.lastname)
            table.column(self.email, unique: true, check: email.like("%@%"))
        }
        
        do {
             //try self.database.run(self.usersTable.drop())
            try self.database.run(createTable)
//            try self.database.run(self.usersTable.addColumn(Expression<String?>(self.lastname)))
//            try self.database.run(self.usersTable.addColumn(Expression<String?>(self.password)))
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
    func registerUser(name:String, lastname:String, email:String, password:String) {
            print("INSERT TAPPED")
            print(name)
            print(email)
            
            let insertUser = self.usersTable.insert(self.name <- name, self.email <- email, self.lastname <- lastname, self.password <- password)
            
            do {
                try self.database.run(insertUser)
                print("INSERTED USER")
            } catch {
                print(error)
            }
    }
    func ShowAllUsers()  {
        print("LIST TAPPED")
        
        do {
            let users = try self.database.prepare(self.usersTable)
            for user in users {
                print("userId: \(user[self.id]), name: \(user[self.name]), email: \(user[self.email]),  password: \(user[self.password])")
            }
        } catch {
            print(error)
        }
    }
    func SelectUser(emailUser: String, passwordUser: String, view: UIViewController) -> Bool {
        let query = usersTable.select(email, password).filter(email == emailUser).order(email.desc)
        var userSelec:String? = nil
        var passwordSelect: String? = nil
        do{
        for user in try self.database.prepare(query) {
            print("email: \(user[email])")
            userSelec = String(user[email])
            passwordSelect = String(user[password])
            
            if userSelec != nil && passwordUser == passwordSelect{
                return true
                
            }
            
            }
           
        }catch{
            print(error)
            return false
        }
        print("NO hay datos")
       showAlert(for: "Correo y/o Contraseña incorrectos", view: view)
        return false
        
    }
    func deleteUser(view: UIViewController) {
        print("DELETE TAPPED")
        let alert = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "User ID" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let userIdString = alert.textFields?.first?.text,
                let userId = Int(userIdString)
                else { return }
            print(userIdString)
            
            let user = self.usersTable.filter(self.id == userId)
            let deleteUser = user.delete()
            do {
                try self.database.run(deleteUser)
            } catch {
                print(error)
            }
        }
        alert.addAction(action)
        view.present(alert, animated: true, completion: nil)
    }
}
