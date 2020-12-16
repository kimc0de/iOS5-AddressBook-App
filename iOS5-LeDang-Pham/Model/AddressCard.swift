//
//  AddressCard.swift
//  iOS5-LeDang-Pham
//
//  Created by Kim on 15.12.20.
//

import Foundation

func == (left: AddressCard, right: AddressCard) -> Bool {
    return left.firstName == right.firstName
}

class AddressCard : Codable, Equatable {
    var firstName : String
    var lastName : String
    var street : String //inclusive house number
    var postCode : Int
    var city : String
    var hobbies = [String]()
    var friends = [AddressCard]()
    
    init(firstName:String, lastName:String, street:String, postCode:Int, city:String, hobbies:[String], friends : [AddressCard] ){
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.postCode = postCode
        self.city = city
        self.hobbies = hobbies
        self.friends = friends
        
    }
    func add(hobby: String) {
        hobbies.append(hobby)
    }
    
    func remove(hobby: String) {
        if let i = hobbies.firstIndex(of: hobby) {
            hobbies.remove(at: i)
        }
        else {
            print("Hobby: \(hobby) doesn't exist")
        }
    }
    
    func add(friend: AddressCard) {
        friends.append(friend)
    }
    
    func remove(friend: AddressCard) {
        if let i = friends.firstIndex(of: friend) {
            friends.remove(at: i)
        }
        else {
            print("Friend: \(friend.firstName) doesn't exist")
        }
    }
    
    func getFullAddress() -> String {
        return "\(postCode) \(city), \(street)"
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
    
    func addFirstName(firstName : String) {
        self.firstName = firstName
    }
    
    func addLastName(lastName : String) {
        self.lastName = lastName
    }
    
    func addStreet(street : String) {
        self.street = street
    }
    
    func addPostcode(postcode : Int) {
        self.postCode = postcode
    }
    
    func addCity(city : String) {
        self.city = city
    }
    
    func printInfo() {
        print("+--------------------------------------")
        print("| \(firstName) \(lastName)")
        print("| \(street) ")
        print("| \(postCode) \(city)")
        print("| Hobbies:")
        for String in hobbies {
            print("|      \(String)")
        }
        print("| Friends:")
        for AddressCard in friends {
            print("|      \(AddressCard.firstName) \(AddressCard.lastName), \(AddressCard.postCode) \(AddressCard.city)")
        }
        print("+--------------------------------------")
        
    }
}
