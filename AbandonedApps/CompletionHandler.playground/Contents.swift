import UIKit

var str = "Hello, playground"


class Firebase {
    
    func createUser (username: String, password: String, completion: (Bool, Int) -> Void) {
        
        // something time consuming happens here, for ex:
        // the user creation process, including registering users into cloud database and so on
        // When the time consuming action has finished, 2 new variables gets created:
        let isSuccess = false
        let userId = 5000
        
        completion(isSuccess, userId)
        
    }
}


class MyApp {
    
    func registrationButtonPressed () {
        
        let firebase = Firebase()
        firebase.createUser(username: "Petre", password: "test") { (isSuccessful: Bool, UserID: Int) in
            
            print ("Registration has completed: \(isSuccessful)")
            print("Your user id is: \(UserID)")
        }
    }
    
}

let objectOfMyApp = MyApp()
objectOfMyApp.registrationButtonPressed()





