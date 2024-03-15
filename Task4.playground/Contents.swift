import Foundation
/* 1.while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.*/
var number = 1
var productOfOddNumbers = 1
while number <= 20 {
    if number % 2 != 0 {
        productOfOddNumbers *= number
    }
    number += 1
}
print(productOfOddNumbers)

/* 2.შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”*/
let word = "ჰიდროელექტროსადგური"
var reversedWord = ""
for character in word {
    reversedWord = "\(character)" + reversedWord
}
print(reversedWord)

/* 3.while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."*/
//var trafficLight = 1
//while true {
//    switch trafficLight {
//    case 1:
//        print("🔴")
//        trafficLight = 2
//    case 2:
//        print("🟡")
//        trafficLight = 3
//    case 3:
//        print("🟢")
//        trafficLight = 1
//    default:
//        break
//    }
//}

/* 4.Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”*/
var tickets = 20
while tickets > 0 {
    print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(tickets)")
    tickets -= 1
    if tickets == 0 {
        print("ყველა ბილეთი გაყიდულია გელოდებით kanye west-ის კონცერტზე 💀")
    }
}

/* 5.შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)*/

let array1 = [1,7,11,23,19,21,-7,13,19,22,56,13,17]
func infoAboutElementsInArray1(of array1: [Int]) -> String {
    let set = Set(array1)
    if set.count == array1.count {
        return "array-ში ყველა ელემენტი განსხვავებულია"
    } else {
        return "array შეიცავს მსგავს ელემენტებს"
    }
}
print(infoAboutElementsInArray1(of: array1))

// set-ის გარეშე
func check (array: [Int]) -> String {
    for i in 0..<array.count {
        for j in (i + 1)..<array.count {
            if array[i] == array[j] {
                return "array შეიცავს მსგავს ელემენტებს"
            }
        }
    }
    return "array-ში ყველა ელემენტი განსხვავებულია"
}

print(check(array: array1))
print(check(array: [2,3,4,]))


/* 6.დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას*/
let differenceOfNumbers: (Int,Int)-> Int = { number1,number2 in
    number1 - number2
}
let result = differenceOfNumbers(28,7)
print(result)

/* 7.დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.*/

func consonantsCount(in string: String) {
    let charactersToRemove: [Character] = ["a","e","i","o","u","A","E","I","O","U"," "]
    var consonants = ""
    for char in string {
        if !charactersToRemove.contains(char) {
            consonants.append(char)
        }
    }
    var consonantsCount = 0
    for char in consonants {
        consonantsCount += 1
    }
    print("consonants: \(consonantsCount)")
}
let quotes = "Nothing is impossible"
consonantsCount(in: quotes)


//optional
/* 1.შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.*/
let array2 = [8, 4, 9, 9, 0, 2]
let array3 = [1, 0, 9, 2, 3, 7, 0, 1]
let combinedArray = array2 + array3
func bubbleSort (arr:[Int]) -> [Int]
{
    var array5 = arr
    for _ in 0..<array5.count - 1
    {
        for j in 0..<array5.count - 1
        {
            if (array5[j] > array5[j+1])
            {
                let temp = array5[j]
                array5[j] = array5[j+1]
                array5[j+1] = temp
            }
        }
    }
    return array5
}
print(bubbleSort(arr: combinedArray))

/* 2.დაწერეთ ფუნქცია, რომელსაც გადააწვდით int ტიპის პარამეტრს. გამოითვალეთ ამ პარამეტრის ფაქტორიალი და დაბეჭდეთ*/
func factorial( n: Int) {
    var result1 = 1
    if n < 0 {
        print("არ არსებობს")
        return
    } else if n == 0 {
        print("0! = 1")
    }
    for i in 1...n {
        result1 *= i
    }
    print("\(n)! = \(result1)")
}
factorial(n: 3)

/* 3.შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.
*/
let numbersArray = [0,1,2,3,4,5,6,7,8,9,10]
var oddNumbersArray: [Int] = []
var evenNumbersArray: [Int] = []
for number in numbersArray {
    if number % 2 == 0 {
        evenNumbersArray.append(number)
    } else {
        oddNumbersArray.append(number)
    }
}
print(evenNumbersArray)
print(oddNumbersArray)



