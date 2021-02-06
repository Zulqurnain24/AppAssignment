//
//  PersistentStoreManager.swift
//  AppAssignment
//
//  Created by Mohammad Zulqarnain on 25/01/2021.
//  Copyright © 2021. All rights reserved.
//
import Foundation

protocol PersistentStoreManagerProtocol {
    func setObject<T: Codable>(uniqueId: String, key: String, value: T)
    func getObject<T: Codable>(uniqueId: String, _ key: String, _ type: T.Type) -> T?
}

/* PersistentStore
 It deals with the persistence store
 */
class PersistentStoreManager: PersistentStoreManagerProtocol {
    
    static let shared = PersistentStoreManager()
    
    func setObject<T: Codable>(uniqueId: String, key: String, value: T) {
        let updatedkey = key + String(describing: uniqueId)
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(value)
        
        UserDefaults.standard.set(encoded, forKey: updatedkey)
    }
    
    func getObject<T: Codable>(uniqueId: String, _ key: String, _ type: T.Type) -> T? {
        let updatedkey = key + String(describing: uniqueId)
        let decoder = JSONDecoder()
        var value: T?
        if let data = UserDefaults.standard.data(forKey: updatedkey) {
            value = try! decoder.decode(type, from: data) 
        }
        
        return value
    }
    
    func clearData(uniqueId: String, _ key: String) {
        let updatedkey = key + String(describing: uniqueId)
        UserDefaults.standard.removeObject(forKey: updatedkey)
        UserDefaults.standard.synchronize()
    }
}
