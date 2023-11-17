//
//  TrendingGameViewModel.swift
//  GameScout
//
//  Created by Erick Rivera on 11/7/23.
//

import Foundation
import Firebase

class TrendingGameViewModel: ObservableObject {
    @Published var TrendingGameInfo: [GameCatalog] = []
    let db = Firestore.firestore()
    
    func getData() {
        db.collection("trending").getDocuments { snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        
                        self.TrendingGameInfo = snapshot.documents.map { doc in
                            print("SUCCESS")
                            return GameCatalog(id: doc.documentID, cover: doc["cover"] as? Int ?? -1, gameID: doc["gameID"] as? Int ?? -1, image_id: doc["image_id"] as? String ?? "", title: doc["title"] as? String ?? "")
                        }
                    }
                }
            }
            else {
                print("ERROR")
            }
        }
    }
}
