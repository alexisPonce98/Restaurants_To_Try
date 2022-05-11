//
//  Restaurants.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/11/22.
//

import Foundation
import RealmSwift

class Restaurants: Object{
    @Persisted var name = ""
    @Persisted var note = ""
    @Persisted var location = ""
    @Persisted var cuisine = ""
}
