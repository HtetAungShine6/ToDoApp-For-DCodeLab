import Foundation
import FirebaseFirestore

class ToDoListViewViewModel : ObservableObject{
    @Published var showingNewItemView = false
    @Published var items: [ToDoListItem] = []
    private let userId: String

    //reusability
    init(userId: String){
        self.userId = userId
    }

    //delete data from database
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }

}
