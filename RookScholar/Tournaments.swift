//
//  Tournaments.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 28.03.23.
//
import UIKit

struct Tournament{
    let title: String
    let startDate: String
    let endDate: String
    let venue: String
    let city: String
    let countryCode: String
}

 let pastTournaments:[Tournament] = [
    Tournament(title: "Tata Steel", startDate: "25/02/2023", endDate: "02/03/2023", venue: "Johan Cruijff ArenA", city: "Amsterdam", countryCode: "NL"),
    Tournament(title: "Lulin Chess", startDate: "07/03/2023", endDate: "14/03/2023", venue: "Lulin Beach", city: "Sofia", countryCode: "BG")
]

let futureTournaments:[Tournament] = [
   Tournament(title: "FIDE World Championship", startDate: "29/07/2023", endDate: "25/08/2023", venue: "Baku Expo Center", city: "Baku", countryCode: "AZ"),
   Tournament(title: "World Rapid Teams Championship", startDate: "25/08/2023", endDate: "29/08/2023", venue: "KaBARett FLiN", city: "Dusseldorf", countryCode: "DE")
]
