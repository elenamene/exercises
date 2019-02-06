// Sum of Fractions

// The greatest common divisor (or Greatest Common Factor) of two numbers a and b
// is the largest positive integer that divides both a and b without a remainder

// Method 1: Euklid's algorithm
func gcdIterativeEuklid(_ a: Int, _ b: Int) -> Int {
    var maxN = max(a, b)
    var minN = min(a, b)
    var r = maxN % minN
    
    while r != 0 {
        maxN = minN
        minN = r
        r = maxN % minN
    }
    
    return minN
}

// Method 2
func gcd(a: Int, b: Int) -> Int {
    if a == b {
        return a
    } else {
        if a > b {
            return gcd(a: a - b, b: b)
        } else {
            return gcd(a: a, b: b - a)
        }
    }
}

// Calculate the sum of two fractions where each fraction is represented by a tuple

func sumOf(_ a: (num: Int, den: Int), _ b: (num: Int, den: Int)) -> (num: Int, den: Int) {
    let commonDenominator = a.den * b.den
    let sumNumerator = a.num * b.den + b.num * a.den
    let gcd = gcdIterativeEuklid(sumNumerator, commonDenominator)
    let sum = (sumNumerator / gcd, commonDenominator / gcd)
    
    return sum
}

// Example

//  5     1
//  -  +  -
//  8     4

var a = (num: 5, den: 8)
var b = (num: 1, den: 4)
let sum = sumOf(a, b)
