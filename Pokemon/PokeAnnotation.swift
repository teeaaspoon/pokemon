//
//  PokeAnnotation.swift
//  Pokemon
//
//  Created by Tommy Poon on 2017-05-04.
//  Copyright © 2017 Tommy Poon. All rights reserved.
//

import UIKit
import MapKit

class PokeAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon : Pokemon
    init(coord : CLLocationCoordinate2D, pokemon : Pokemon) {
        self.coordinate = coord
        self.pokemon = pokemon
    }
}
