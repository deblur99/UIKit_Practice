//
//  MemoStore.swift
//  NedMemoReal
//
//  Created by 한현민 on 2023/08/16.
//

import Firebase
import Foundation

@MainActor
class MemoStore: ObservableObject {
    @Published var memos: [Memo] = Memo.sampleArray
    
    // Note: Realtime Database는 async로 가져오는데
    // Firestore는 sync로 가져옴에 유의한다.
    
    func fetchMemo() {
        Firestore.firestore().collection("Memo").getDocuments { (DataSnapshot, error) in
            if let DataSnapshot {
                var savedMemoArray: [Memo] = []
                
                for document in DataSnapshot.documents {
                    let id: String = document.documentID
                    
                    let docData = document.data()
                    let text: String = docData["text"] as? String ?? ""
                    
                    let memo: Memo = .init(id: id, text: text)
                    savedMemoArray.append(memo)
                }
                
                DispatchQueue.main.async {
                    self.memos = savedMemoArray
                }
            }
        }
    }

    func importMemo() async {
//        if let savedMemoData = UserDefaults.standard.object(forKey: "memo") as? Data {
//            if let savedMemoArray = try? JSONDecoder().decode([Memo].self, from: savedMemoData) {
//                DispatchQueue.main.async {
//                    self.memos = savedMemoArray
//                }
//            }
//        }

        try await Database.database().reference().child("memo").observe(.value, with: { DataSnapshot in
            if let value = DataSnapshot.value as? String {
                // value를 String 타입에서 다시 Data 타입으로 역직렬화하기
                debugPrint(value)

                if let jsonData = value.data(using: .utf8) {
                    if let result = try? JSONDecoder().decode([Memo].self, from: jsonData) {
                        DispatchQueue.main.async {
                            self.memos = result
                        }
                    }
                }
            }
        })
    }

    func exportMemo() async {
        // set()으로 저장하고 object()로 Object 가져오기
        if let encodedMemoArray = try? JSONEncoder().encode(memos) {
            UserDefaults.standard.set(encodedMemoArray, forKey: "memo")

            let resultString = String(data: encodedMemoArray, encoding: .utf8) ?? "none"
            debugPrint(resultString)

            do {
                // Firebase의 memo 항목에 string으로 encoding된 JSON이 저장된다.
                try await Database.database().reference().child("memo").setValue(resultString)
            } catch {
                debugPrint("firebase error")
            }
        }
    }

    func addMemo(memo: Memo) {
        memos.append(memo)
        Task {
            do {
                try await Firestore.firestore().collection("Memo")
                    .document(memo.id)
                    .setData(["text": memo.text])
            } catch {
                debugPrint("error")
            }
            await exportMemo()
        }
    }

    // (IndexSet) -> Void
    func removeMemo(at offsets: IndexSet) {
        for offset in offsets {
            debugPrint(offset)
            let memo = memos[offset]
            debugPrint(memo)
            
            Task {
                do {
                    try await Firestore.firestore().collection("Memo")
                        .document(memo.id)
                        .delete()   // 특정된 문서 자체를 삭제
                } catch {
                    debugPrint("error")
                }
            }
            
            memos.remove(at: offset)
        }
        
//        memos.remove(atOffsets: offsets)
        // await exportMemo()
    }
}
