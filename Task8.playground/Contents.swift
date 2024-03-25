import Cocoa
/* 1.შევქმნათ Class Book.
 -Properties: bookID(უნიკალური იდენტიფიკატორი String), String title, String author, Bool isBorrowed.
 -Designated Init.
 -Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
 -Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.*/
class Book {
    let bookID: UUID
    let title: String
    let author: String
    var isBorrowed: Bool
    
    init(bookID: UUID = UUID(), title: String, author: String, isBorrowed: Bool = false) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    func markBorrowed() {
        isBorrowed = true
    }
    
    func markReturned()  {
        isBorrowed = false
    }
}

/* 2.შევქმნათ Class Owner
 
 Properties: ownerId(უნიკალური იდენტიფიკატორი String), String name, Books Array სახელით borrowedBooks.
 Designated Init.
 Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
 Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.
 */
class Owner {
    let ownerID: UUID
    let name: String
    var borrowedBooks: [Book]
    
    init(ownerID: UUID = UUID(), name: String, borrowedBooks: [Book] = []) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowBook(book: Book){
        borrowedBooks.append(book)
        book.markBorrowed()
    }
    
    func returnBook(book: Book) {
        for index in 0..<borrowedBooks.count {
            if borrowedBooks[index].bookID == book.bookID {
                borrowedBooks.remove(at: index)
                book.markReturned()
                return
            }
        }
        
    }
}

/* 3.შევქმნათ Class Library
 Properties: Books Array, Owners Array.
 Designated Init.
 Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
 Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
 Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
 Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
 Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
 Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
 Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.*/
class Library {
    var booksArray: [Book]
    var ownersArray: [Owner]
    
    init(booksArray: [Book] = [], ownersArray: [Owner] = []) {
        self.booksArray = booksArray
        self.ownersArray = ownersArray
    }
    
    func addBook(newBook:Book) {
        booksArray.append(newBook)
    }
    
    func addOwner(owner: Owner) {
        ownersArray.append(owner)
    }
    
    func availableBooks() -> [Book] {
        var availableBooks = [Book]()
        for book in booksArray {
            if !book.isBorrowed {
                availableBooks.append(book)
            }
        }
        return availableBooks
    }
    
    func takenBooks() -> [Book] {
        var takenBooks = [Book]()
        for book in booksArray {
            if book.isBorrowed {
                takenBooks.append(book)
            }
        }
        return takenBooks
    }
    
    func findOwner(ownerID: UUID) -> Owner? {
        var foundOwner: Owner? = nil
        for owner in ownersArray {
            if owner.ownerID == ownerID {
                foundOwner  = owner
                break
            }
        }
        return foundOwner
    }
    func bookTakenBy(owner: Owner) -> [Book] {
        owner.borrowedBooks
    }
    
    func takeBook(book: Book, owner: Owner) { book.isBorrowed ? print("თავისუფალი არ არის") : owner.borrowBook(book: book)
    }
}

/* 4.გავაკეთოთ ბიბლიოთეკის სიმულაცია.
 -შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
 -დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
 -წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
 -დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და ამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ. */
let library = Library()
let book1 = Book(title: "ვეფხისტყაოსანი", author: "შოთა რუსთაველი")
let book2 = Book(title: "გამზრდელი", author: "აკაკი წერეთელი")
let book3 = Book(title: "მამაკაცის სურნელი", author: "ლალი მოროშკინა")
library.addBook(newBook: book1)
library.addBook(newBook: book2)
library.addBook(newBook: book3)
let owner1 = Owner(name: "ანა ნამგალაძე")
let owner2 = Owner(name: "საფარ-ბეგი")
library.addOwner(owner: owner1)
library.addOwner(owner: owner2)
library.takeBook(book: book1, owner: owner1)
library.takeBook(book: book2, owner: owner2)
library.takeBook(book: book1, owner: owner2)
library.takeBook(book: book3, owner: owner1)
library.bookTakenBy(owner: owner1)
owner1.returnBook(book: book1)
print("\n------წაღებული წიგნები------")
for book in library.takenBooks() {
    print("\"\(book.title)\" - \(book.author)")
}

print("\n------ხელმისაწვდომი წიგნები------")
for book in library.availableBooks() {
    print("\"\(book.title)\" - \(book.author)")
}


let someonesBooks = library.bookTakenBy(owner: owner2)
print("\nმფლობელი:\(owner2.name)")
for book in someonesBooks {
    print("\"\(book.title)\" - \(book.author)")
}

print("\n------IDtest------")
library.findOwner(ownerID: owner2.ownerID)
if let foundOwner = library.findOwner(ownerID: owner1.ownerID ) {
    print(foundOwner.name)
} else {
    print("მომხმარებელი ვერ მოიძებნა")
}

/*Optional:
 -შექმენით კლასი გამონათქვამების გენერატორი, სადაც განმარტავთ გამონათქვამს-ს რომელიც იქნება სტრინგებისგან შემდგარი კოლექცია.
 -შექმენით მეთოდი სადაც დააბრუნებთ შერჩევითად სხვადასხვა ჯოუქს და დაბეჭდავთ მას, ასევე ჩაამატეთ მეთოდი, რომელიც ჩასვამს ან ამოაკლებს გამონათქვამს სიიდან. მოცემული გაქვთ “ქილერ” გამონათქვამების სია:
 
 დავინახე თუ არა მივხვდი, რომ – ” დევიღუპე. ”
 ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად
 სულის ტკივილამდე ვტკივილობ….
 იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ
 არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ
 ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე
 თქვენ მოჰკალით ძერა?
 ბებიააა... ბებია... ოლია მათხოვარი მევიდა...
 მზე აღარ ამოდის ჩაგვიჭრეს
 */

// Dictionary-ით,
class QuoteGenerator {
    var quotesWithMeanings: [String: String]
    
    init(quotes: [String], meanings: [String]) {
        var quotesWithMeanings = [String: String] ()
        for (index, quote) in quotes.enumerated() {
            quotesWithMeanings[quote] = meanings[index]
        }
        self.quotesWithMeanings = quotesWithMeanings
    }
    func selectQuote() {
        if quotesWithMeanings.isEmpty {
            print("ver moidzebna")
        } else {
            let randomIndex = Int.random(in: 0..<quotesWithMeanings.count)
            let selectedQuote = Array(quotesWithMeanings.keys)[randomIndex]
            let selectedMeaning = quotesWithMeanings[selectedQuote]
            print("'\(selectedQuote)' meaning: \(String(describing: selectedMeaning)))")
        }
    }
    func addQuote(quote:String, meaning:String) {
        quotesWithMeanings[quote] = meaning
    }
    func removeQuote(quote: String) {
        quotesWithMeanings.removeValue(forKey: quote)
    }
}

let quotesArray = ["დავინახე თუ არა მივხვდი, რომ – ” დევიღუპე","ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად", "სულის ტკივილამდე ვტკივილობ","იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ", "არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ", "ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე", "თქვენ მოჰკალით ძერა?", "ბებიააა... ბებია... ოლია მათხოვარი მევიდა...", "მზე აღარ ამოდის ჩაგვიჭრეს"]
let meaningsArray = ["შემიყვარდა", "მეგრელია", "მართლა შევღონდი", "იმედი ბოლოს კვდებაო, ჩათვალე ბოლოა", "იდეალური ჩემი თავი მეზარება", "იღბლიანი ბორბალი", "შიგ გულში მოახვედრა😉","ტფუი ეშმაკს", "🌚"]
let quotesGenerator = QuoteGenerator(quotes: quotesArray, meanings: meaningsArray)
quotesGenerator.selectQuote()
quotesGenerator.addQuote(quote: "გაიხარე გენაცვალე მეჩქარეცფკიდჯსბნციჯდ", meaning: "მომწყდი თავიდან")
quotesGenerator.removeQuote(quote: "გაიხარე გენაცვალე მეჩქარეცფკიდჯსბნციჯდ")
