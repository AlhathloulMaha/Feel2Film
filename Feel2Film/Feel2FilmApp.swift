//
//  Feel2FilmApp.swift
//  Feel2Film
//
//  Created by Maha Alhathloul on 10/12/1443 AH.

import SwiftUI
import Firebase

@main
struct Feel2FilmApp: App {
    
    init() { FirebaseApp.configure() }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
