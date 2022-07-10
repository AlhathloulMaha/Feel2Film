//
//  ViewModel.swift
//  MyMovie
//
//  Created by Maha Alhathloul on 25/11/1443 AH.
//

import Foundation
import UIKit
import Firebase


final class MovieVM : ObservableObject {
    
    @Published var RomanticMovies = [Movie]() //done
    @Published var ComedyMovies = [Movie]() //done
    @Published var ActionMovies = [Movie]() //done
    @Published var AdventureMovies = [Movie]()  //done
    @Published var MystreyMovies = [Movie]()
    @Published var AnimationMovies = [Movie]() //done
    @Published var DramaMovies = [Movie]() //done
    @Published var HorrorMovies = [Movie]() //done
    @Published var CrimeMovies = [Movie]() //done
    
    //------
    @Published var newComedyMovies = Movie(id: "", name: "", poster: "", description: "", rating: 0, category: [], releaseDate: "")
    
    @Published var newRomanticMovies = Movie(id: "", name: "", poster: "", description: "", rating: 0, category: [], releaseDate: "")
    
    @Published var newActionMovies = Movie(id: "", name: "", poster: "", description: "", rating: 0, category: [], releaseDate: "")
    
    //----
    
    @Published var newAdventureMovies = Movie(id: "", name: "", poster: "", description: "", rating: 0, category: [], releaseDate: "")
    
    @Published var newMystreyMovies = Movie(id: "", name: "", poster: "", description: "", rating: 0, category: [], releaseDate: "")
    
    @Published var newAnimationMovies = Movie(id: "", name: "", poster: "", description: "", rating: 0, category: [], releaseDate: "")
    
    //----
    
    @Published var newDramaMovies = Movie(id: "", name: "", poster: "", description: "", rating: 0, category: [], releaseDate: "")
    
    @Published var newHorrorMovies = Movie(id: "", name: "", poster: "", description: "", rating: 0, category: [], releaseDate: "")
    
    @Published var newCrimeMovies = Movie(id: "", name: "", poster: "", description: "", rating: 0, category: [], releaseDate: "")
    
    
    @Published var lastUsedRandom: Int = -1
    
    @Published var isLoading:Bool = false

    
    func fakeNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            self.isLoading = false
        }
    }
    
    //----
    
    
    init() {
        
        getDataForRomanceMovies { Romance in
            
            if Romance {
                self.calculateForRomanceMovies()
            }else{
                print("Boo👻 its an error!")
            }
            
        }
        
        getDataForActionMovies { Action in
            
            if Action {
                self.calculateForActionMovies()
            }else{
                print("Boo👻 its an error!")
            }
            
        }
        
        getDataForComedyMovies { comedy in
            
            if comedy {
                self.calculateForComedyMovies()
            }else{
                print("Boo👻 its an error!")
            }
            
        }
        
        // ---
        
        getDataForAdventureMovies { adventure in
            
            if adventure {
                self.calculateForAdventureMovies()
            }else{
                print("Boo👻 its an error!")
            }
            
        }
        
        getDataForMystreyMovies { Mystrey in
            
            if Mystrey {
                self.calculateForMysteryMovies()
            }else{
                print("Boo👻 its an error!")
            }
            
        }
        
        getDataForAnimationMovies { Animation in
            
            if Animation {
                self.calculateForAnimationMovies()
            }else{
                print("Boo👻 its an error!")
            }
            
        }
        
        // ---
        
        getDataForDramaMovies { drama in
            
            if drama {
                self.calculateForDramaMovies()
            }else{
                print("Boo👻 its an error!")
            }
            
        }
        
        getDataForHorrorMovies { horror in
            
            if horror {
                self.calculateForHorrorMovies()
            }else{
                print("Boo👻 its an error!")
            }
            
        }
        
        getDataForCrimeMovies { Crime in
            
            if Crime {
                self.calculateForCrimeMovies()
            }else{
                print("Boo👻 its an error!")
            }
            
        }
        
    }
    
    // ----
    func calculateForComedyMovies(){
        
        let i = ComedyMovies.count - 1
        let j = 0
        
        var counter = Int.random(in: j ... i)
        
        if lastUsedRandom != counter {
            newComedyMovies = ComedyMovies[counter]
            
        }else{
            counter = Int.random(in: j ... i)
            calculateForComedyMovies()
        }

        lastUsedRandom = counter
        
    }
    
    func calculateForRomanceMovies(){
        
        let i = RomanticMovies.count - 1
        let j = 0
        
        var counter = Int.random(in: j ... i)
        
        if lastUsedRandom != counter {
            newRomanticMovies = RomanticMovies[counter]
            
        }else{
            counter = Int.random(in: j ... i)
            calculateForRomanceMovies()
        }

        lastUsedRandom = counter
        
    }
    
    func calculateForActionMovies(){
        
        let i = ActionMovies.count - 1
        let j = 0
        
        var counter = Int.random(in: j ... i)
        
        if lastUsedRandom != counter {
            newActionMovies = ActionMovies[counter]
            
        }else{
            counter = Int.random(in: j ... i)
            calculateForActionMovies()
        }
    
        lastUsedRandom = counter
        
    }
    
    func calculateForAdventureMovies(){
        
        let i = AdventureMovies.count - 1
        let j = 0
        
        var counter = Int.random(in: j ... i)
        
        if lastUsedRandom != counter {
            newAdventureMovies = AdventureMovies[counter]
            
        }else{
            counter = Int.random(in: j ... i)
            calculateForAdventureMovies()
        }

        lastUsedRandom = counter
        
    }
    
    func calculateForMysteryMovies(){
        
        let i = MystreyMovies.count - 1
        let j = 0
        
        var counter = Int.random(in: j ... i)
        
        if lastUsedRandom != counter {
            newMystreyMovies = MystreyMovies[counter]
            
        }else{
            counter = Int.random(in: j ... i)
            calculateForMysteryMovies()
        }
        
        print(lastUsedRandom)
        print(counter)

        lastUsedRandom = counter
        
    }
    
    func calculateForAnimationMovies(){
        
        let i = AnimationMovies.count - 1
        let j = 0
        
        var counter = Int.random(in: j ... i)
        
        if lastUsedRandom != counter {
            newAnimationMovies = AnimationMovies[counter]
            
        }else{
            counter = Int.random(in: j ... i)
            calculateForAnimationMovies()
        }

        lastUsedRandom = counter
        
    }
     
    // ---
    
    func calculateForDramaMovies(){
        
        let i = DramaMovies.count - 1
        let j = 0
        
        var counter = Int.random(in: j ... i)
        
        if lastUsedRandom != counter {
            newDramaMovies = DramaMovies[counter]
            
        }else{
            counter = Int.random(in: j ... i)
            calculateForDramaMovies()
        }

        lastUsedRandom = counter
        
    }
    
    func calculateForHorrorMovies(){
        
        let i = HorrorMovies.count - 1
        let j = 0
        
        var counter = Int.random(in: j ... i)
        
        if lastUsedRandom != counter {
            newHorrorMovies = HorrorMovies[counter]
            
        }else{
            counter = Int.random(in: j ... i)
            calculateForHorrorMovies()
        }

        lastUsedRandom = counter
        
    }
    
    func calculateForCrimeMovies(){
        
        let i = CrimeMovies.count - 1
        let j = 0
        
        var counter = Int.random(in: j ... i)
        
        if lastUsedRandom != counter {
            newCrimeMovies = CrimeMovies[counter]
            
        }else{
            counter = Int.random(in: j ... i)
            calculateForCrimeMovies()
        }

        lastUsedRandom = counter
        
    }
    
    //MARK: *****
    
    
    func getDataForRomanceMovies(completion: @escaping(Bool)-> Void) {
        let db = Firestore.firestore()
        
        db.collection("Romance").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.RomanticMovies = snapshot.documents.map({ d in
                            return Movie(id: d.documentID,
                                         name: d["name"] as? String ?? "",
                                         poster: d["posterURL"] as? String ?? "" ,
                                         description: d["description"] as? String ?? "",
                                         rating: d["rating"] as? Double ?? 0,
                                         category: d["category"] as? [String] ?? [],
                                         releaseDate: d["releaseDate"] as? String ?? "" )
                        })
                        completion(true)
                    }//end of main dispatchqueue
                }
            }
        }//end of collection
    }//end of func
    
    func getDataForComedyMovies(completion: @escaping(Bool)-> Void) {
        let db = Firestore.firestore()
        
        db.collection("Comedy").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.ComedyMovies = snapshot.documents.map({ d in
                            return Movie(id: d.documentID,
                                         name: d["name"] as? String ?? "",
                                         poster: d["posterURL"] as? String ?? "" ,
                                         description: d["description"] as? String ?? "",
                                         rating: d["rating"] as? Double ?? 0,
                                         category: d["category"] as? [String] ?? [],
                                         releaseDate: d["releaseDate"] as? String ?? "" )
                            
                        })
                        
                        completion(true)
                    }//end of main dispatchqueue
                }
            }
        }//end of collection
        
    }//end of func
    
    func getDataForActionMovies(completion: @escaping(Bool)-> Void) {
        
        let db = Firestore.firestore()
        
        db.collection("Action").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.ActionMovies = snapshot.documents.map({ d in
                            return Movie(id: d.documentID,
                                         name: d["name"] as? String ?? "",
                                         poster: d["posterURL"] as? String ?? "" ,
                                         description: d["description"] as? String ?? "",
                                         rating: d["rating"] as? Double ?? 0,
                                         category: d["category"] as? [String] ?? [],
                                         releaseDate: d["releaseDate"] as? String ?? "" )
                        })
                        completion(true)
                    }//end of main dispatchqueue
                }
            }
        }//end of collection
    }//end of func
    
    // ---
    
    func getDataForAdventureMovies(completion: @escaping(Bool)-> Void) {
        
        let db = Firestore.firestore()
        
        db.collection("Adventure").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.AdventureMovies = snapshot.documents.map({ d in
                            return Movie(id: d.documentID,
                                         name: d["name"] as? String ?? "",
                                         poster: d["posterURL"] as? String ?? "" ,
                                         description: d["description"] as? String ?? "",
                                         rating: d["rating"] as? Double ?? 0,
                                         category: d["category"] as? [String] ?? [],
                                         releaseDate: d["releaseDate"] as? String ?? "" )
                        })
                        completion(true)
                    }//end of main dispatchqueue
                }
            }
        }//end of collection
    }//end of func
    
    func getDataForMystreyMovies(completion: @escaping(Bool)-> Void) {
        
        let db = Firestore.firestore()
        
        db.collection("Mystery").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.MystreyMovies = snapshot.documents.map({ d in
                            return Movie(id: d.documentID,
                                         name: d["name"] as? String ?? "",
                                         poster: d["posterURL"] as? String ?? "" ,
                                         description: d["description"] as? String ?? "",
                                         rating: d["rating"] as? Double ?? 0,
                                         category: d["category"] as? [String] ?? [],
                                         releaseDate: d["releaseDate"] as? String ?? "" )
                        })
                        completion(true)
                    }//end of main dispatchqueue
                }
            }
        }//end of collection
    }//end of func
    
    func getDataForAnimationMovies(completion: @escaping(Bool)-> Void) {
        
        let db = Firestore.firestore()
        
        db.collection("Animation").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.AnimationMovies = snapshot.documents.map({ d in
                            return Movie(id: d.documentID,
                                         name: d["name"] as? String ?? "",
                                         poster: d["posterURL"] as? String ?? "" ,
                                         description: d["description"] as? String ?? "",
                                         rating: d["rating"] as? Double ?? 0,
                                         category: d["category"] as? [String] ?? [],
                                         releaseDate: d["releaseDate"] as? String ?? "" )
                        })
                        completion(true)
                    }//end of main dispatchqueue
                }
            }
        }//end of collection
    }//end of func


    // ---
    
    func getDataForDramaMovies(completion: @escaping(Bool)-> Void) {
        
        let db = Firestore.firestore()
        
        db.collection("Drama").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.DramaMovies = snapshot.documents.map({ d in
                            return Movie(id: d.documentID,
                                         name: d["name"] as? String ?? "",
                                         poster: d["posterURL"] as? String ?? "" ,
                                         description: d["description"] as? String ?? "",
                                         rating: d["rating"] as? Double ?? 0,
                                         category: d["category"] as? [String] ?? [],
                                         releaseDate: d["releaseDate"] as? String ?? "" )
                        })
                        completion(true)
                    }//end of main dispatchqueue
                }
            }
        }//end of collection
    }//end of func
    
    func getDataForHorrorMovies(completion: @escaping(Bool)-> Void) {
        
        let db = Firestore.firestore()
        
        db.collection("Horror").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.HorrorMovies = snapshot.documents.map({ d in
                            return Movie(id: d.documentID,
                                         name: d["name"] as? String ?? "",
                                         poster: d["posterURL"] as? String ?? "" ,
                                         description: d["description"] as? String ?? "",
                                         rating: d["rating"] as? Double ?? 0,
                                         category: d["category"] as? [String] ?? [],
                                         releaseDate: d["releaseDate"] as? String ?? "" )
                        })
                        completion(true)
                    }//end of main dispatchqueue
                }
            }
        }//end of collection
    }//end of func
    
    func getDataForCrimeMovies(completion: @escaping(Bool)-> Void) {
        
        let db = Firestore.firestore()
        
        db.collection("Crime").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.CrimeMovies = snapshot.documents.map({ d in
                            return Movie(id: d.documentID,
                                         name: d["name"] as? String ?? "",
                                         poster: d["posterURL"] as? String ?? "" ,
                                         description: d["description"] as? String ?? "",
                                         rating: d["rating"] as? Double ?? 0,
                                         category: d["category"] as? [String] ?? [],
                                         releaseDate: d["releaseDate"] as? String ?? "" )
                        })
                        completion(true)
                    }//end of main dispatchqueue
                }
            }
        }//end of collection
    }//end of func

    
    
}

extension String {
    
    func load() -> UIImage {
        
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data : Data = try Data(contentsOf: url)
            return UIImage(data:data) ?? UIImage()
        }
        catch {
            
            
        }
        
        return UIImage()
    }
    
}
