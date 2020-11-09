import Foundation

protocol Player {
    
    var name: String { get }
    var age: Int { get }
    
}

struct Queue<T: Player> {
    
    private var elements: [T] = []
    
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    func arrayName() -> [String] {
        var array = [String]()
        elements.forEach {
            array.append($0.name + "_GB")
        }
        return array
    }
    
    func arrayAge() -> [Int] {
        var array = [Int]()
        elements.forEach {
            array.append($0.age)
        }
        return array.sorted()
    }
    
    subscript(index: Int) -> T? {
        guard elements.count > 0, index >= 0, index < elements.count else { return nil }
        print("Имя - \(elements[index].name), возраст \(elements[index].age)")
        return elements[index]
    }
    
    subscript(first: Int, last: Int) -> Int? {
        var summAge = 0
        guard elements.count > 0, last < elements.count, first >= 0 else { return nil }
        for index in first...last {
            summAge += elements[index].age
        }
        let averageAge = summAge / (last + 1)
        print("В среднем студентам \(averageAge) года")
        return averageAge
    }
}

class Student: Player {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let s1 = Student(name: "Vlad", age: 25)
let s2 = Student(name: "Oleg", age: 22)
let s3 = Student(name: "Olga", age: 24)
let s4 = Student(name: "Alex", age: 20)
let s5 = Student(name: "Max", age: 30)
var students = [s1, s2, s3, s4, s5]
var queueOfstudents = Queue<Student>()
students.forEach{queueOfstudents.push($0)}
let arrayName = queueOfstudents.arrayName()
print(arrayName)
let arrayAge = queueOfstudents.arrayAge()
print(arrayAge)
queueOfstudents[0]
queueOfstudents[0,4]











