//
//  RestaurantViewCell.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/11/22.
//

import SwiftUI
import RealmSwift

struct RestaurantViewCell: View {
    @ObservedRealmObject var restaurant: Restaurants
    var body: some View {
        if !restaurant.isInvalidated{
            VStack(alignment: .leading){
                HStack{
                    Text("\(restaurant.name)")
                    Spacer()
                }
                Text("\(restaurant.note)")
            }
        }
    }
}

struct RestaurantViewCell_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantViewCell(restaurant: Restaurants())
    }
}
