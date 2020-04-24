import UIKit

//var str = "Hello, playground"
//
//let oneMillion = 1_000_000
//let oneThousand = oneMillion / 0_1_0_0_0
//print(oneThousand)
//let one = ["a","b","c"]
//let two = ["d", "e", "f", "g", "h"]

let a = "abc"
let b = "defgh"

let one = Array(a)
let two = Array(b)

var result: [Character] = []

let count = max(one.count, two.count)

for i in 0..<count {
    if (i < one.count){
        result.append(one[i])
    }
    if (i < two.count){
        result.append(two[i])
    }
}
let realResult = String(result)
print(result)



var height = [1 ,1 ,3 , 4, 1]

var sortedHeight = height.sorted()

print(sortedHeight)
var missingStudents: Int = 0

for i in 0..<height.count {
    if height[i] != sortedHeight[i]{
        print(height[i])
        print(sortedHeight[i])
        missingStudents += 1
    }
}

print(missingStudents)
