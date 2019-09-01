//
//  DataBaseManager.swift
//  ExpirationDate
//
//  Created by JiminYoo on 01/09/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import Foundation
import SQLite3

class DataBaseManager {
    
    let dbURL: URL
    var database: OpaquePointer?
    
    static let shared = DataBaseManager()
    
    private init() {
        
        do {
            
            do {
                self.dbURL = try FileManager.default.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("tables.db")
            } catch {
                
                self.dbURL = URL(fileURLWithPath: "")
                return
            }
            
            try self.openDataBase()
            try self.createTables()
            
        } catch {
            
            print(error.localizedDescription)
            
        }
        
    }
    
    
    
    func openDataBase() throws {
        
        guard sqlite3_open(self.dbURL.path, &database) == SQLITE_OK else {
            
            throw SQLiteError(message: "error! openDataBase")
            
        }
        
    }
    
    func createTables() throws {
        
        let locationSql = "CREATE TABLE IF NOT EXISTS Location (LocationId INTEGER UNIQUE PRIMARY KEY AUTOINCREMENT, Name TEXT NOT NULL);"
        
        let itemSql = "CREATE TABLE IF NOT EXISTS Item (ItemId INTEGER UNIQUE PRIMARY KEY AUTOINCREMENT, Name TEXT NOT NULL, TimeInterval REAL, ImageData BLOB, Memo TEXT, LocationId INTEGER);"
        
        let sql = locationSql + itemSql
        
        if sqlite3_exec(self.database, sql, nil, nil, nil) != SQLITE_OK {
            throw SQLiteError(message: "error! createTables Lotation")
        }
        
    }
    
}

class SQLiteError: Error {
    let message: String
    init(message: String) {
        self.message = message
    }
}
