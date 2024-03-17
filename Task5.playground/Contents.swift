import Foundation
/* 1.დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)*/
func mirroredStrings (chosenWord: String ) -> Bool {
    let reversedWord = String(chosenWord.reversed())
    return chosenWord == reversedWord
}
mirroredStrings(chosenWord: "აირევი ივერია")

/*2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას. */
func squareArray (array:[Int]) -> [Int] {
    var squaredArray = [Int]()
    for number in array {
        let squaredNumber = number * number
        squaredArray.append(squaredNumber)
        print(squaredArray)
    }
    return squaredArray
}
squareArray(array:[1,2,3,4] )

/* 3.დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.*/
let numbersArray = [1,2,3,4,5,6,7,8]
let evenNumbersclosure = numbersArray.filter { number in
    return number % 2 == 0
}
print(evenNumbersclosure)

/* 4.დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება. */
let sumOfArrayPrinterClosure = { (sum: Int) in
    print(sum)
}
func sumOfArray(newArray: [Int], closure: @escaping (Int) -> ()) {
    var sum = 0
    for number in newArray {
        sum += number
    }
    DispatchQueue.main.asyncAfter(deadline: .now()+5) {
        closure(sum)
    }
}
sumOfArray(newArray: [1, 2, 3], closure: sumOfArrayPrinterClosure)

/* 5.შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი*/
var contacts: [String: Int] = [
    "ana": 595462121,
    "mari": 895462121
]
print(contacts.keys)
contacts["datuna"] = 795462121
print(contacts.keys)
contacts.removeValue(forKey: "ana")
print(contacts.keys)

/* 6.დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.*/
func arrangeAlphabetically(dictionary:[String: Int]) -> [String] {
    let sortedKeys = dictionary.keys.sorted()
    return sortedKeys
}
let siblings = [
    "ana": 18,
    "mari": 20,
    "datuna": 11
]
let sortedKeys = arrangeAlphabetically(dictionary: siblings)
arrangeAlphabetically(dictionary: siblings)

/* 7.შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.*/
var arrayOfDoubles = [1.2, 3.4, 2.3, 0.7, 5.6]
var largestNumber = arrayOfDoubles[0]
for number in arrayOfDoubles {
    if number > largestNumber {
        largestNumber = number
    }
}
print(largestNumber)


//Optional:
let lelaWhatMovementIsThis: [String: Int] = [
    "ღამის სიჩუმე გაფანტე": 235,
    "ვიხსენებ ყველაფერს თავიდან": 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193
    
]
/*1.დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში*/
func lelaBeingIconic(lelaWhatMovementIsThis: [String: Int]) -> (minutes: Int, seconds: Int) {
    var durationOfSongsInSeconds = 0
    for value in lelaWhatMovementIsThis.values {
        durationOfSongsInSeconds += value
    }
    let totalMinutes = durationOfSongsInSeconds / 60
    let remainingSecondes = durationOfSongsInSeconds % 60
    return (totalMinutes,remainingSecondes)
}
print(lelaBeingIconic(lelaWhatMovementIsThis: lelaWhatMovementIsThis))

/* 2.დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.*/   //ეს ვერ გავაკეთე :( ვტვირთავ და ჩავუჯდები კიდე
//func longestAndSortestSong(lelaWhatMovementIsThis: [String: Int]) {
//    let sortedValues = lelaWhatMovementIsThis.values.sorted()
//    var shortestSong = sortedValues[0]
//    var longestSong = sortedValues.last
//}
//longestAndSortestSong(lelaWhatMovementIsThis: lelaWhatMovementIsThis)

/* 3.დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას*/
func averangeDuration(lelaWhatMovementIsThis: [String: Int]) -> Double {
    var durationOfSongsInSeconds = 0
    for value in lelaWhatMovementIsThis.values {
        durationOfSongsInSeconds += value
    }
    let average = Double(durationOfSongsInSeconds) / Double(lelaWhatMovementIsThis.count)
    return average
}
let averageLenght = averangeDuration(lelaWhatMovementIsThis: lelaWhatMovementIsThis)
print(averageLenght)

/* 4.დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს*/
func randomSongName(lelaWhatMovementIsThis: [String: Int])  {
    var songName = Array(lelaWhatMovementIsThis.keys)
    let randomIndex = Int.random(in: 0..<lelaWhatMovementIsThis.count)
    let randomSong = songName[randomIndex]
    print(randomSong)
}
randomSongName(lelaWhatMovementIsThis: lelaWhatMovementIsThis)

