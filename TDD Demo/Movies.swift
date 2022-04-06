//
//  Movies.swift
//  TDD Demo
//
//  Created by crazypicklerick on 04/04/22.
//

import Foundation
import SwiftUI

struct Movie: Identifiable  {
    
    let id: UUID
    var title: String
    var cast: [Artist]
    var description: String
    var genere: String
    var rating: Double
    var image: UIImage?
    var fav: Bool
    
    init(id: UUID = UUID(), title: String, cast: [String], description: String, genere: String, rating: Double, image: UIImage, fav: Bool = false)  {
        self.id = id
        self.title = title
        self.cast = cast.map { Artist(name: $0) }
        self.description = description
        self.genere = genere
        self.rating = rating
        self.image = image
        self.fav = fav
    }
}

extension Movie {
    
    struct Artist: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String)  {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        
        var title: String = ""
        var cast: [Artist] = []
        var description: String = ""
        var genere: String = ""
        var rating: Double = 0
        var image: UIImage?
        var fav: Bool = false
    }
    
    
    
    mutating func updatefav(from data: Data)   {
        fav = data.fav
    }
    
    var data: Data  {
        Data(title: title, cast: cast, description: description, genere: genere, rating: rating, image: image, fav: fav)
    }
    
    init(data: Data)    {
        id = UUID()
        title = data.title
        description = data.description
        cast = data.cast
        genere = data.genere
        rating = Double(data.rating)
        image = data.image
        fav = data.fav
    }
    
    
    static var sampleData: [Movie] =
    [
        Movie(
            title: "The Shawshank Redemption",
            cast: ["Tim Robbins", "Morgan Freeman", "Bob Gunton"],
            description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
            genere: "Drama",
            rating: 9.3,
            image: UIImage(named: "TSR")!,
            fav: false
        ),
        
        Movie(
            title: "The Godfather",
            cast: ["Marlon Brando", "Al Pachino", "James Caan"],
            description: "The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.",
            genere: "Crime",
            rating: 9.2,
            image: UIImage(named: "TG")!,
            fav: false
        ),
        
        Movie(
            title: "The Dark Knight",
             cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
             description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
             genere: "Action",
             rating: 9,
            image: UIImage(named: "TDK")!,
            fav: true
            ),
        
        Movie(
            title: "The Godfather: Part II",
             cast: ["Al Pachino", "Robert De Niro", "Robert Duvall"],
             description: "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.",
             genere: "Crime",
             rating: 9,
            image: UIImage(named: "TG2")!,
            fav: false
        ),
        
        Movie(
            title: "12 Angry Men",
            cast: ["Henry Fonda", "Lee J Cobb", "Martin Balsam"],
            description: "The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.",
            genere: "Crime",
            rating: 9,
            image: UIImage(named: "TAM")!,
            fav: false
        ),
        
        Movie(
            title: "Schindler's List",
             cast: ["Liam Neeson", "Ralph Fiennes", "Ben Kingsley"],
             description: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",
             genere: "Biography",
             rating: 8.9,
            image: UIImage(named: "SL")!,
            fav: false
        ),
        
        Movie(
            title: "The Lord of the Rings: The Return of the King",
             cast: ["Elijah Wood", "Viggo Mortensen", "Ian McKellen"],
             description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
             genere: "Fantasy",
             rating: 8.9,
            image: UIImage(named: "LOTR3")!,
            fav: true
            ),
        
        Movie(
            title: "Pulp Fiction",
            cast: ["John Travolta", "Uma Thurman", "Samuel L Jackson"],
            description: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
            genere: "Crime",
            rating: 8.9,
            image: UIImage(named: "PF")!,
            fav: false
        ),
        
        Movie(
            title: "The Lord of the Rings: The Fellowship of the Ring",
            cast: ["Elijah Wood", "Ian McKellen", "Orlando Bloom"],
            description: "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.",
            genere: "Fantasy",
            rating: 8.8,
            image: UIImage(named: "LOTR")!,
            fav: true
        ),
        
        Movie(
            title: "The Good, the Bad and the Ugly",
            cast: ["CLint Eastwood", "Eli Wallach", "Lee Van Cleef"],
            description: "A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.",
            genere: "Adventure",
            rating: 8.8,
            image: UIImage(named: "TGBU")!,
            fav: false
        )
    ]
}
