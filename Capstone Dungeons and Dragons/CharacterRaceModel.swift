//
//  CharacterRaceModel.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 2/8/23.
//


import Foundation

class CharacterRaceModel: ObservableObject {
    
    private struct Returned: Codable {
        var count: Int
        var results: [Result]
    }
    
    struct Result: Codable, Hashable {
        var name: String
        var url: String
    }
    
    @Published var urlString = "https://dnd5eapi.co/api/races"
    @Published var count = 0
    @Published var raceArray: [Result] = []
    
    func getData() async {
        print("Accessing url \(urlString)")
        
        //Create a url
        guard let url = URL(string: urlString) else {
            print("ERROR could not create url \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //decode JSONData
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("ERROR JSON COULD NOT DECODE")
                return
            }
            self.count = returned.count
            self.raceArray = returned.results
            
            
        }
        catch {
            print("ERROR could not get data \(urlString)")
        }
        
    }
}
