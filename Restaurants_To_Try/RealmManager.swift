//
//  RealmManager.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/11/22.
//

import Foundation
import RealmSwift
import SwiftUI

class RealmManager: Object, ObjectKeyIdentifiable{
//    private(set) var localRealm: Realm?
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var restaurants = RealmSwift.List<Restaurants>()
    
    
    
    ///MARK: Pre SwiftUI Realm update
//    init(){
//        openRealm()
//        getRestaurants()
//    }
//
//    private func openRealm(){
//        do{
//            let config = Realm.Configuration(schemaVersion: 1)
//            Realm.Configuration.defaultConfiguration = config
//
//            localRealm = try Realm()
//        }catch{
//            print("\(error)")
//        }
//    }
//
//    private func getRestaurants(){
//        if let localRealm = localRealm {
//            let allRestaurants = localRealm.objects(Restaurants.self)
//            restaurants = []
//            allRestaurants.forEach{
//                if !$0.isInvalidated{
//                    restaurants.append($0)
//                }
//            }
//        }
//    }
//
//    func addRestaurant(restaurant: Restaurants){
//        if let localRealm = localRealm {
//            do{
//                try localRealm.write{
//                    localRealm.add(restaurant)
//                }
//                getRestaurants()
//            }catch{
//                print("Error trying to add a restaurant with code: \(error)")
//            }
//        }
//
//    }
//
//    func updateRestaurantName(id: ObjectId, newName: String){
//        if let localRealm = localRealm {
//            do{
//                let restaurantToUpdate = localRealm.objects(Restaurants.self).filter(NSPredicate(format: "_id == %@", id))
//                guard !restaurantToUpdate.isEmpty else { return }
//
//                try localRealm.write{
//                    var oldName = restaurantToUpdate[0].name
//                    restaurantToUpdate[0].name = newName
//                    getRestaurants()
//                    print("Succesfully update the name of \(oldName) to \(newName) ")
//                }
//
//            }catch{
//                print("Error trying to change the name: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func updateRestaurantNotes(id: ObjectId, newNotes: String){
//        if let localRealm = localRealm {
//            do{
//                let restaurantToUpdate = localRealm.objects(Restaurants.self).filter(NSPredicate(format: "_id == %@", id))
//
//                guard !restaurantToUpdate.isEmpty else { return }
//
//                try localRealm.write{
//                    var oldNotes = restaurantToUpdate[0].note
//                    restaurantToUpdate[0].note = newNotes
//                    getRestaurants()
//                    print("Succesfully updated \(restaurantToUpdate[0].name) notest to \(newNotes)")
//                }
//
//            }catch{
//                print("ERROR trying to update the notes \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func updateRestaurantCuisine(id: ObjectId, newCuisine: String){
//        if let localRealm = localRealm {
//            do{
//                let restaurantToUpdate = localRealm.objects(Restaurants.self).filter(NSPredicate(format: "_id == %@", id))
//
//                guard !restaurantToUpdate.isEmpty else { return }
//
//                try localRealm.write{
//                    var oldCusine = restaurantToUpdate[0].note
//                    restaurantToUpdate[0].cuisine = newCuisine
//                    getRestaurants()
//                    print("Succesfully updated \(restaurantToUpdate[0].name) cuisine to \(newCuisine)")
//                }
//
//            }catch{
//                print("ERROR trying to update the cuisine \(error.localizedDescription)")
//            }
//        }
//    }
//
//
//    func updateRestaurantLocation(id: ObjectId, newLocation: String){
//        if let localRealm = localRealm {
//            do{
//                let restaurantToUpdate = localRealm.objects(Restaurants.self).filter(NSPredicate(format: "_id == %@", id))
//
//                guard !restaurantToUpdate.isEmpty else { return }
//
//                try localRealm.write{
//                    var oldLocation = restaurantToUpdate[0].location
//                    restaurantToUpdate[0].location = newLocation
//                    getRestaurants()
//                    print("Succesfully updated \(restaurantToUpdate[0].name) location to \(newLocation)")
//                }
//
//            }catch{
//                print("ERROR trying to update the location \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func deleteRestaurant(_ restaurant: Restaurants){
//
//        if let localRealm = localRealm {
//            do{
//                let restaurantToDelete = localRealm.objects(Restaurants.self).filter(NSPredicate(format: "_id == %@", restaurant._id))
//
//                guard !restaurantToDelete.isEmpty else{ return }
//                print("About to delete \(restaurantToDelete[0].name)")
//                try localRealm.write{
//                    if !restaurant.isInvalidated{
//                        localRealm.delete(restaurantToDelete)
//                        getRestaurants()
//
//                    }else{
//                        print("Restaurnat: is invalidated")
//                    }
//
//                }
//
//            }catch{
//                print("Error trying to delete restaurant ERROR: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func delteRestaurantWithIndexSet(_ indexSet: IndexSet){
//        do{
//            if let localRealm = localRealm {
//                let allRestaurants = localRealm.objects(Restaurants.self)
//
//               try indexSet.forEach{ index in
//                    try localRealm.write{
//                        localRealm.delete(allRestaurants[index])
//                        getRestaurants()
//                    }
//                }
//            }
//        }catch{
//            print("There was an error trying to delte restaurant with index set. Error \(error.localizedDescription)")
//        }
//    }
    
}
