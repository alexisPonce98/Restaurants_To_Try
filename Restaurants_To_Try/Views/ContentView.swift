//
//  ContentView.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/10/22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedResults(RealmManager.self) var realm
    
    @State var showForm = false
    var body: some View {
        if let realmManager = realm.first{
            ZStack(alignment: .bottomTrailing){
                
                RestaurantsView(realm: realmManager)
                SmallAddButton()
                    .padding()
                    .onTapGesture {
                        showForm.toggle()
                    }
            }
            .sheet(isPresented: $showForm){
                FormToSubmitNewResaurant(realm: realmManager)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        }else{
            ProgressView().onAppear{
                print("Got to the progressview")
                $realm.append(RealmManager())
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
