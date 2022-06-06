//
//  LocationManager.swift
//  Restaurants_To_Try
//
//  Created by Alexis Ponce on 5/26/22.
//

import CoreLocation
import MapKit


//Class used to access the users location, as well as do the qeuery request for the restaurnt
@MainActor
class LocationHelper: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    private var manager = CLLocationManager()
    
    static public let shared = LocationHelper()
    
    private var localSearch: MKLocalSearch? {
        willSet{
            localSearch?.cancel()
        }
    }
    
    
    //used to store the updated user location
    public var currentLocation: CLLocationCoordinate2D?
    
    
    
    override init(){
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        Task.init{
           await checkAuthorizationStatus()
        }
        manager.startUpdatingLocation()
        print("The current authorization station \(manager.authorizationStatus)")
    }

    func checkAuthorizationStatus(){
        switch manager.authorizationStatus{
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            print("App is not allowed to access location")
        case .denied:
            print("user restricted the usage")
        case .authorizedAlways:
            print("User has allowed always")
        case .authorizedWhenInUse:
            print("User has allowed when in use")
        @unknown default:
            print("Unknown authorization: \(manager.authorizationStatus))")
        }
    }
    
    func searchRestaurantWithName(_ restaruant: String)async -> String?{
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = restaruant
        searchRequest.resultTypes = .pointOfInterest
        if let currentLocation = currentLocation {
            searchRequest.region = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
        }
       
        
        if let currentLocation = currentLocation {
            searchRequest.region = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 750, longitudinalMeters: 750)
        }else{
            return nil
        }
       
        let localSearch = MKLocalSearch(request: searchRequest)
        
        let response: MKLocalSearch.Response?
        var foundRestaurant: String?
        
        do{
            response = try await localSearch.start()
            
            if let response = response{
                if !response.mapItems.isEmpty{
                    let mapItem = response.mapItems[0]
                    foundRestaurant = mapItem.placemark.title
                    print("This is the first \(String(describing: foundRestaurant))")
            }
            
        }
            
        }catch{
            print("There was an error starting the search")
        }
        
        print("This is the second \(foundRestaurant)")
        return foundRestaurant
    }
    
    func searchRestaurantCoordinatedWithTitle(_ title: String) async -> CLLocation?{
        
        var locationToReturn: CLLocation?
        var arrayPlaceMark: [CLPlacemark]?
       
        do{
            arrayPlaceMark =  try await CLGeocoder().geocodeAddressString(title)
            if let arrayPlaceMark = arrayPlaceMark {
                if !arrayPlaceMark.isEmpty{
                    locationToReturn = arrayPlaceMark[0].location
                }
            }

        }catch{
            print("There was an error trying to get the coordinated \(error)")
        }
        
        return locationToReturn
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locations[0].coordinate
        print(locations[0].coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Helper failed: \(error)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }
    
    
}


