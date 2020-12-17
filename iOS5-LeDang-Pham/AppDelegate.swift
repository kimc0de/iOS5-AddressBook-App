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
        let person10 = AddressCard(firstName: "Monika", lastName: "Boehmer", street: "Hochstrasse 10", postCode: 12345, city:"Hannover", hobbies: ["Cook", "Drinking Beer"], friends: [person4, person6, person8])
        let person11 = AddressCard(firstName: "Brigitte", lastName: "Ludwig", street: "Südstrasse 30", postCode: 12345, city:"Hagen", hobbies: ["Cook", "Drinking Beer"], friends: [person1, person3, person6])
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

