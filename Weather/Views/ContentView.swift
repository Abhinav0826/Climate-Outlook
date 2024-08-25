//
//  ContentView.swift
//  Weather
//
//  Created by Abhinav Konda on 24/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManger()
    var weatherManager = WeatherManager()
    @State var weather:  ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather) 
                }
                else{
                    LoadingView()
                        .task {
                            do{
                                try await weather = weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }
                            catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }
            else {
                if locationManager.isLoading{
                    LoadingView()
                }
                else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(){
            AsyncImage(url: URL(string: "https://i.pinimg.com/originals/d1/6d/6f/d16d6f762b178cedd4f86d8af701e187.png")) { image in
                image
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            placeholder: {
                ProgressView();
            }
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)

    }
}

#Preview {
    ContentView()
}
