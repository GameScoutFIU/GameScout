//
//  SavedGamesViewModel.swift
//  GameScout
//
//  Created by Erick Rivera on 11/7/23.
//

import Foundation
import Firebase

//class SavedGamesViewModel: ObservableObject {
//    @Published var SavedGamesInfo: [SavedGames] = []
//    let db = Firestore.firestore()
//    
//    func getData() {
//        db.collection("posts").getDocuments { snapshot, error in
//            
//            if error == nil {
//                
//                if let snapshot = snapshot {
//                    
//                    DispatchQueue.main.async {
//                        
//                        self.SavedGamesInfo = snapshot.documents.map { doc in
//                            print("SUCCESS")
//                            return SavedGames(id: doc["id"] as? Int ?? -1, gameID: doc["gameID"] as? [Int] ?? [-1])
//                        }
//                    }
//                }
//            }
//            else {
//                print("ERROR")
//            }
//        }
//    }
    
    
    
//    func getData() {
//            let db = Firestore.firestore()
//            db.collection("posts").getDocuments { snapshot, error in
//                
//                if error == nil {
//                    
//                    if let snapshot = snapshot {
//                        
//                        DispatchQueue.main.async {
//                            
//                            self.SavedGamesInfo = snapshot.documents.map { doc in
//                                print("SUCCESS")
//                                return SavedGames(docID: doc.documentID, username: doc["username"] as? String ?? "", id: doc["id"] as? Int ?? -1, title: doc["title"] as? String ?? "", image_id: doc["image_id"] as? Int ?? -1)
//                            }
//                        }
//                    }
//                }
//                else {
//                    print("ERROR")
//                }
//            }
//        }
//}
