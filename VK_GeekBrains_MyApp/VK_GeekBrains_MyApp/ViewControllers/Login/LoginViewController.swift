//
//  ViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 13.01.2021.
//

import UIKit

class LoginViewController: UIViewController {

    private let login = ""
    private let password = ""
    
    @IBOutlet weak var formContainerView: UIView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginPressButton: UIButton!{ didSet{
        loginPressButton.layer.cornerRadius = 8
        loginPressButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }}
    @objc func tap () {
        
        UIView.animate(
            withDuration: 0.05,
            animations: {
                self.loginPressButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }) { (_) in
            UIView.animate(
                withDuration: 0.05,
                animations: {
                    self.loginPressButton.transform = CGAffineTransform.identity
                })
        }
    }
    
    @IBAction func exit(segue: UIStoryboardSegue) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Подписываемся на уведомления о появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        //Подписываемся на уведомления о скрытии клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //Объект, которы обрабатывает нажатия на корневой View
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.view.addGestureRecognizer(tap)
    }
    //Функция которая вызывается при срабатывании обработчика нажатий tap
    @objc func tapAction() {
        //Команда,каторая закрывает клавиатуру
        view.endEditing(true)
    }
    //Констрейнт, который позиционирует formContainerView по центру экрана ( отвечает за позицию по Y)
    @IBOutlet weak var centerVerticalFormConstraint: NSLayoutConstraint!
    
    @objc func keyboardWillAppear(_ notification: Notification?) {
        if let keyboardFrame: NSValue = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            //Достаём CGRect клавиатуры
            let keyboardRectangle = keyboardFrame.cgRectValue
            //Из объекта CGRect получаем высоту клавиатуры
            let keyboardHeight = keyboardRectangle.height
            raiseFormView(to: keyboardHeight)
        }
    }
    //функция которая поднимает форму вверх
    func raiseFormView(to height: CGFloat) {
        //высчитываем самую нижнюю точку formContainerView
        let formMaxY = formContainerView.frame.maxY
        //считаем сколько остаётся свободного места на экране, после появления клавиатуры
        let currentViewHeight = self.view.frame.height - height
        //Считаем на сколько поднять formContainerView
        let moveDistance = (formMaxY - currentViewHeight) + 30
        //Добавим Анимацию
        UIView.animate(
            withDuration: 0.3) {
            // Поднимаем formContainerView вверх на moveDistance
            // -moveDistance - минус, потому что ось Y начинается в верху экрана
            self.centerVerticalFormConstraint.constant -= moveDistance
            //Нужно вызвать, чтобы анимация заработала ( только для анимирования contraint`ов)
            self.view.layoutIfNeeded()
        }
    }
    // Функция, которая срабатывает когда клавиатура закрывается
    @objc func keyboardWillDisappear(_ notification: Notification?) {
        UIView.animate(
            withDuration: 0.3) {
            //Присваиваем констрейнту значение 0 - это переместит
            //formContainerView обратно, в центр экрана
            self.centerVerticalFormConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
}

