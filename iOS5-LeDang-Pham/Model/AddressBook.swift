//
//  AddressBook.swift
//  iOS5-LeDang-Pham
//
//  Created by Kim on 15.12.20.
//

import Foundation

class AddressBook : Codable {
    
    var addressCards = [AddressCard]()
    
    init() {}
    func add (card : AddressCard) {
        addressCards.append(card)
        sortByName()
    }
    
    func remove (card : AddressCard){
        if let i = addressCards.firstIndex(of: card) {
            addressCards.remove(at: i)
        }
        else {
            print("Friend: \(card.firstName) doesn't exist")
        }
         // delete friends reference in friends list
        for friend in addressCards {
            friend.remove(friend: card)
//            if let i = friend.friends.firstIndex(of: card){
//                friend.friends.remove(at: i)
//            }
        }
    }
    
    func sortByName () {
        addressCards.sort(by: { (s1: AddressCard, s2: AddressCard) -> Bool in
            return s1.lastName < s2.lastName
        })
    }
    
    func searchByName (searchName : String) -> AddressCard? {
        for card in addressCards {
            if card.lastName.lowercased() == searchName.lowercased() {
                return card
            }
        }
        return nil
    }
    
//    func save (toFile path : String) { // 05-Foundation-Archivierung Folie 12
//        // file for saving data
//        let url = URL(fileURLWithPath: path)
//        // encode and save
//        let encoder = PropertyListEncoder()
//        if let data = try? encoder.encode(self) {
//            try? data.write(to: url) }
//
//    }
    
    func save(toURL url: URL) {
        let encoder = PropertyListEncoder()
        do {
            if let data = try? encoder.encode(self) {
                try data.write(to: url)
                print("Saved!")
            }
        } catch {
            print(error)
        }
    }
    
    //return String array containing first char of all last name in the address book
    func getAlphabetListFromLastName() -> [String]{
        var addressBookWithFirstCharFromLastName = [String]()
        for card in addressCards {
            addressBookWithFirstCharFromLastName.append(getUpperCasedFirstChar(str: card.lastName))
        }
        return addressBookWithFirstCharFromLastName
    }
    
    func getUpperCasedFirstChar(str: String) -> String {
        return String(str.prefix(0)).uppercased()
    }
    
    //return list of address card containing last name start with the given char
    func getAddressCardsFromChar(char : String) -> [AddressCard]{
        var addressCardsWithThisChar = [AddressCard]()
        for card in addressCards {
            if getUpperCasedFirstChar(str: card.lastName) == char {
                addressCardsWithThisChar.append(card)
            }
        }
        return addressCardsWithThisChar
    }
    
    //return a double dimention array containing address sorted by alphabet
    func getAddressBookInStringArray() -> [[AddressCard]] {
        var addressCardsArray = [[AddressCard]]()
        let firstChar = getAlphabetListFromLastName()
        for str in firstChar {
            let addressCardsFromThisChar = getAddressCardsFromChar(char: str)
            addressCardsArray.append(addressCardsFromThisChar)
        }
        
        return addressCardsArray
    }
    
    class func addressBook(fromFile path: URL) -> AddressBook? { //05-Foundation-Archivierung Folie 13
//        let url = URL(fileURLWithPath: path)
//        if let data = try? Data(contentsOf: url) {
//            let decoder = PropertyListDecoder()
//            if let addressBook = try? decoder.decode(AddressBook.self, from: data) {
//                return addressBook
//            }
//        }
//        return nil
//    }
        //iOS5: path as URL
        if let url = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            if let addressBook = try? decoder.decode(self, from: url) {
                return addressBook
            }
        }
        return nil
    }
}
