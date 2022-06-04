//
//  FormToSubmitNewResaurant.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/10/22.
//

import SwiftUI
import RealmSwift
import MapKit
import CoreLocation
import CoreLocationUI

struct FormToSubmitNewResaurant: View {
    @ObservedRealmObject var realm: RealmManager
    @ObservedObject var locationManager = LocationHelper.shared
    
    @State var restaurantNameInput = ""
    @State var restaurantNotesInput = ""
    @State var restaurantCuisineInput = ""
    @State var restaurantLocationInput = ""
    
    @Environment(\.dismiss) var dismiss
    
    

    var body: some View {
        LinearGradient(colors: [.blue,.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            .overlay{
                VStack{
                    Spacer()
                    Text("Add a restaurant")
                        .font(.system(size: 30))
                        .bold()
                        .padding()

                    List{
                        restaurantName
                        notes
                        cuisine
                        location
                    }
                    .onAppear{
                        UITableView.appearance().backgroundColor = .clear
                        UITableViewCell.appearance().backgroundColor = .clear
                    }
                    .padding()
                    Button{
                        if  restaurantNameInput != "" && restaurantCuisineInput != "" && restaurantNotesInput != "" && restaurantLocationInput != "" {
                            Task{
                                if let restaurantFound = await locationManager.searchRestaurantWithName(restaurantNameInput){
                                    
                                    restaurantLocationInput = restaurantFound
                                    print("This is the restaurant name after submitting the form \(restaurantLocationInput)")
                                    
                                }
                                let newRestaurant = Restaurants(value: ["name": restaurantNameInput, "note": restaurantNotesInput, "location": restaurantLocationInput, "cuisine": restaurantCuisineInput])
                                print("This is the object being added to the db \(newRestaurant)")
                                let realm = try! await Realm()
                                try!realm.write{
                                    $realm.restaurants.append(newRestaurant)
                                }
                            }
                          
                            
                   
                            
                            dismiss()
                        }else{
                            print("Not all the fields are filles")
                        }
                        
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .overlay{
                                    Text("ADD")
                                        .foregroundColor(.white)
                                }
                        }
                        .cornerRadius(30)
                    }
                    .frame(maxWidth: 100, maxHeight: 60)
                    .padding()
                    Spacer()
                }
            }
            .ignoresSafeArea()
    }
    
    var restaurantName: some View {
        Section("Name"){
            TextField("Restaurant Name", text: $restaurantNameInput)
        }
    }
    
    var notes: some View {
        Section("Notes"){
            TextField("Near Taco Bell", text: $restaurantNotesInput)
        }
    }
    var cuisine: some View {
        Section("Cuisine"){
            TextField("Mexican", text: $restaurantCuisineInput)
        }
    }
    var location: some View {
        Section("Location"){
            TextField("105 E St", text: $restaurantLocationInput)
        }
    }
    
    private func lookForRestaurant(_ restaurant: String){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = restaurant
    }
}

struct FormToSubmitNewResaurant_Previews: PreviewProvider {
    static var previews: some View {
        FormToSubmitNewResaurant(realm: RealmManager())
    }
}
