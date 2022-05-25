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
    @State var restaurantNameInput:String = ""
    @State var restaurantNotesInput = ""
    @State var restaurantCuisineInput = ""
    @State var restaurantLocationInput = ""
    @ObservedRealmObject var restaurant: Restaurants
    
    @State private var region = MKCoordinateRegion(
         center: CLLocationCoordinate2D(latitude: 37.334_900,
                                        longitude: -122.009_020),
         latitudinalMeters: 750,
         longitudinalMeters: 750
     )
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                List{
                    restaurantName
                    notes
                    cuisine
                    location
                }.zIndex(1)
                .clipped()
                .onChange(of: restaurantNameInput){name in
                    print(restaurantNameInput)
                    print(name)
                }
                Spacer()
                Map(coordinateRegion: $region)
                    .padding()
                    .clipped()
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
