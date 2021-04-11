//
//  ContentView.swift
//  Shared
//
//  Created by Mahesh Jamdade on 11/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(content: {
            LinearGradient(gradient: Gradient(colors: [Color.blue,Color("LightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(
                content: {
                    Text("Cupertino, CA").font(.system(size: 32)).foregroundColor(.white)
                    Image(systemName: "cloud.sun.fill"
                ).renderingMode(.original)
                    .resizable().aspectRatio( contentMode: .fit)
                    .frame(width: 180, height: 180)
                    Text("76°").font(.system(size: 70,weight:.medium)).foregroundColor(.white)
                    WeekView()
                    Spacer()
                    Button{
                        print("Button tapped")
                    } label:{
                        Text("Change Date Time").frame(width:280, height:50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color.white).font(.system(size: 20,weight:.bold,design:.default)).cornerRadius(10.0)
                    }
                    Spacer()
                })
        })
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
        ContentView()
    }
}
