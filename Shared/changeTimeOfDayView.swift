//
//  changeTimeOfDayView.swift
//  weather_app (iOS)
//
//  Created by Mahesh Jamdade on 12/04/21.
//

import SwiftUI

struct ChangeTimeOfDayView:View{
    @Binding var isNight:Bool
    @Binding var isSheetShown:Bool

    var body:some View{
        ZStack(content: {
            LinearGradient(gradient: Gradient(colors: [.black,.gray]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(content: {
                Button{
                    isNight = true
                    isSheetShown = false
                } label:{
                    WeatherButton(label: "Night Mode", foregroundColor: .white, backgroundColor: .black)
                }
                Button{
                    isNight = false
                    isSheetShown = false
                } label:{
                    WeatherButton(label: "Light Mode", foregroundColor: .white, backgroundColor: .gray)
                }.padding(.vertical,10)
            })
        })
    }
}

struct ChangeTimeOfDayPreview:PreviewProvider{
    static var previews: some View{
        ChangeTimeOfDayView(isNight: .constant(false), isSheetShown: .constant(false))
    }
}
