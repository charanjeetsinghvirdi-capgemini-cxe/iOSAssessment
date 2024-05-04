//
//  DataStorageManager.swift
//  iOSAssessment
//
//  Created by Charanjeet Virdi on 03/05/24.
//

import Foundation
import RealmSwift

//MARK: - DataStorageManager class for managing local database
class DataStorageManager {
    
    //MARK: - Properties
    static var shared = DataStorageManager()
    private let realm: Realm
    
    private init() {
        self.realm = try! Realm()
    }
    
    //MARK: - Following method will save the data into realm database
    func saveData<T:Object>(data: [T]) {
        try! realm.write {
            realm.add(data, update: .modified)
        }
    }
    
    //MARK: - Following method will fetch the data from realm database
    func fetchData<T:Object>(obj:T.Type) -> (data: [T],containsData: Bool) {
        var boolValue:Bool = true
        if realm.objects(T.self).isEmpty {
            boolValue =  false
        }
        return (Array(realm.objects(T.self)), boolValue )
    }
    
    //MARK: - Following method will delete the data from realm database
    func deleteAll<T:Object>(obj: T.Type) {
        try! realm.write {
            realm.delete( realm.objects(T.self))
        }
    }
}
