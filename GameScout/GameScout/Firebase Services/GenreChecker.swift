//
//  GenreChecker.swift
//  GameScout
//
//  Created by Erick Rivera on 11/17/23.
//

import Foundation

func genreChecker(genreID: [Int]) -> String {
    var genres = [String]()
    for g in genreID {
        switch g {
            case 2:
                genres.append("Point-and-click")
            case 4:
                genres.append("Fighting")
            case 5:
                genres.append("Shooter")
            case 7:
                genres.append("Music")
            case 8:
                genres.append("Platform")
            case 9:
                genres.append("Puzzle")
            case 10:
                genres.append("Racing")
            case 11:
                genres.append("Real Time Strategy (RTS)")
            case 12:
                genres.append("Role-playing (RPG)")
            case 13:
                genres.append("Simulator")
                //add all cases below
            case 14:
                genres.append("Sport")
            case 15:
                genres.append("Strategy")
            case 16:
                genres.append("Turn-based strategy (TBS)")
            case 24:
                genres.append("Tactical")
            case 25:
                genres.append("Hack and slash/Beat 'em up")
            case 26:
                genres.append("Quiz/Trivia")
            case 30:
                genres.append("Pinball")
            case 31:
                genres.append("Adventure")
            case 32:
                genres.append("Indie")
            case 33:
                genres.append("Arcade")
            case 34:
                genres.append("Visual Novel")
            case 35:
                genres.append("Card & Board Game")
            case 36:
                genres.append("MOBA")
            case 37:
                genres.append("Educational")
            case 38:
                genres.append("Battle Royale")
            case 39:
                genres.append("Auto Battler")
        default:
            genres.append("N/A")
        }
    }
    return genres.joined(separator: ", ")
}
