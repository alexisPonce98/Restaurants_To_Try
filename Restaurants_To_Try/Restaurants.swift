//
//  Restaurants.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/11/22.
//

import Foundation
import RealmSwift

class Restaurants: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name = ""
    @Persisted var note = ""
    @Persisted var location = ""
    @Persisted var cuisine = ""
    
    @Persisted(originProperty: "restaurants") var realmManager: LinkingObjects<RealmManager>
//    convenience init(name: String, note: String, location: String, cuisine: String){
//        self.init()
//        self.name = name
//        self.note = note
//        self.location = location
//        self.cuisine = cuisine
//    }
}
