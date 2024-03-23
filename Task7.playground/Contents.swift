import Cocoa
/* 1.შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.*/
enum WeekDay {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    func workdayOrWeekend() {
        switch self {
        case .saturday, .sunday:
            print("\(self) = weekend")
        default:
            print("\(self) = workday")
        }
    }
}

/* 2.შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს.*/
enum GialoSquad {
    case TsigroviManto, MoshishvlebuliMkerdi, TuGapatio
    
    var price: Int {
        switch self {
        case .TsigroviManto:
            10_000
        case .MoshishvlebuliMkerdi:
            5_000
        case .TuGapatio:
            1_000
        }
    }
    func pricePrint() {
        switch self {
        case .TsigroviManto:
            print("TsigroviManto თვეში \(price)$")
        case .MoshishvlebuliMkerdi:
            print("MoshishvlebuliMkerdi თვეში \(price)$")
        case .TuGapatio:
            print("TuGapatio თვეში \(price)$")
        }
    }
}

/* 3.შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.*/
enum Weather {
    case sunny(celsius: Int)
    case cloudy(celsius: Int)
    case rainy(celsius: Int)
    case snowy(celsius: Int)
}

func whatToWear(weather: Weather) -> String {
    switch weather {
    case .sunny(let celsius) where celsius >= 25:
        "კაი \"მაიჩნი\" რამე 🔥"
    case .sunny:
        "ჩაიცვი თხელი მაისური ☀️"
    case.cloudy(let celsius) where celsius >= 15:
        "ჟაკეტიც გეყოფა ⛅️"
    case .cloudy(celsius: let celsius):
        "ქურთუკი და ქოლგაც არ დაგავიწყდეს ☁️"
    case .rainy(celsius: let celsius):
        "საწვიმარი და ქოლგა არ დაგავიწყდეს! 🌧️ "
    case .snowy(celsius: let celsius):
        "ხელთათმანები და ქუდი არ დაგავიწყდეს ❄️"
    }
}
print(whatToWear(weather: .sunny(celsius: 40)))

/* 4.შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.*/
struct Kanye {
    let album: String
    let releaseYear: Int
}
var kanyeArray = [Kanye]()
kanyeArray = [
    Kanye.init(album: "Donda", releaseYear: 2021),
    Kanye.init(album: "JESUS IS KIN", releaseYear: 2019),
    Kanye.init(album: "Ye", releaseYear: 2018),
    Kanye.init(album: "The Life of Pablo", releaseYear: 2016),
    Kanye.init(album: "Yeezus", releaseYear: 2013),
    Kanye.init(album: "Vultures 1", releaseYear: 2024)
]

func albumsAfterYear(year: Int) {
    for album in kanyeArray {
        if album.releaseYear > year {
            print(album.album, album.releaseYear)
        }
    }
}
albumsAfterYear(year: 2018)

/* 5. შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა */
@propertyWrapper
struct cachedDate {
    lazy var value: String = self.initializer()
    let initializer: () -> String
    init(wrappedValue initializer: @escaping @autoclosure () -> String) {
        self.initializer = initializer
    }
    var wrappedValue: String {
        mutating get {
            value
        }
    }
}
struct newStruct {
    @cachedDate var cachedData = "lazy ინიციალიზებულია"
}
var dataStatus = newStruct()
print(dataStatus.cachedData)

/* optional
 ბარბარემ გადაწყვიტა პროგრამირებასთან ერთად დამატებითი სამსახური დაეწყო და ტაროს სამკითხაო ჯიხური გახსნა. მისი სახელი უცებ გავარდა და ქართველი ვარსკვლავების ყურამდეც მივიდა. ერთ დღეს მას ჯიხურში ძალიან ნაცნობი სახეები გამოეცხადა, ბედინა და შავი პრინცი. პროფესიონალმა ნათელმხილველმა გაშალა კარტი და დაიწყო მათ მომავალში ხელების ფათური. ბარბარეს ტაროს დასტა საკმაოდ უნიკალურია, ის მხოლოდ 12 კარტს შეიცავს - Star, Empress, Tower, Hanged Man, Chariot, Moon, Hierophant, Devil, Lovers, Wheel of Fortune, Fool, Magician და მათ აღწერებს -
 შექმენით Enum სახელად TarotCard და განსაზღვრეთ მასში 12 კარტის ქეისი.
 
 შექმენით სტატიკური მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტს შერჩევითად
 
 შექმენით მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტის აღწერას string-ის სახით
 
 შექმენით სტრუქტურა სახელად TarotReading. გაუწერეთ ფროფერთიები წარსული, აწმყო და მომავალი. გაუკეთეთ ინიციალიზაცია ამ ფროპერთიებს რათა მათ მიიღონ შერჩევითი ტაროს კარტის აღწერის მნიშვნელობა.
 
 შექმენით მეთოდი TarotReading-ში, რომელიც დაბეჭდავს ამ სამ არჩეულ ტაროს კარტს.
 */
enum TarotCard {
    case star
    case empress
    case tower
    case hangedMan
    case chariot
    case moon
    case hierophant
    case devil
    case lovers
    case wheelOfFortune
    case fool
    case magician
    
    static func randomCard() -> TarotCard {
        let allCards: [TarotCard] = [.wheelOfFortune, .chariot, .devil, .empress, .fool, .hangedMan, .hierophant, .lovers, .magician, .moon, .star, .tower]
        let index = Int.random(in: 0...11)
        return allCards[index]
    }
    
    func meaning() -> String {
        switch self {
        case .star:
            " star: წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას."
        case .empress:
            "empress: განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში."
        case .tower:
            "tower: ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის."
        case .hangedMan:
            "hangedMan: წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს."
        case .chariot:
            "chariot:განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით."
        case .moon:
            "moon: აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს."
        case .hierophant:
            "hierophant:წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან."
        case .devil:
            "devil: განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას"
        case .lovers:
            " lovers: აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით."
        case .wheelOfFortune:
            "wheelOfFortun: წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია."
        case .fool:
            "fool: განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას."
        case .magician:
            "magician: აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით."
        }
    }
}
struct TarotReading {
    let past: String
    var present: String
    var future: String
    
    init() {
        past = TarotCard.randomCard().meaning()
        present = TarotCard.randomCard().meaning()
        future = TarotCard.randomCard().meaning()
    }
    func printChoosenCard() {
        print("past: \(past)")
        print("Present: \(present)")
        print("future: \(future)")
    }
}
let bedinasReading = TarotReading()
bedinasReading.printChoosenCard()
