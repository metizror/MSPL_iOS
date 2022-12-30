//  CoreDataManager.swift


import Foundation
import Foundation
import CoreData

class CoreDataManager
{
    static let shared = CoreDataManager(modelName: "MSPL")
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { (description, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("An error ocurred while saving: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: -Helper functions
extension CoreDataManager {
    
//    func saveRestaurantDetails(resobj:RestaurantDetail) {
//        let restaurant = Restaurant(context: viewContext)
//        restaurant.id = Int64(resobj.id)
//        restaurant.title = resobj.title
//        restaurant.address = resobj.address
//        restaurant.latitude = resobj.latitude
//        restaurant.longitude = resobj.longitude
//        restaurant.rating = resobj.rating
//        restaurant.totalreview = Int64(resobj.totalReview)
//        restaurant.desc = resobj.datumDescription
//        restaurant.mobile = resobj.mobile
//        let urlsList = resobj.images.map({$0.url})
//        restaurant.images = urlsList
//        save()
//    }
//
//    func updateUserDetails(userDetails:UpdateUserRequestModel,currentUser:User) {
//        let request: NSFetchRequest<User> = User.fetchRequest()
//        let predicate = NSPredicate(format: "id == %@",currentUser.id! as CVarArg)
//        request.predicate = predicate
//        if let result = (try? viewContext.fetch(request)){
//            if let obj = result.first {
//                obj.setValue(userDetails.name, forKey: "name")
//                obj.setValue(userDetails.profileImage, forKey: "profileImage")
//                obj.setValue(userDetails.occupation, forKey: "occupation")
//            }
//        }
//        save()
//        appDel.currentUser = self.fetchLoggedInUserDetails(loggedUserEmail: currentUser.email ?? "")
//    }
//
//    func fatchRestaurantList() -> [Restaurant] {
//        let request: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
//        return (try? viewContext.fetch(request)) ?? []
//    }
    
//    func fetchLoggedInUserDetails(loggedUserEmail:String) -> User? {
//        let request: NSFetchRequest<User> = User.fetchRequest()
//        let predicate = NSPredicate(format: "email == %@",loggedUserEmail)
//        request.predicate = predicate
//        if let result = (try? viewContext.fetch(request)){
//            if let obj = result.first {
//                //let currentdate = Date()
//                //obj.setValue(currentdate, forKey: "lastLoginTime")
//               // save()
//                return obj
//            }
//        }
//        return nil
//    }
}
