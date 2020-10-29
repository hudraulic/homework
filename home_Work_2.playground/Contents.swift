import Foundation

func division (dividend x: Int, divider y: Int) -> Bool {
    return x % y == 0
}
division(dividend: 6, divider: 3)


var array = Array(1...100)
/*for i in 1...100 {
    array.append(i)
}*/
print(array)


var filterArray = array.filter {$0 % 2 != 0 && $0 % 3 == 0}
print(filterArray)


func fibonacciArray(_ n: Int) -> [Double] {
    var fibonacci: [Double] = [0,1]
    for i in 2..<n {
        fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
    }
    return fibonacci
}
let fibArray = fibonacciArray(100)
print(fibArray)
fibArray.count







