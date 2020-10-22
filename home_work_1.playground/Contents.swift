import Foundation

//a*(x^2) + b*x + c = 0
let a: Double = 2
let b: Double = 5
let c: Double = 2
var d = (pow(b, 2)) - (4 * a * c)
if d >= 0 {
    d = sqrt(d)
    let x1 = (-b + d) / (2 * a)
    let x2 = (-b - d) / (2 * a)
    print("Ответы: \(x1), \(x2)")
} else {
    print("Решения нет")
}


let katitA: Double = 3
let katitB: Double = 4

let gipo = sqrt(pow(katitA, 2) + pow(katitB, 2))
let per = katitA + katitB + gipo
let area = (katitA * katitB) / 2

print("Гепотинуза равна \(gipo)\nПериметр равен \(per)\nПлощадь треугольника равна \(area)")


var deposit: Float = 10000
let prosent: Float = 5
let profit: Float = prosent / 100
var i = 1
print("Изменение размера вклада по годам:")

for _ in i...5 {
    deposit = deposit + (deposit * profit)
    print("\(i) год: \(deposit) рублей")
    i += 1
}
    

