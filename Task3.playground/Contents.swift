import Foundation
/*1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ნამრავლი.*/
var number = 7
var number1 = 11
var number2 = 19
var productOfNumbers = number * number1 * number2
print(productOfNumbers)

/*2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი ლუწია თუ კენტი ტერნარი ოპერატორით.*/
var number3: Int
number3 = 21
let result = number3 % 2 == 0 ? "ლუწია":"კენტია"
print(result)

/*3. შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა. If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ*/
let myName: String?
myName = "ანა"
if let myName {
    print(myName)
}
print(myName)

/*4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის სასურველი მნიშვნელობა. If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის წაღება არ დამავიწყდეს”, სხვა შემთხვევაში “დღეს ქოლგა არ დამჭირდება”.*/
var isRaining = true
if isRaining == true {
    print("ქოლგის წაღება არ დამავიწყდეს")
}else{
    print("დღეს ქოლგა არ დამჭირდება")
}

/*5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია”  */
var a = 13
var b = 25
if a > b {
    print("a მეტია")
}else{
    print("b მეტია")
}

/*6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს მნიშვნელობა.  */
let firstLetterOfMyName: Character = "ა"
print(firstLetterOfMyName)

/*7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე ციფრისგან შემდგარი*/
var twoDigitNumber = 77
let result1 = twoDigitNumber % 10 == twoDigitNumber / 10 % 10 ? "არის":"არ არის"
    print("\(result1) ერთიდაიმავე ციფრისგან შემდგარი")

/*8. აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად.*/
var numberOfMonths = 9
if numberOfMonths <= 2 || numberOfMonths >= 12 {
    print("ზამთარი")
} else if numberOfMonths >= 3 && numberOfMonths <= 5 {
    print("გაზაფხული")
} else if numberOfMonths >= 6 && numberOfMonths <= 8 {
    print("ზაფხული")
} else {
    print("შემოდგომა")
}

/*9. შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”, თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”*/
var newNumber = 144
if newNumber % 3 == 0 && newNumber % 4 == 0  {
    print("იყოფა 3-ზე და 4-ზე")
} else if newNumber % 4 == 0 {
    print("იყოფა 4-ზე")
} else if  newNumber % 3 == 0 {
    print("იყოფა 3-ზე")
}

/*10. შექმენით ორი რიცხვითი ცვლადი num1, num2 და რაიმე String ტიპის ცვლადი რომელსაც ტერნარული ოპერატორის საშუალებით მიანიჭებთ “თანაბრად დაშორებულია ნულიდან” / “არ არის თანაბრად დაშორებული ნულიდან” შესაბამის მნიშვნელობას რომელსაც აკმაყოფილებს მოცემული ორი ცვლადი */
var num1 = 13
var num2 = -13
let distanteFromTheCoordinateOrigin = num1 == num2 || num1 == -num2 || -num1 == num2 ? "თანაბრად დაშორებულია ნულიდან":"არ არის თანაბრად დაშორებული ნულიდან"
print(distanteFromTheCoordinateOrigin)
