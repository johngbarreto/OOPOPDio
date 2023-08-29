//
//  main.swift
//  OOPDio
//
//  Created by João Gabriel Lavareda Ayres Barreto on 22/08/23.
//

// OOP

import Foundation


class Car {
    var carName: String
    var year: Int
    var speed: Int
    
    init(carName: String, year: Int, speed: Int) {
        self.carName = carName
        self.year = year
        self.speed = speed
    }
    
    func topSpeed(max: Int) {
        print("Top speed is around: \(max)")
    }
    
    func checkCarBoost() {
        if carName == "bmw" {
            let boost = speed + 40
            print("your car has a boost of 40, your top speed is: \(boost)")
        } else {
            print("Your \(carName) has no boost")
        }
    }
}

var car = Car(carName: "bmw", year: 1998, speed: 130)
car.checkCarBoost()

var car2 = Car(carName: "audi", year: 2020, speed: 200)
car2.checkCarBoost()



// POP

protocol Targetable {
    var life: Int { get set }
    func takeDamage(damage: Int)
}

protocol Shootable {
    func shoot(target: Targetable)
}

class Pistol: Shootable {
    func shoot(target: Targetable) {
        target.takeDamage(damage: 1)
    }
}

class Sniper: Shootable {
    func shoot(target: Targetable) {
        target.takeDamage(damage: 5)
    }
}

class Enemy: Targetable {
    var life: Int = 10

    func takeDamage(damage: Int) {
        life -= damage
        print("enemy lost \(damage) hit points, current life: \(life)")

        if life <= 0 {
            print("enemy is dead now")
        }
    }
}

class Player {
    var weapon: Shootable!

    init(weapon: Shootable) {
        self.weapon = weapon
    }

    func shoot(target: Targetable) {
        weapon.shoot(target: target)
    }
}

var ghillie = Player(weapon: Pistol())

var enemy = Enemy()

ghillie.shoot(target: enemy)
ghillie.shoot(target: enemy)
ghillie.shoot(target: enemy)
ghillie.shoot(target: enemy)
ghillie.shoot(target: enemy)

ghillie.weapon = Sniper()

ghillie.shoot(target: enemy)


