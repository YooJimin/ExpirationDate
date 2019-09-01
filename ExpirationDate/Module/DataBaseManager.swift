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
    
    private let dbURL: URL
    private var database: OpaquePointer?
    
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
    
    private func openDataBase() throws {
        
        guard sqlite3_open(self.dbURL.path, &database) == SQLITE_OK else {
            
            throw DataBaseError(message: "error! openDataBase")
            
        }
        
    }
    
    private func createTables() throws {
        
        let locationSql = "CREATE TABLE IF NOT EXISTS Location (LocationId INTEGER UNIQUE PRIMARY KEY AUTOINCREMENT, Name TEXT NOT NULL);"
        
        let itemSql = "CREATE TABLE IF NOT EXISTS Item (ItemId INTEGER UNIQUE PRIMARY KEY AUTOINCREMENT, Name TEXT NOT NULL, TimeInterval REAL, ImageData BLOB, Memo TEXT, LocationId INTEGER);"
        
        let sql = locationSql + itemSql
        
        if sqlite3_exec(self.database, sql, nil, nil, nil) != SQLITE_OK {
            throw DataBaseError(message: "error! createTables Lotation")
        }
        
    }
    
}

extension DataBaseManager {

    func createLocation(name: String) throws {
        
        var insertStatement: OpaquePointer? = nil
        defer {
            // 5
            sqlite3_finalize(insertStatement)
        }
        
        let sql = "INSERT INTO Location (Name) VALUES (?);"
        
        // 1
        if sqlite3_prepare_v2(self.database, sql, -1, &insertStatement, nil) == SQLITE_OK {
            
            // 2
            if sqlite3_bind_text(insertStatement, 1, (name as NSString).utf8String, -1, nil) != SQLITE_OK {
                throw DataBaseError(message: "error! createLocation name")
            }
            
            // 3
            if sqlite3_step(insertStatement) != SQLITE_DONE {
                throw DataBaseError(message: "error! Could not insert row")
            }
            
        } else {
            throw DataBaseError(message: "error! Could not insert row")
        }
        
    }
    
    func readLocationList() -> [Location] {
        
        var locations = [Location]()
        var readStatement: OpaquePointer? = nil
        defer {
            // 5
            sqlite3_finalize(readStatement)
        }
        
        let sql =  "SELECT * FROM Location;"
        
        // 1
        if sqlite3_prepare_v2(self.database, sql, -1, &readStatement, nil) == SQLITE_OK {
            // 2
            while sqlite3_step(readStatement) == SQLITE_ROW {
                
                // 3
                let id = sqlite3_column_int(readStatement, 0)
                
                // 4
                let queryResultCol1 = sqlite3_column_text(readStatement, 1)
                let name = String(cString: queryResultCol1!)
                
                locations.append(Location(id: Int(id), name: name))
                
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        
        return locations
        
    }
    
    func updateLocation(_ location: Location) {
        
    }
    
}


class DataBaseError: Error {
    let message: String
    init(message: String) {
        self.message = message
    }
}

