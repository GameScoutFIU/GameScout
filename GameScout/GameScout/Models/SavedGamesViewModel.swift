//
//  SavedGamesViewModel.swift
//  GameScout
//
//  Created by Elvis Blanco on 11/7/23.
//

import Foundation
import Firebase

class SavedGamesViewModel: ObservableObject {
    @Published var SavedGameInfo: [SavedGames] = []
    let db = Firestore.firestore()
    
    func getData(username: String) {
        db.collection(username).getDocuments { snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        
                        self.SavedGameInfo = snapshot.documents.map { doc in
                            print("SUCCESS")
                            return SavedGames(id: doc.documentID, gameID: doc["gameID"] as? Int ?? -1, image_id: doc["image_id"] as? Int ?? -1, title: doc["title"] as? String ?? "")
                        }
                    }
                }
            }
            else {
                print("ERROR")
            }
        }
    }
    //check if gameID is saved in collection under username
    func contains(gameID: Int, username: String) -> Bool {
        var gameExists = false
        let docRef = db.collection(username).document(String(gameID))
        var isOperationComplete = false
        //check if firestore contains this and if it does set gameExists to true
        docRef.getDocument { (document, error) in
            if let error = error {
                print("Error getting document: \(error)")
            } else if let document = document, document.exists {
                gameExists = true
            }
                isOperationComplete = true
        }
        while !isOperationComplete {
            RunLoop.current.run(mode: .default, before: Date(timeIntervalSinceNow: 0.1))
        }
        print("RETURNS \(gameExists)")
        return gameExists
    }
    
    func deleteSavedGame(gameID: Int, username: String) {
        db.collection(username).document(String(gameID)).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Game successfully removed!")
            }
        }
    }
    
    func addSavedGame(gameID: Int, username: String, image_id: Int, title: String) {
        db.collection(username).document(String(gameID)).setData([
            "gameID": gameID,
            "image_id": image_id,
            "title": title
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Game successfully added!")
            }
        }
    }
}
