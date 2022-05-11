//
//  FormToSubmitNewResaurant.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/10/22.
//

import SwiftUI

struct FormToSubmitNewResaurant: View {
    init() {
         UITableView.appearance().backgroundColor = .clear
         UITableViewCell.appearance().backgroundColor = .clear
     }
    
    @State var restaurantInput = ""
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
                    .padding()
                }
            }
    }
    
    var restaurantName: some View {
        Section("Name"){
            TextField("Restaurant Name", text: $restaurantInput)
        }
    }
    
    var notes: some View {
        Section("Neat Taco Bell"){
            TextField("Notes", text: $restaurantInput)
        }
    }
    var cuisine: some View {
        Section("Mexican"){
            TextField("Notes", text: $restaurantInput)
        }
    }
    var location: some View {
        Section("Location"){
            TextField("Location", text: $restaurantInput)
        }
    }
}

struct FormToSubmitNewResaurant_Previews: PreviewProvider {
    static var previews: some View {
        FormToSubmitNewResaurant()
    }
}
