//
//  RestaurantsView.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/10/22.
//

import SwiftUI
import RealmSwift

struct RestaurantsView : View {
    @EnvironmentObject var realm: RealmManager
    
    var body: some View{
        NavigationView{
            ZStack{
                LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                List{
                    ForEach(realm.restaurants, id: \._id){ restaurant in
                        NavigationLink(destination: DetailedRestaurantView(realm: realm).environmentObject(restaurant)){
                            
                            RestaurantViewCell()
                                .environmentObject(restaurant)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true){
                            Button(role: .destructive){
                                realm.deleteRestaurant(restaurant, name: restaurant.name)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
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
        .background(.clear)
    }
}

struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
            .environmentObject(RealmManager())
    }
}
