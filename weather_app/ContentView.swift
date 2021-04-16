//
//  ContentView.swift
//  Shared
//
//  Created by Mahesh Jamdade on 11/04/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight:Bool = false
    @State private var isSheetShown:Bool = false
    @State private var weatherModel:WeatheModel = WeatheModel("Cupertino, CA", ApiMain(temp: 76.0), [ApiWeather(description: "sample")])

    var body: some View {
        ZStack(content: {
            LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue, isNight ? .gray: Color("LightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(
                content: {
                    Text("\(weatherModel.name)").font(.system(size: 32)).foregroundColor(.white)
              Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill"
                ).renderingMode(.original)
                    .resizable().aspectRatio( contentMode: .fit)
                    .frame(width: isNight ? 150: 180, height: isNight ? 150 : 180)
                    Text(String(format: "%.1f°",weatherModel.main.temp) ).font(.system(size: 70,weight:.medium)).foregroundColor(.white)
                    WeekView()
                    Spacer()
                    Button{
                        isSheetShown = true
                    } label:{
                        WeatherButton(label: "Change Time of Day", foregroundColor: .blue, backgroundColor: .white)
                    }
                    Spacer()
                })
        }).sheet(isPresented: $isSheetShown, content: {
            ChangeTimeOfDayView(isNight: $isNight,isSheetShown:$isSheetShown)
         })
        .onAppear{
                   print("making api call")
                       Api().getWeatherInfo(cityName: "bangalore") { (weatherModel) in
                           print(weatherModel.name)
                        self.weatherModel = weatherModel
                       }
       
                   }
    }
}

struct WeatherButton:View{
    var label:String
    var foregroundColor:Color
    var backgroundColor:Color
    var body: some View{
        Text("\(label)").foregroundColor(foregroundColor) .frame(width:280, height:50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(backgroundColor).font(.system(size: 20,weight:.bold,design:.default)).cornerRadius(10.0)
    }
}

struct DayView:View{
    var dayOfWeek: String;
    var imageName: String;
    var temperature:String;
    
    var body: some View{
        VStack(content: {
            Text("\(dayOfWeek)").foregroundColor(.white)
            Image(systemName:"\(imageName)").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60)
            Text("\(temperature)°").font(.system(size: 24,weight:.medium)).foregroundColor(.white)
        })
    }
}

struct WeekView: View{
    var body:some View{
        ScrollView(.horizontal,showsIndicators:false){
        HStack(spacing:20)
            {
            DayView(dayOfWeek: "Mon", imageName: "cloud.sun.fill", temperature: "30")
            DayView(dayOfWeek: "Tue", imageName: "sun.max.fill", temperature: "33")
            DayView(dayOfWeek: "Wed", imageName: "cloud.sun.fill", temperature: "28")
            DayView(dayOfWeek: "Thu", imageName: "sunset.fill", temperature: "25")
            DayView(dayOfWeek: "Fri", imageName: "wind.snow", temperature: "18")
            DayView(dayOfWeek: "Sat", imageName: "cloud.snow.fill", temperature: "22")
            DayView(dayOfWeek: "Sun", imageName: "cloud.sun.fill", temperature: "25")
        }}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
