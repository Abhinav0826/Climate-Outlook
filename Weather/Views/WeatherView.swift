//
//  WeatherView.swift
//  Weather
//
//  Created by Abhinav Konda on 25/08/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            let w = Int(weather.main.feelsLike.roundDouble()) ?? 0
                            if w >= 15 && w <= 20{
                                Image(systemName: "cloud.fill")
                                    .font(.system(size: 40))
                            }
                            else if w > 20 && w <= 30{
                                Image(systemName: "sun.min.fill")
                                    .font(.system(size: 40))
                            }
                            else if w > 30{
                                Image(systemName: "sun.max.fill")
                                    .font(.system(size: 40))
                            }
                            else if w < 15{
                                Image(systemName: "snowflake")
                                    .font(.system(size: 40))
                            }
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
        
//                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 350)
//                    }
//                    placeholder: {
//                        ProgressView();
//                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer.high", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
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
    WeatherView(weather: previewWeather)
}

//.background(Color(hue: 0.655, saturation: 0.774, brightness: 0.355))
//.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)

//.background(Color(hue: 0.113, saturation: 0.751, brightness: 0.855))

//https://i.pinimg.com/originals/d1/6d/6f/d16d6f762b178cedd4f86d8af701e187.png
