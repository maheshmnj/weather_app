//
//  network.swift
//  weather_app
//
//  Created by Mahesh Jamdade on 15/04/21.
//

import Foundation
import SwiftUI

class Api: NSObject {

    var city = "mumbai"
    
    @Published var authenticated = false

    func getWeatherInfo(cityName: String, completion:@escaping(WeatheModel)->()) {
        let networkUrl = "\(NetworkConstants.BASE_URL)?q=\(cityName)&appid=\(NetworkConstants.API_KEY)&units=metric"
        guard let url = URL(string: networkUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do{
                    let decoder = JSONDecoder()
                    let decodedData = try! decoder.decode(WeatheModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedData)
                    }
                } 
            }
        }.resume()
    }
}

class WeatheModel:Decodable{
        let name:String
        let main:ApiMain
        let weather: [ApiWeather]
    
    init(_ name:String,_ main: ApiMain, _ weather:[ApiWeather]) {
        self.name = name
        self.main = ApiMain(temp:main.temp)
        self.weather = [ApiWeather(description: weather[0].description)]
    }
}
 
class ApiWeather:Decodable{
    let description:String
    init(description:String) {
        self.description = description
    }
}

class ApiMain:Decodable{
   let temp:Double
    init(temp:Double) {
        self.temp = temp
    }
}
