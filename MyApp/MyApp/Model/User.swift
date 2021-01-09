//
//  User.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

struct Users {
    
    let name: String
    let surname: String
    let userPhoto: UIImage
    let userPhotoLibrari: [UIImage]
    
}

var friendsList = [
    Users(name: "Владислав", surname: "Худалов", userPhoto: UIImage(named: "Vlad")!, userPhotoLibrari: [UIImage(named: "Vlad")!, UIImage(named: "Vlad1")!]),
    Users(name: "Евгений", surname: "Дубинец", userPhoto: UIImage(named: "john1")!, userPhotoLibrari: [UIImage(named: "john")!, UIImage(named: "john1")!]),
    Users(name: "Антон", surname: "Клименко", userPhoto: UIImage(named: "Anton")!, userPhotoLibrari: [UIImage(named: "Anton")!, UIImage(named: "Anton1")!]),
    Users(name: "Гарри", surname: "Поттер", userPhoto: UIImage(named: "Гарри Потер")!, userPhotoLibrari: [UIImage(named: "Гарри Потер1")!, UIImage(named: "Гарри Потер2")!]),
    Users(name: "Гермиона", surname: "Гренджер", userPhoto: UIImage(named: "Гермиона")!, userPhotoLibrari: [UIImage(named: "Гермиона1")!, UIImage(named: "Гермиона2")!]),
    Users(name: "Чебурашка", surname: "Петров", userPhoto: UIImage(named: "чебурашка")!, userPhotoLibrari: [UIImage(named: "чебурашка1")!, UIImage(named: "чебурашка2")!]),
    Users(name: "Винни", surname: "Пух", userPhoto: UIImage(named: "винипух")!, userPhotoLibrari: [UIImage(named: "винипух1")!, UIImage(named: "винипух2")!]),
    Users(name: "Тони", surname: "Старк", userPhoto: UIImage(named: "IronMan")!, userPhotoLibrari: [UIImage(named: "IronMan1")!, UIImage(named: "IronMan2")!]),
    Users(name: "Тор", surname: "Одинсын", userPhoto: UIImage(named: "Thor")!, userPhotoLibrari: [UIImage(named: "Thor1")!, UIImage(named: "Thor2")!]),
    Users(name: "Женя", surname: "Худалова", userPhoto: UIImage(named: "Женя Худалова")!, userPhotoLibrari: [UIImage(named: "Vlad")!, UIImage(named: "Женя Худалова")!]),
    Users(name: "Диана", surname: "Карпенко", userPhoto: UIImage(named: "Диана Карпенко")!, userPhotoLibrari: [UIImage(named: "Диана Карпенко1")!, UIImage(named: "Диана Карпенко2")!]),
    Users(name: "Дмитрий", surname: "Герасименко", userPhoto: UIImage(named: "Дмитрий Герасименко")!, userPhotoLibrari: [UIImage(named: "Дмитрий Герасименко1")!, UIImage(named: "Дмитрий Герасименко")!]),
    Users(name: "Даша", surname: "Аксенова", userPhoto: UIImage(named: "Даша")!, userPhotoLibrari: [UIImage(named: "Даша1")!, UIImage(named: "Даша2")!]),
    Users(name: "Алена", surname: "Батяева", userPhoto: UIImage(named: "Алена Батяева")!, userPhotoLibrari: [UIImage(named: "Алена Батяева1")!, UIImage(named: "Алена Батяева2")!]),
    Users(name: "Евгения", surname: "Федорова", userPhoto: UIImage(named: "Евгения Фёдорова")!, userPhotoLibrari: [UIImage(named: "Евгения Фёдорова1")!, UIImage(named: "Евгения Фёдорова2")!]),
    Users(name: "Сабина", surname: "Шейкова", userPhoto: UIImage(named: "Сабина Шейкова")!, userPhotoLibrari: [UIImage(named: "Сабина Шейкова1")!, UIImage(named: "Сабина Шейкова2")!]),
    Users(name: "Андрей", surname: "Старков", userPhoto: UIImage(named: "Андрей Старков")!, userPhotoLibrari: [UIImage(named: "Андрей Старков1")!, UIImage(named: "Андрей Старков2")!]),
    Users(name: "Иван", surname: "Рогожкин", userPhoto: UIImage(named: "Иван Рогожкин")!, userPhotoLibrari: [UIImage(named: "Иван Рогожкин1")!, UIImage(named: "Иван Рогожкин2")!]),
    Users(name: "Наталья", surname: "Марченко", userPhoto: UIImage(named: "john1")!, userPhotoLibrari: [UIImage(named: "john")!, UIImage(named: "john1")!]),
    Users(name: "Roma", surname: "Roma", userPhoto: UIImage(named: "Roma")!, userPhotoLibrari: [UIImage(named: "Roma")!, UIImage(named: "Roma1")!]),
    Users(name: "Настя", surname: "Ковалёва", userPhoto: UIImage(named: "Настя Ковалева")!, userPhotoLibrari: [UIImage(named: "Настя Ковалева1")!, UIImage(named: "Настя Ковалева2")!]),
    Users(name: "Максим", surname: "Поздышев", userPhoto: UIImage(named: "Макс")!, userPhotoLibrari: [UIImage(named: "Макс1")!, UIImage(named: "Макс2")!]),
    Users(name: "Павел", surname: "Фомин", userPhoto: UIImage(named: "Павел Фомин")!, userPhotoLibrari: [UIImage(named: "Павел Фомин")!, UIImage(named: "Павел Фомин1")!]),
    Users(name: "Азамат", surname: "Губайдулин", userPhoto: UIImage(named: "Азамат")!, userPhotoLibrari: [UIImage(named: "Азамат1")!, UIImage(named: "Азамат2")!]),
    Users(name: "Фарман", surname: "Эйвазов", userPhoto: UIImage(named: "Фарман")!, userPhotoLibrari: [UIImage(named: "Фарман1")!, UIImage(named: "Фарман2")!]),
    Users(name: "Маша", surname: "Макеева", userPhoto: UIImage(named: "Маша")!, userPhotoLibrari: [UIImage(named: "Маша1")!, UIImage(named: "Маша2")!]),
    Users(name: "Данил", surname: "Иркабаев", userPhoto: UIImage(named: "ДанилИ")!, userPhotoLibrari: [UIImage(named: "ДанилИ1")!, UIImage(named: "ДанилИ2")!]),
    Users(name: "Илья", surname: "Димитренко", userPhoto: UIImage(named: "Дмитрий Герасименко")!, userPhotoLibrari: [UIImage(named: "Дмитрий Герасименко1")!, UIImage(named: "Дмитрий Герасименко")!]),
    Users(name: "Данил", surname: "Куркин", userPhoto: UIImage(named: "ДанилК")!, userPhotoLibrari: [UIImage(named: "ДанилК1")!, UIImage(named: "ДанилК2")!]),
    Users(name: "Александр", surname: "Шереги", userPhoto: UIImage(named: "Александр Шереги")!, userPhotoLibrari: [UIImage(named: "Александр Шереги1")!, UIImage(named: "Александр Шереги2")!]),
    Users(name: "Колян", surname: "Кобзарев", userPhoto: UIImage(named: "Колян Кобзарев")!, userPhotoLibrari: [UIImage(named: "Колян Кобзарев1")!, UIImage(named: "Колян Кобзарев2")!])
]



