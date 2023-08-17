//
//  ContentView.swift
//  ApiGet
//
//  Created by afnan saad on 29/01/1445 AH.
//

import SwiftUI
struct CatFact : Codable{
    let fact : String
    let length : Int
}
struct ContentView: View {
    let session : URLSession = .shared
    // let myUrl:URLSession = .shared
    var body: some View {
        VStack {
            
            Text("Hello, world!")
                .onAppear(){
                let url = URL(string: "https://catfact.ninja/fact")//الربط
                let requst = URLRequest(url: url! )
                let task = session.dataTask(with: requst)
               {(data , response ,error)
                in
                if let error = error {
                print("Error \(error)")
                return
                    }//error
                    if let data = data {
                                        
                    if let content = String (bytes: data, encoding: .utf8){
                    print(content)
                    //    if let c = String(bytes: data, encoding: .utf8)
                    let decoder = JSONDecoder()
                    do{
                    let catFact = try decoder.decode(CatFact.self, from: data)
                   // let web = try decoder.decode(web.self, from: data)
                    print(catFact)
                                                
                  }
                catch{
               print ("error", error)
                            }
                            }//content
                            }//data
                            }// data-response-error
                            task.resume()
                            }//on
                            
                        }//vstak
                    }
                }







               
                
                
        
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

