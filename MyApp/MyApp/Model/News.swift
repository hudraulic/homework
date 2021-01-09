//
//  News.swift
//  MyApp
//
//  Created by Владислав Капиносов on 04.01.2021.
//

import UIKit

struct News {
    let name: String
    let distc: String
    let icon: UIImage
    let imageNews: UIImage
}

var news = [
    News(name: "Переворот сознания", distc: "Человек может сделать из своей жизни всё, что ему заблагорассудится, — вечное исполнение долга, поле битвы, тюрьму, — но от этого ничего не изменится. И жизнь будет тем же, чем она является, когда полна красоты и счастья, — игройю", icon: UIImage(named: "Переворот в сознании")!, imageNews: UIImage(named: "Переворот в сознании1")!),
    News(name: "Apple", distc: "Когда пришёл за чехлом и стоишь, выбираешь, не можешь определиться", icon: UIImage(named: "Apple")!, imageNews: UIImage(named: "Apple1")!),
    News(name: "Apple", distc: "Биткоин пoставил новый рекoрд. Тeперь стоит $34 тыcяч", icon: UIImage(named: "Apple")!, imageNews: UIImage(named: "Apple2")!)
]

