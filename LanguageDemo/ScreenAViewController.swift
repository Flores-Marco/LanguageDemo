//
//  ViewController.swift
//  LanguageDemo
//
//  Created by Marco Antonio Flores Perez on 22/01/24.
//

import UIKit

class ScreenAViewController: UIViewController {
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var nextScreenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LanguageManager.shared.addObserver(self)
        languageDidChange(to: LanguageManager.shared.currentLanguage)
    }
    
    @IBAction func nextScreenButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: SegueIdentifiers.fromAtoB, sender: self)
    }
}


extension ScreenAViewController: LanguageChangeObserver {
    func languageDidChange(to language: LanguageIdentifiers) {
        languageLabel.text = LocalizedStringKeys.welcome.localized()
        nextScreenButton.setTitle(LocalizedStringKeys.nextScreen.localized(), for: .normal)
        self.navigationItem.title = LocalizedStringKeys.ScreenTitle.A.rawValue.localized()
    }
}
