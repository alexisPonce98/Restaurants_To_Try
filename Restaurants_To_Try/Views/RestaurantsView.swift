//
//  RestaurantsView.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/10/22.
//

import SwiftUI
import RealmSwift

struct RestaurantsView : View {
    @ObservedRealmObject var realm: RealmManager
    
    var body: some View{
        NavigationView{
            ZStack{
                LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                if realm.restaurants.isEmpty{
                    VStack{
                        Text("No restaurant to show here")
                        Text("🥲")
                    }
                    .font(.largeTitle)
                }else{
                    listRestaurant
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(.clear)
    }
    
    var listRestaurant: some View{

        List{
            ForEach(realm.restaurants){ restaurant in
                    
                    NavigationLink(destination: DetailedRestaurantView(restaurant: restaurant).environmentObject(realm)){
                        
                            RestaurantViewCell(restaurant: restaurant)
                        
                    }
            }
            .onDelete{ index in
                let realm = try! Realm()
                try! realm.write{
                    $realm.restaurants.remove(atOffsets: index)
                }
            }
            .toolbar{
                EditButton()
            }
            .navigationTitle("Restaurants")
            .environment(\.defaultMinListRowHeight, 80)
            .onAppear{
                UITableView.appearance().backgroundColor = .clear
                UITableViewCell.appearance().backgroundColor = .clear
            }
        }
}

struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView(realm: RealmManager())
    }
}
}
