//
//  CitiesViewModel.swift
//  WeatherMeow
//
//  Created by 영현 on 2/29/24.
//

import Foundation

class CitiesViewModel: ObservableObject {
    static let shared = CitiesViewModel()
    
    @Published var cities: [String] = []
    
//    @Published var isLoading = false
    
    private var favoriteCitiesObserver: NSObjectProtocol?
    
    init() {
        cities = UserDefaultsManager.shared.favoriteCities
        setupObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(favoriteCitiesObserver as Any)
    }
    
    private func setupObservers() {
        favoriteCitiesObserver = NotificationCenter.default.addObserver(forName: Notification.Name("FavoriteCitiesChanged"), object: nil, queue: nil) { [weak self] _ in
            self?.cities = UserDefaultsManager.shared.favoriteCities
        }
    }
}
