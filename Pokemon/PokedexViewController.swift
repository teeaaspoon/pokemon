//
//  PokedexViewController.swift
//  Pokemon
//
//  Created by Tommy Poon on 2017-05-03.
//  Copyright © 2017 Tommy Poon. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var caughtPokemon : [Pokemon] = []
    var uncaughtPokemon : [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        caughtPokemon = getAllCaughtPokemon()
        uncaughtPokemon = getAllUncaughtPokemon()

    }

    @IBAction func mapTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
