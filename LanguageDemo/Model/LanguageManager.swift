//
//  LanguageManager.swift
//  LanguageDemo
//
//  Created by Marco Antonio Flores Perez on 22/01/24.
//

import Foundation
import UIKit

protocol LanguageChangeObserver: AnyObject {
    func languageDidChange(to language: LanguageIdentifiers)
}

class LanguageManager {
    static let shared = LanguageManager()
    var currentLanguage: LanguageIdentifiers = .english
    var observers = [LanguageChangeObserver]()
    
    private init() {}
    
    func changeLanguage(to language: LanguageIdentifiers) {
        currentLanguage = language
        notifyObservers()
    }
    
    private func notifyObservers() {
        observers.forEach { observer in
            observer.languageDidChange(to: currentLanguage)
        }
    }
    
    func addObserver(_ observer: LanguageChangeObserver) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: LanguageChangeObserver) {
        observers = observers.filter{ $0 !== observer }
    }
}
