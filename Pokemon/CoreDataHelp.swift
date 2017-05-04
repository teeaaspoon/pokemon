//
//  CoreDataHelp.swift
//  Pokemon
//
//  Created by Tommy Poon on 2017-05-03.
//  Copyright © 2017 Tommy Poon. All rights reserved.
//

import UIKit
import CoreData


func addAllPokemon() {
    
    createPokemon(name: "Abra", imageName: "abra")
    createPokemon(name: "Bulbasaur", imageName: "bullbasaur")
    createPokemon(name: "Caterpie", imageName: "caterpie")
    createPokemon(name: "Charmander", imageName: "charmander")
    createPokemon(name: "Dratini", imageName: "dratini")
    createPokemon(name: "Mankey", imageName: "mankey")
    createPokemon(name: "Meowth", imageName: "meowth")
    createPokemon(name: "Mew", imageName: "mew")
    createPokemon(name: "Pikachu", imageName: "pikachu-2")
    createPokemon(name: "Snorlax", imageName: "snorlax")
    createPokemon(name: "Squirtle", imageName: "squirtle")
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func createPokemon(name:String, imageName:String) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let pokemon = Pokemon(context: context)
    pokemon.name = name
    pokemon.imageName = imageName
}

func getAllPokemon() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
        let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        if pokemons.count == 0 {
            addAllPokemon()
            return getAllPokemon()
        }
        return pokemons
    } catch {}
    return []
}

func getAllCaughtPokemon() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest <Pokemon>
    fetchRequest.predicate = NSPredicate(format: "caught == %@", true as CVarArg)
    do {
    let pokemons = try context.fetch(fetchRequest) as [Pokemon]
        return pokemons
    } catch {}
    return []
}

func getAllUncaughtPokemon() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest <Pokemon>
    fetchRequest.predicate = NSPredicate(format: "caught == %@", false as CVarArg)
    do {
        let pokemons = try context.fetch(fetchRequest) as [Pokemon]
        return pokemons
    } catch {}
    return []
}
