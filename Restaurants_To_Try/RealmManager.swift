//
//  RealmManager.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/11/22.
//

import Foundation
import RealmSwift
import SwiftUI

class RealmManager: ObservableObject{
    private(set) var localRealm: Realm?
    @Published var restaurants: [Restaurants] = []
    
    init(){
        openRealm()
        getRestaurants()
    }
    
    private func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        }catch{
            print("\(error)")
        }
    }
    
    private func getRestaurants(){
        if let localRealm = localRealm {
            let allRestaurants = localRealm.objects(Restaurants.self)
            restaurants = []
            allRestaurants.forEach{
                restaurants.append($0)
            }
        }
    }
    
    func addRestaurant(restaurant: Restaurants){
        if let localRealm = localRealm {
            do{
                try localRealm.write{
                    localRealm.add(restaurant)
                }
                getRestaurants()
            }catch{
                print("Error trying to add a restaurant with code: \(error)")
            }
        }
      
    }
    
}
