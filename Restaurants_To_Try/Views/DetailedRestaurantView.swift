//
//  DetailedRestaurantView.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/15/22.
//

import SwiftUI
import RealmSwift

struct DetailedRestaurantView: View {
    @State var restaurantNameInput:String = ""
    @State var restaurantNotesInput = ""
    @State var restaurantCuisineInput = ""
    @State var restaurantLocationInput = ""
    @ObservedRealmObject var restaurant: Restaurants
    
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
                }
                .onChange(of: restaurantNameInput){name in
                    print(restaurantNameInput)
                    print(name)
                }
                Spacer()
                Button{
             
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                        Text("SAVE")
                    }
                }
                .frame(maxWidth: 60, maxHeight: 40)
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

//struct DetailedRestaurantView_Previews: PreviewProvider {
//    static var restaruant = Restaurants(name: "Taco Bell", note: "Near Walmart", location: "105 E Apple St", cuisine: "Mexican")
////        self.restaurant.name = "Taco Bell"
////        restaurant.note = "No"
////        restaurant.cuisine = "Mexican"
////        restaurant.location + "105 E Apple St"
//    static var previews: some View {
//        DetailedRestaurantView(restaurant: restaruant)
//            .previewDevice("iPhone 11")
//            .environmentObject(RealmManager())
//    }
//}
