//
//  WebClient.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

class NetworkManager {
    
    let baseUrl:URL
    
    static func shared(url:String) -> NetworkManager {
        return NetworkManager(baseUrl: url)
    }
    
    private init(baseUrl:String) {
        self.baseUrl = URL(string:baseUrl)!
    }
    
    public func request<TData: Codable>() -> TData {
        
        var coreData: TData!
        let url = baseUrl
        
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: url, completionHandler:
            { data, response, error in
                
                guard error == nil else {
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    let result = try
                        Decoder.shared.newJSONDecoder().decode(TData.self, from: data)
                    
                    coreData = result;
                    
                    semaphore.signal()
                    
                } catch let error {
                    print(error.localizedDescription)
                }
        }).resume()
        
        _ = semaphore.wait(timeout: .distantFuture)
        
        return coreData
    }
    
}
