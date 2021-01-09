//
//  LetterControl.swift
//  MyApp
//
//  Created by Владислав Капиносов on 27.12.2020.
//

import UIKit

class LetterControl: UIControl {
    
    var selectedLetter: String? = nil {
        didSet {
            self.updateSelected()
            self.sendActions(for: .valueChanged)
        }
    }
    // Массив букв
    var letters = [String]()
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView() {
        setLetters()
        stackView = UIStackView(arrangedSubviews: self.buttons)
        
        self.addSubview(stackView)
        
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    func setLetters() {
        for letter in letters {
            let button = UIButton(type: .system)
            button.setTitle(letter, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(selectLetter(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
    }
    private func updateSelected() {
        for (index, button) in self.buttons.enumerated() {
            let letter = letters[index]
            button.isSelected = letter == self.selectedLetter
        }
    }
    
    @objc private func selectLetter(_ sender: UIButton) {
        guard let index = self.buttons.firstIndex(of: sender) else { return }
        let letter = letters[index]
        self.selectedLetter = letter
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.stackView.frame = bounds
    }
    
}
