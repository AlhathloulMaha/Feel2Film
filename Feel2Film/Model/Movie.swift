//
//  Model.swift
//  MyMovie
//
//  Created by Maha Alhathloul on 25/11/1443 AH.
//

import Foundation


struct Movie : Identifiable{
    
    var id:String
    var name:String
    var poster:String
    var description:String
    var rating:Double
    var category:[String]
    var releaseDate:String
    
}


