//
//  ScreenCViewController.swift
//  LanguageDemo
//
//  Created by Marco Antonio Flores Perez on 22/01/24.
//

import UIKit

class ScreenCViewController: UIViewController {
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var rootScreenButton: UIButton!
    
    let languageManager = LanguageManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languageManager.addObserver(self)
        languageDidChange(to: languageManager.currentLanguage)
    }
    
    @IBAction func goToRootScreenButtonPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func changeLanguageButtonPressed(_ sender: UIButton) {
        var newLanguage: LanguageIdentifiers {
            switch languageManager.currentLanguage {
            case .english:
                return LanguageIdentifiers.spanish
            default:
                return LanguageIdentifiers.english
            }
        }
        
        languageManager.changeLanguage(to: newLanguage)
    }
}

extension ScreenCViewController: LanguageChangeObserver {
    func languageDidChange(to language: LanguageIdentifiers) {
        languageLabel.text = LocalizedStringKeys.welcome.localized()
        rootScreenButton.setTitle(LocalizedStringKeys.rootScreen.localized(), for: .normal)
        self.navigationItem.title = LocalizedStringKeys.ScreenTitle.C.rawValue.localized()
    }
}
