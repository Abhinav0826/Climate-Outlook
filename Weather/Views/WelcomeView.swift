//
//  WelcomeView.swift
//  Weather
//
//  Created by Abhinav Konda on 25/08/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManger
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Image(systemName: "cloud.sun.rain.fill")
                    .font(.system(size: 100))
            }
            VStack(spacing: 20){
                Text("Weclome to the Weather App").bold().font(.title)
                Text("Please share your current location to get the weather in your area").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.black)
            .tint(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
