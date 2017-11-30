//
//  FavoritesList.swift
//  MAPD714-F2017-Fonts
//
//  Created by Akshit Upneja on 2017-11-29.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import Foundation
import UIKit

class FavoritesList{
    
    static let sharedFavoritesList = FavoritesList()
    private (set) var favorites:[String]
    
    //contructor
    init(){
        let defaults = UserDefaults.standard
        let storedfavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedfavorites != nil ? storedfavorites! : []
    }
    //End of Constructor
    
    //This method adds a font to the user preference list
    func addFavorite (fontName: String) {
        if !favorites.contains(fontName){
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    // this method removes favorite from user preference list
    func removefavorites (fontName : String){
        if let index = favorites.index(of: fontName){
            favorites.remove(at: index)
            saveFavorites()
        }
        
    }
    //this method saves font favorites to the user preferences file
   private func saveFavorites() {
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
    
}
