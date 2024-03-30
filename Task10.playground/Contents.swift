import Cocoa
/*თქვენი დავალებაა კარგათ გაერკვეთ როგორ მუშაობს ARC სხვადასხვა იმპლემენტაციების გამოყენებით.
 
 1. შექმენით ციკლური რეფერენცები და გაწყვიტეთ
 2.აუცილებელია ქლოჟერების გამოყენება
 3.აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)
 4.აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
 5.დაიჭირეთ self ქლოჟერებში
 6.გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით */


/*
 1. კი თითო თითო ყველა ვარიანტი
 2. ქლოჟერი ცალკე დაწერე რაიმე მარტივი მაგალითი სადაც self-ს დაიჭერ
 3. რასაკვირველია, მანდ უნდა დაგეჭირათ ის მომენტი რომ ველიუ ტიპის გამოყენებით ციკლის გაწყვეტა შეგიძლიათ
 პროტოკოლების გამოყენებით შეგიძლიათ შექმნათ ფროფერთები და დაუქვემდებაროთ რომელიმე კლასს. მანდ იდეა ის არის რომ გაწყვიტოთ strong hold
 */

//strong reference cycle
class Concert {
    let name: String
    var ticket: Ticket?
    
    init(name: String, ticket: Ticket? = nil) {
        self.name = name
        self.ticket = ticket
    }
    
    deinit {
        print("\(name) is deallocated")
    }
}

class Ticket {
    let seat: UInt
    var concert: Concert?
    
    init(seat: UInt, concert: Concert? = nil) {
        self.seat = seat
        self.concert = concert
    }
    deinit {
        print("\(seat) is deallocated")
    }
}
var concert: Concert? = Concert(name: "იუმორინა")
var ticket: Ticket? = Ticket(seat: 17)
concert?.ticket = ticket
/*ticket = nil    */  //აქ დელოკაცია არ მოხდება რადგან 1 მიმთითებელი კიდე მაქვს
ticket?.concert = concert

concert?.ticket = nil
ticket?.concert = nil

concert = nil
ticket = nil


//closure weak self
class Workout {
    let exercise: String
    lazy var startOfWorkout: () -> Void = {
        [weak self] in
        guard let self = self else { return }
        print("now doing \(exercise)")
    }
    
    init(exercise: String) {
        self.exercise = exercise
    }
    
    deinit {
        print("\(exercise) is deallocated")
    }
}

var workout1: Workout? = Workout(exercise: "Deadlift")
workout1?.startOfWorkout
workout1 = nil




// weak references
class Person {
    var name: String
    var car: Car?
    
    init(name: String, car: Car? = nil) { self.name = name }
    
    deinit {
        print("\(name) is deallocated")
    }
}


class Car {
    var brand: String
    weak var owner: Person?
    
    init(brand: String, owner: Person? = nil) {
        self.brand = brand
        self.owner = owner
    }
    deinit {
        print("\(brand) is deallocated")
    }
}

var person1: Person? = Person(name: "ana")
var car1: Car? = Car(brand: "ferrari")
var copyOfOwner = person1  // დამატებითი reference
person1 = nil
car1 = nil
copyOfOwner = nil  // დამატებითის წაშლა ისე არ იმუშავებს


//unowned references
class Cinema {
    let name: String
    var films: [Film] = []
    
    lazy var filmsSeances: () -> Void = {
        [unowned self] in
        print("available Films:")
        for film in films {
            print("\(film.name)")
        }
    }
    init(name: String, films: [Film]) {
        self.name = name
        self.films = films
    }
    deinit{
        print("\(name) is deallocated")
    }
}

protocol forKids {
    var name: String { get }
    var cinema: Cinema { get }
}

class Film: forKids {
    let name: String
    unowned var cinema: Cinema
    init(name: String, cinema: Cinema) {
        self.name = name
        self.cinema = cinema
        cinema.films.append(self)
    }
    deinit {
        print("\(name) is deallocated")
    }
}

var cinema: Cinema? = Cinema(name: "ამირანი", films: [])
let movie1 = Film(name: "Monster in Paris", cinema: cinema!)
let movie2 = Film(name: "Sing", cinema: cinema!)

cinema?.filmsSeances()
cinema = nil

//ცოტა ვერ გავერკვიე რას ითხოვდა კიდე value type-ით ჰო არაა ARC მათთან უბრალოდ რატომ ვერ ექნება referencები იმას დავწერ
enum AnimalType {
    case mammal, bird, reptile, fish, amphibian,invertebrate
}
struct Animal {
    var animal: String
    var type: AnimalType
}

var animal1 = Animal(animal: "Lion", type: .mammal)
var animal2 = animal1.animal
animal1.animal = "monkey"

print("Animal1: \(animal1.animal) is \(animal1.type)")
print("Animal2:\(animal2)")
//პირველს აკოპირებს მეორე საერთოდ სხვა მისამართზე მიაქვს და იქ ახდენს ცვლილებას, ხოლო კლასში რადგან ის დამკვირვებელი ტიპია ახალი მიმთითებელი ხდება იგივე ობიექტზე, იმავე მისამართზე
