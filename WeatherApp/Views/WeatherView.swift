//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mateis Ragon on 30/12/2024.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody;
    
    var body: some View {
        ZStack (alignment: .leading) {
            VStack {
                VStack (alignment: .leading, spacing: 5) {
                    Text (weather.name)
                        .bold().font(.title);
                    
                    Text ("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading);
                
                Spacer();
                
                VStack {
                    HStack {
                        VStack (spacing: 20) {
//                            weather.main =>
                            let image = "sun.max";
                            
                            if weather.main == "Rain"
                            {
                                image = "cloud.heavyrain";
                            }
                            else if weather.main == "Snow"
                            {
                                image = "cloud.snow";
                            }
                                
                            Image(systemName: image)
                                .font(.system(size: 40));
                            
                            Text (weather.weather[0].main);
                        }
                        .frame(width: 150, alignment: .leading);
                        
                        Spacer();
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding();
                    }
                    
                    Spacer()
                        .frame(height: 80);
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        .frame(width: 350) } placeholder: {
                            ProgressView();
                        }
                    
                    Spacer();
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading);
            
            VStack {
                Spacer();
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom);
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        
                        Spacer();
                        Spacer();
                        Spacer();
                        
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                        
                        Spacer();
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        
                        Spacer();
                        Spacer();
                        Spacer();
                        
                        WeatherRow(logo: "humidity", name: "Max temp", value: (weather.main.humidity.roundDouble() + "%"))
                        
                        Spacer();
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom)
                .foregroundStyle(Color(hue: 0.656, saturation: 0.787, brightness: 0.254))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.254))
        .preferredColorScheme(.dark);
    }
}

#Preview {
    WeatherView(weather: previewWeather);
}
