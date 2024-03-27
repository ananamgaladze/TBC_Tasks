import Cocoa
/* 1.შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)*/
enum Gender {
    case female
    case male
}

/* 2.შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender */
protocol SuperBeing {
    var name: String { get }
    var strength: Int { get set }
    var speed: Int { get set }
    var weakness: String { get }
    var gender: Gender { get  }
}
/* 3.SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა*/
extension SuperBeing {
    var strength: Int { 100 }
    var speed: Int { 120 }
}
/* 4.შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.*/
/* 5.გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String*/
class Superhero: SuperBeing {
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    var gender: Gender
    var outfitColor: String
    var equipment: String
    var vehicle: String
    
    init(name: String, weakness: String, gender: Gender, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
        self.speed = 120
        self.strength = 100
    }
    /* 6.გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს -
     “‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).*/
    func rescue(victimName: String){
        print("'\(name)' არ შეუშინდა სახიფათო სიტუაციას და '\(victimName)' გადაარჩინა სიკვდილს")
    }
    /* 7.გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -
     “‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)*/
    func combat(superVillain: SuperVillain) {
        print("‘\(name)’ შეერკინა და დაამარცხა ‘\(superVillain.name)’")
        
    }
}

class SuperVillain: SuperBeing {
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    var gender: Gender
    /* 8.გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String*/ //(აქ ბარემ extension-ს გამოვიყენებ.)*/
    var evilScheme: String = ""
    var obsession: String = ""
    var rivalry: String = ""
    
    init(name: String, strength: Int, speed: Int, weakness: String, gender: Gender) {
        self.name = name
        self.strength = strength
        self.speed = speed
        self.weakness = weakness
        self.gender = gender
    }
    /* 9.გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -
     “ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)*/
    func attack(superhero: Superhero) {
        print("'\(name)'გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა '\(superhero.name)' მის შეჩერებას თუ შეძლებს")
    }
    /* 10.გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
     “‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)*/
    func experimentation(subjet: String) {
        print("‘\(name)’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘\(subjet)’ აღმოჩნდა")
    }
}

/* 11.შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან*/
let hero = Superhero(name: "ბიძინა თაბაგარი", weakness: "ლუდი", gender: .male, outfitColor: "შავი", equipment: "პესტალეტი", vehicle: "024")
let hero1 = Superhero(name: "ლექსო ნიჟარაძე", weakness: "ქეთი", gender: .male, outfitColor: "ამერიკულ ფერებში", equipment: "hot_dog", vehicle: "024")
let hero2 = Superhero(name: "რეზო ქათამაძე", weakness: "ძალაუფლების წყურვილი და ტკბილი", gender: .male, outfitColor: "მთავრობის შესაფერისი", equipment: "კროსვორდები", vehicle: "024")
let hero3 = Superhero(name: "ქეთი", weakness: "სიყვარული", gender: .female, outfitColor: "წითელი", equipment: "", vehicle: "024")
let hero4 = Superhero(name: "სვეტლანკა", weakness: "აბანოები", gender: .female, outfitColor: "🫢", equipment: "სურვილისამებრ", vehicle: "სულ ნაირ-ნაირები")


let villain = SuperVillain(name: "გურამ ჯინორია", strength: 24, speed: 24, weakness: "თაბაგარი", gender: .male)
let villain1 = SuperVillain(name: "დონარა ჭყონია", strength: 100, speed: 30, weakness: "გურამი", gender: .female)
let villain2 = SuperVillain(name: "გელა ხრამიშვილი", strength: 100, speed: 25, weakness: "განდიდების მანია", gender: .male)
let villain3 = SuperVillain(name: "ჰასან ცეცხლაძე", strength: 100, speed: 100, weakness: "კოშკა", gender: .male)
let villain4 = SuperVillain(name: "უჩა ზერაგია", strength: 1000, speed: 1000, weakness: "კახელზე ანეგდოტი", gender: .male)


hero1.rescue(victimName: "ჯინორია")
hero.combat(superVillain: villain4)
villain3.attack(superhero: hero1)
villain1.experimentation(subjet: "მესაფლავე")

// -------Optional--------
/* 1.დაწერეთ ჯენერიკ ფუნქცია compareSwiftness რომელიც იღებს მხოლოდ ორ პარამეტრს პირველ და მეორე სუპერგმირებს რომლებიც დაქვემდებარებულები იქნებიან SuperBeing პროტოკოლზე, ფუნქცია უნდა აბრუნებდეს სტრინგს
   2.ფუნქციის ბადიში შეამოწმეთ speed მნიშვნელობები ორივე სუპერგმირის
   3.დააბრუნეთ სტრინგი აღწერით თუ რომელი სუპერგმირია უფრო სწრაფი (გაითვალისწინეთ ისიც თუ სიჩქარეები ერთმანეთის ტოლია)*/

let champangnePapi = SuperVillain(name: "დრეიკი", strength: 123, speed: 100, weakness: "", gender: .male)
let sandomisNamcxvari = SuperVillain(name: "ლექს-სენი", strength: 120, speed: 100, weakness: "", gender: .male)

func compareSwiftness<T: SuperBeing>(champangnePapi: T, sandomisNamcxvari: T) -> String {
    let drakeSpeed = champangnePapi.speed
    let leksenSpeed = sandomisNamcxvari.speed
    switch true {
    case drakeSpeed > leksenSpeed:
        return  "\(champangnePapi.name) სწრაფია \(sandomisNamcxvari.name)-ზე"
    case leksenSpeed > drakeSpeed:
        return  "\(sandomisNamcxvari.name) სწრაფია \(champangnePapi.name)-ზე"
    default:
        return  "ორივეს ერთნაირი სიჩქარე აქვს"
    }
}
print(compareSwiftness(champangnePapi: champangnePapi, sandomisNamcxvari: sandomisNamcxvari))

