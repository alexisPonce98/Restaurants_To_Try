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
                        ForEach(realm.restaurants, id: \.id){ restaurant in
                            RestaurantsView()
                                .environmentObject(restaurant)
                        }
                }
                .onAppear{
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().backgroundColor = .clear
                }
            }

        }
        .lineSpacing(40)
        .navigationBarTitleDisplayMode(.automatic)

    }
}

struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}
