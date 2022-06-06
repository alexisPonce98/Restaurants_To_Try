//
//  MapMarker.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 6/6/22.
//

import Foundation
import CoreLocation


//identifiable struct to hold the data needed for the map struct
//to iterate over an array of the data
struct MapPlace: Identifiable{
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
}
