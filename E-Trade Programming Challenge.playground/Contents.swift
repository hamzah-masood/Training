import UIKit

var string = "Hello, playgroundl"


let newString = "abbcdegggg"
var counters = [Character: Int]()

for c in newString {
    if let count = counters[c] {
        counters[c] = count + 1
    } else {
        counters[c] = 1
    }
}

print(counters)

//let maxElement = counters.reduce(counters.first!) { $1.1 > $0.1 ? $1 : $0 }

var maxElement = counters.max(by: {a, b in a.value < b.value})

print(maxElement ?? 0)
