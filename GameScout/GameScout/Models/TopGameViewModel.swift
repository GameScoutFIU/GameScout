//
//  TopGameViewModel.swift
//  GameScout
//
//  Created by Erick Rivera on 11/7/23.
//

import Foundation
import Firebase

class TopGameViewModel: ObservableObject {
    @Published var TopGameInfo: [GameCatalog] = []
    let db = Firestore.firestore()
    
    func getData() {
        db.collection("top").getDocuments { snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        
                        self.TopGameInfo = snapshot.documents.map { doc in
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
