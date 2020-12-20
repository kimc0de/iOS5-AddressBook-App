//
//  AppDelegate.swift
//  iOS5-LeDang-Pham
//
//  Created by Kim on 15.12.20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var myAddressBook = AddressBook()
    let path:String = ""
    var filename:String = "book.plist"
    
    // MARK: Program starts
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        if let path = url?.appendingPathComponent(filename) {
            print(path)
            if let book = AddressBook.addressBook(fromFile: path) { 
                self.myAddressBook = book
                self.myAddressBook.sortByName()
            }else{
                print("Generate new contacts!")
                self.myAddressBook = generateContacts()
            }
        }
        return true
    }
    
    //MARK: Generate contacts
    func generateContacts() -> AddressBook{
        let newAddressBook = AddressBook()
        let person1 = AddressCard(firstName: "Kim Ngan", lastName: "Le Dang", street: "Goethestrasse 38", postCode: 12345, city:"Berlin", hobbies: ["Cook", "Photography"], friends: [])
        let person2 = AddressCard(firstName: "Tung Linh", lastName: "Pham Ba", street: "Storkowerstrasse 10", postCode: 12345, city:"Berlin", hobbies: ["Code", "Read"], friends: [])
        let person3 = AddressCard(firstName: "Valentin", lastName: "Boehmer", street: "Emserstrasse 10", postCode: 12345, city:"Berlin", hobbies: ["Swim", "Jogging"], friends: [person1, person2])
        let person4 = AddressCard(firstName: "Ella", lastName: "Katajia", street: "Boddin Strasse 1", postCode: 12345, city:"Hamburg", hobbies: ["Cook", "Photography"], friends: [person2])
        let person5 = AddressCard(firstName: "Lily", lastName: "Schmidt", street: "Bahnhofstrasse 10", postCode: 12345, city:"Halle", hobbies: ["Jogging", "Read","Music"], friends: [person1, person3])
        let person6 = AddressCard(firstName: "Peter", lastName: "Arndt", street: "Ackerstrasse 14", postCode: 12345, city:"Augsburg", hobbies: ["Cook", "Drinking Beer"], friends: [person1, person4, person5])
        let person7 = AddressCard(firstName: "Helga", lastName: "Christ", street: "Charlottenstrasse 177", postCode: 12345, city:"Berlin", hobbies: ["Cook", "Drinking Beer"], friends: [person4, person2, person3])
        let person8 = AddressCard(firstName: "Michael", lastName: "Hofmann", street: "Hochstrasse 103", postCode: 12345, city:"Bremen", hobbies: ["Cook", "Drinking Beer"], friends: [person1, person2, person5])
        let person9 = AddressCard(firstName: "Petra", lastName: "Ingenhoven", street: "Kirchstrasse 50", postCode: 12345, city:"Augsburg", hobbies: ["Cook", "Drinking Beer"], friends: [person3, person7, person8])
        let person10 = AddressCard(firstName: "Monika", lastName: "Ostermeier", street: "Hochstrasse 10", postCode: 12345, city:"Hannover", hobbies: ["Cook", "Drinking Beer"], friends: [person4, person6, person8])
        let person11 = AddressCard(firstName: "Brigitte", lastName: "Ludwig", street: "Südstrasse 30", postCode: 12345, city:"Hagen", hobbies: ["Cook", "Drinking Beer"], friends: [person1, person3, person6])
        let person12 = AddressCard(firstName: "Elisabeth", lastName: "Ackermann", street: "Oberdorfstrasse 38", postCode: 12345, city:"Chemnitz", hobbies: ["Reading", "Photography", "Dancing"], friends: [person3, person5, person9, person7])
        let person13 = AddressCard(firstName: "Werner", lastName: "Braun", street: "Finkenweg 14", postCode: 12345, city:"Berlin", hobbies: ["Coding", "Jogging", "Swimming"], friends: [person6, person7, person3, person10])
        let person14 = AddressCard(firstName: "Renate", lastName: "Dambach", street: "Neue Strasse 10", postCode: 12345, city:"Karlsruhe", hobbies: ["Dancing", "Jogging", "Music making"], friends: [person1, person2, person11, person13])
        let person15 = AddressCard(firstName: "Josef", lastName: "Esser", street: "Boddin Strasse 105", postCode: 12345, city:"Hamburg", hobbies: ["Reading", "Jogging", "Photography"], friends: [person2, person10, person4, person11])
        let person16 = AddressCard(firstName: "Maria", lastName: "Franke", street: "Ringstrasse 16", postCode: 12345, city:"Kiel", hobbies: ["Jogging", "Read","Music"], friends: [person1, person3])
        let person17 = AddressCard(firstName: "Sabine", lastName: "Jäger", street: "Wilhelmstrasse 11", postCode: 12345, city:"Nürnberg", hobbies: ["Wave Suffing", "Drinking Beer"], friends: [person11, person14, person15])
        let person18 = AddressCard(firstName: "Gerald", lastName: "Kleinen", street: "Eichenweg 17", postCode: 12345, city:"Kassel", hobbies: ["Drawing", "Drinking Beer"], friends: [person10, person12, person13])
        let person19 = AddressCard(firstName: "Horst", lastName: "Lehmann", street: "Poststrasse 103", postCode: 12345, city:"Bremen", hobbies: ["Skiing", "Singing"], friends: [person7, person2, person12])
        let person20 = AddressCard(firstName: "Manfred", lastName: "Meier", street: "Ulmenweg 50", postCode: 12345, city:"Augsburg", hobbies: ["Cooking", "DJ", "Drawing"], friends: [person3, person7, person8])
        let person21 = AddressCard(firstName: "Monika", lastName: "Nolte", street: "Hochstrasse 10", postCode: 12345, city:"Hannover", hobbies: ["Cooking", "Break dance"], friends: [person4, person6, person8])
        let person22 = AddressCard(firstName: "Brian", lastName: "Probst", street: "Feldstrasse 30", postCode: 12345, city:"Hagen", hobbies: ["Cooking", "Dancing"], friends: [person11, person15, person6])
        let person23 = AddressCard(firstName: "Lila", lastName: "Quandt", street: "Südstrasse 344", postCode: 12345, city:"Berlin", hobbies: ["Cook", "Drinking Beer", "Guitar"], friends: [person21, person13, person16])
        let person24 = AddressCard(firstName: "Meya", lastName: "Römer", street: "Quellenstrasse111", postCode: 12345, city:"Chemnitz", hobbies: ["Reading", "Photography", "Dancing"], friends: [person3, person5, person10, person11])
        let person25 = AddressCard(firstName: "Adam", lastName: "Tillmann", street: "Koblenzer Strasse 14", postCode: 12345, city:"Regensburg", hobbies: ["Coding", "Jogging", "Swimming"], friends: [person17, person18, person10, person20])
        let person26 = AddressCard(firstName: "Breme", lastName: "Ullrich", street: "Rheinstrasse 10", postCode: 12345, city:"Frankfurt", hobbies: ["Dancing", "Jogging", "Music making"], friends: [person1, person2, person11, person13])
        let person27 = AddressCard(firstName: "Joseph", lastName: "Urban", street: "Parkstrasse 15", postCode: 12345, city:"Hamburg", hobbies: ["Reading", "Jogging", "Photography"], friends: [person2, person10, person4, person11])
        let person28 = AddressCard(firstName: "Stefanie", lastName: "Völker", street: "Brunnenstrasse 16", postCode: 12345, city:"Kiel", hobbies: ["Jogging", "Read","Music"], friends: [person11, person13])
        let person29 = AddressCard(firstName: "Milana", lastName: "Wagner", street: "Jahnstrasse 11", postCode: 12345, city:"Pforzheim", hobbies: ["Tiktok", "Dancing"], friends: [person13, person24, person15])
        let person30 = AddressCard(firstName: "Johannes", lastName: "Zimmer", street: "Eichenweg 117", postCode: 12345, city:"Gießen", hobbies: ["Drawing", "Drinking Beer"], friends: [person4, person2, person3])
        let person31 = AddressCard(firstName: "Susanne", lastName: "Thomas", street: "Poststrasse 103", postCode: 12345, city:"Mannheim", hobbies: ["Skiing", "Singing"], friends: [person1, person2, person5])
        let person32 = AddressCard(firstName: "Anny", lastName: "Lorenz", street: "Ulmenweg 510", postCode: 12345, city:"Leipzig", hobbies: ["Cooking", "DJ", "Drawing"], friends: [person3, person7, person8])
        let person33 = AddressCard(firstName: "Robert", lastName: "Krause", street: "Grabenstrasse 10", postCode: 12345, city:"Hannover", hobbies: ["Cooking","DJ", "Break dance"], friends: [person4, person6, person8])
        let person34 = AddressCard(firstName: "Caro", lastName: "Christ", street: "Feldstrasse 30", postCode: 12345, city:"Duisburg", hobbies: ["Cooking", "Dancing"], friends: [person1, person3, person6])
        
        
        newAddressBook.add(card: person1)
        newAddressBook.add(card: person2)
        newAddressBook.add(card: person3)
        newAddressBook.add(card: person4)
        newAddressBook.add(card: person5)
        newAddressBook.add(card: person6)
        newAddressBook.add(card: person7)
        newAddressBook.add(card: person8)
        newAddressBook.add(card: person9)
        newAddressBook.add(card: person10)
        newAddressBook.add(card: person11)
        newAddressBook.add(card: person12)
        newAddressBook.add(card: person13)
        newAddressBook.add(card: person14)
        newAddressBook.add(card: person15)
        newAddressBook.add(card: person16)
        newAddressBook.add(card: person17)
        newAddressBook.add(card: person18)
        newAddressBook.add(card: person19)
        newAddressBook.add(card: person20)
        newAddressBook.add(card: person21)
        newAddressBook.add(card: person22)
        newAddressBook.add(card: person23)
        newAddressBook.add(card: person24)
        newAddressBook.add(card: person25)
        newAddressBook.add(card: person26)
        newAddressBook.add(card: person27)
        newAddressBook.add(card: person28)
        newAddressBook.add(card: person29)
        newAddressBook.add(card: person30)
        newAddressBook.add(card: person31)
        newAddressBook.add(card: person32)
        newAddressBook.add(card: person33)
        newAddressBook.add(card: person34)
        return newAddressBook
    }
    
    // MARK: Program ends
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate.
        // Save data if appropriate.
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let path = url.appendingPathComponent(filename)
        self.myAddressBook.save(toURL: path)
    }
    
    // MARK: App in background
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Get file with absolute path
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let path = url.appendingPathComponent(filename)
        self.myAddressBook.save(toURL: path)
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

