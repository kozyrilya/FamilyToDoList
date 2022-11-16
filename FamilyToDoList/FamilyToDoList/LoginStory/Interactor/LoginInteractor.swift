//
//  LoginInteractor.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 6/26/22.
//

import Foundation

class LoginInteractor { }

// MARK: LoginInteractorType
extension LoginInteractor: LoginInteractorType {
    func signIn(email: String?, password: String?, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }

    func signUp(email: String?, password: String?, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
}

//class ConfirmationInteractor {
//    let storageService: StorageServiceType!
//    let notificationService: NotificationService!
//    let userData: UserInfo!
//
//
//    init(with storageService: StorageServiceType, with notificationService: NotificationService, and info: UserInfo) {
//        self.storageService = storageService
//        self.notificationService = notificationService
//        userData = info
//    }
//
//    private func onUserInfoSaved(completion: @escaping Block.Empty) {
//        notificationService.scheduleNotification(on: notificationDate(stringDate: userInfo.notificationDate), for: userData)
////        notificationService.scheduleNotification(on: inTwoMinutesDate(), for: userData)
//        completion()
//    }
//
//    func inTwoMinutesDate() -> Date {
//        let notificationDate = Date().addingTimeInterval(10)
//        return notificationDate
//    }
//
//    private func notificationDate(stringDate: String) -> Date {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/dd/yyyy"
//        dateFormatter.timeZone = TimeZone(identifier: "GMT")
//       let date = dateFormatter.date(from: stringDate)
//    return date!
//
//    }
//}
//
//extension ConfirmationInteractor: ConfirmationInteractorType {
//    var userInfo: UserInfo {
//        return userData
//    }
//
//    func saveUserInfoToStorage(completion: @escaping Block.Empty) {
//
//        self.storageService.saveUserInfo(userData: userData, completion: {
//            self.onUserInfoSaved(completion: {
//                completion()
//            })
//        })
//    }
//}
