//
//  DetailedRestaurantView.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/15/22.
//

import SwiftUI
import RealmSwift
import MapKit


struct DetailedRestaurantView: View {
    
    //state bindings needed to gather the data from the user
    @State var restaurantNameInput:String = ""
    @State var restaurantNotesInput = ""
    @State var restaurantCuisineInput = ""
    @State var restaurantLocationInput = ""
    
    //Used when ampkit api can not find the location of the given user restaurant location
    @State private var defaultRegion = MKCoordinateRegion(
         center: CLLocationCoordinate2D(latitude: 37.334_900,
                                        longitude: -122.009_020),
         latitudinalMeters: 750,
         longitudinalMeters: 750
     )
    
    //array to hold the locations of the restaurant pin
    @State var placeMarks = [MapPlace]()
    
    
    //restaurant data passed from the parent view
    @ObservedRealmObject var restaurant: Restaurants
    @ObservedObject var locationManager = LocationHelper.shared
    
    
    
    var body: some View {
        ZStack{
            //background LinearGradient
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack{
                
                listRestaurantData
                
                Spacer()
                
                //places a map with the location data
                mapDisplay
                
            }
        }
    }
    
    
    //List with textfields filled with restaurant data from DB
    var listRestaurantData: some View{
        List{
            restaurantName
            notes
            cuisine
            location
        }
        .aspectRatio(contentMode: .fill)
        .clipped()
        .onAppear{
            //makes it so the List doesnt block the background gradient
            UITableView.appearance().isScrollEnabled = false
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
        }
    }
    
    //displays the map with the location data
    var mapDisplay: some View{
        
        //creates a Map View with the users location with either the default or a grabbed map region, iterates over the pins to put on the map
        Map(coordinateRegion: $defaultRegion, showsUserLocation: true, annotationItems: self.placeMarks){ item in
            
            //creates a map pin with the coordinate of the searched location
            MapMarker(coordinate: item.coordinate)
        }
            .padding()
            .clipped()
            .onAppear{
                //checks to see if it can find a coordinate region for the location
                Task{
                    
                    //If maps api returns coordniates based on the db location it will ovveride the default region
                    if let foundLocation = await locationManager.searchRestaurantCoordinatedWithTitle(restaurant.location){
                        
                        
                        placeMarks.append(MapPlace(coordinate: foundLocation.coordinate))
                        defaultRegion = MKCoordinateRegion(center: foundLocation.coordinate, latitudinalMeters: 750, longitudinalMeters: 750)
                        
                    }
                }
                
                
            }
    }
    var restaurantName: some View {
        Section("Name"){
            TextField("\(restaurant.name)", text: $restaurant.name)
                .onTapGesture {
                    restaurantNameInput = restaurant.name
                }
        }
    }
    
    
    //textfields to show/edit the data in the restaurant db
    var notes: some View {
        Section("Notes"){
            TextField("\(restaurant.note)", text: $restaurant.note)
        }
    }
    var cuisine: some View {
        Section("Cuisine"){
            TextField("\(restaurant.cuisine)", text: $restaurant.cuisine)
            
        }
    }
    var location: some View {
        Section("Location"){
            TextField("\(restaurant.location)", text: $restaurant.location)
        }
    }
}



struct DetailedRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedRestaurantView(restaurant: Restaurants())
            .previewDevice("iPhone 11")
    }
}
