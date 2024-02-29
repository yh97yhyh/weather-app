//
//  UserDefaultsManager.swift
//  WeatherMeow
//
//  Created by 영현 on 2/29/24.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let favoritesKey = "favoriteCities"
    
    var favoriteCities: [String] {
            get {
                return UserDefaults.standard.stringArray(forKey: favoritesKey) ?? ["Seoul"]
            }
            set {
                UserDefaults.standard.set(newValue, forKey: favoritesKey)
                NotificationCenter.default.post(name: Notification.Name("FavoriteCitiesChanged"), object: nil)
            }
        }
    
    func addFavoriteCity(_ city: String) {
            var favorites = favoriteCities
            if !favorites.contains(city) {
                favorites.append(city)
                favoriteCities = favorites
            }
        }
    
    func removeFavoriteCity(_ city: String) {
            var favorites = favoriteCities
            if let index = favorites.firstIndex(of: city) {
                favorites.remove(at: index)
                favoriteCities = favorites
            }
        }
}
