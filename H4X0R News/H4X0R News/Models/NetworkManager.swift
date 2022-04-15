//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Fernando Daniel on 15/04/22.
//

import Foundation

/*
 ObservableObject empieza a propagar la información una o todas sus propiedas a las archivos que quieran escucharlo

 @Published si se "suscriben" a esta variable podran saber cuando esta variable es modificada
 y debe pasar en el main thread
 */

class NetworkManager: ObservableObject {

    @Published var posts = [Post]()

    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
