//
//  RestaurantViewCell.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/11/22.
//

import SwiftUI

struct RestaurantViewCell: View {
    @EnvironmentObject var restaurant: Restaurants
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("\(restaurant.name)")
                Spacer()
                Image(systemName: "checkmark")
            }
            Text("\(restaurant.note)")
        }
    }
}

struct RestaurantViewCell_Previews: PreviewProvider {
    static  var rest = Restaurants()
    static var previews: some View {
        RestaurantViewCell()
            .environmentObject(rest)
    }
}
