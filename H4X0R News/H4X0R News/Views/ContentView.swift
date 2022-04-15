//
//  ContentView.swift
//  H4X0R News
//
//  Created by Fernando Daniel on 15/04/22.
//

import SwiftUI

struct ContentView: View {

    /*
     ObservedObject es para suscribirnos a las actualizaciones de networkManager
     */
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink {
                    DetailView(url: post.url)
                } label: {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 El protocolo identifiable permite que la lista reconozca el orden de nuestros objetos Post relaciado a su id ( cuando es identifiable se requiere que tenga la propiedad "id" obligatoria)
 */
//struct Post: Identifiable {
//    let id: String
//    let title: String
//}
//
//let posts = [
//    Post(id:"1",title:"Hello"),
//    Post(id:"2",title:"Bonjour"),
//    Post(id:"3",title:"Hola")
//]
