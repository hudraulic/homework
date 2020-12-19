//
//  ViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 08.12.2020.
//

import UIKit

class ViewController: UIViewController {

    private let login = "admin"
    private let pass = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Подписываемся на уведомления о появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //Подписываемся на уведомления о скрытии клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Создаем объект, который будет обрабатыватьнажатия на корневом view
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        // Присваиваем его в обработчик нажатия корневого view
        self.view.addGestureRecognizer(tap)
    }
    //Функция, которая вызывается при срабатывании обработчика нажатий tap
    @objc func tapAction() {
        // Команда, которая закрывает клавиатуру
        view.endEditing(true)
    }
    
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var formContainerView: UIView! {didSet {formContainerView.layer.cornerRadius = 16.0}}
    @IBOutlet weak var loginBotton: UIButton! {didSet {loginBotton.layer.cornerRadius = 16.0 }}
    //Констрейнт, который позиционирует formContainerView по центру экрана (отвечает за позицию по Y)
    @IBOutlet weak var centerVerticalFormConstraint: NSLayoutConstraint!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let loginIn = loginInput.text
        let passwordIn = passwordInput.text
        
        if (loginIn == login) && (passwordIn == pass) {
            return true
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин и/или пароль", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
                self.loginInput.text = ""
                self.passwordInput.text = ""
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return false
        }
    }
    // Функция, которая вызывается при открытии клавиатуры
    @objc func keyboardWillAppear(_ notification: Notification?) {
        // Пытаемся получить Frame клавиатуры в NSValue
        if let keyboardFrame: NSValue = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            //Достаем CGRect клавиатуры
            let keyboardRectangle = keyboardFrame.cgRectValue
            //Из объекта CGrect получаем высоту клавиатуры
            let keyboardHeight = keyboardRectangle.height
            raiseFormView(to: keyboardHeight)
        }
    }
    //Функция, которая поднимает форму вверх
    func raiseFormView(to height: CGFloat) {
        // высчитываем самую нижнюю точку formContainerView
        let formMaxY = formContainerView.frame.maxY
        // считаем сколько остаётся свободного места на экране, после появления клавиатуры
        let currentViewHeight = self.view.frame.height - height
        // Считаем на сколько поднять formContainerView
        let moveDistance = (formMaxY - currentViewHeight) + 30
        //Добавим анимацию
        UIView.animate(withDuration: 0.3) {
            // Поднимаем formContainerView вверх на moveDistance
            // -moveDistance - минус, потому что ось Y начинается в верху экрана
            self.centerVerticalFormConstraint.constant = -moveDistance
            //Нужно вызвать, чтобы анимация заработала ( только для анимирования contraint`ов)
            self.view.layoutIfNeeded()
        }
        
    }
    // Функция, которая срабатывает когда клавиатура закрывается
    @objc func keyboardWillDisappear(_ notification: Notification?) {
        UIView.animate(withDuration: 0.3) {
            //Присваиваем констрейнту значение 0 - это переместит
            //formContainerView обратно, в центр экрана
            self.centerVerticalFormConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillDisappear(_ animated : Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
}

