//
//  ContentView.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var showForm = false
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            RestaurantsView()
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showForm.toggle()
                }
        }
        .sheet(isPresented: $showForm){
            FormToSubmitNewResaurant()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
