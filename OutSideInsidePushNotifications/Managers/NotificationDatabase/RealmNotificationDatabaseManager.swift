//
//  RealmDatabaseManager.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 28.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import RealmSwift

class RealmNotificationDatabaseManager: NotificationDatabaseManager {
    
    private var realm: Realm?
    
    init() {
        guard let realm = try? Realm() else {
            print("!!! Database is not initialized !!!")
            return
        }
        self.realm = realm
    }
    
    func create(_ model: NotificationModel) {
        guard let realm = self.realm else { return }
        let notificationRealm = toRealm(from: model)
        
        do {
            try realm.write { realm.add(notificationRealm) }
        } catch {
            print("!!! Error creating notificaion model !!!")
            print(error.localizedDescription)
        }
    }
    
    func getAll() -> [NotificationModel]? {
        guard let realm = self.realm else { return nil }
        let notificationsRealm = realm.objects(NotificationRealm.self).sorted(byKeyPath: #keyPath(NotificationRealm.created), ascending: false)
        return notificationsRealm.map { self.toModel(from: $0) }
    }
    
    func delete(_ notificationModel: NotificationModel) {
        guard let realm = self.realm else { return }
        do {
            try realm.write {
                let realmObject = realm.objects(NotificationRealm.self).filter("\(#keyPath(NotificationRealm.created)) = %@", notificationModel.created)
                realm.delete(realmObject)
            }
        } catch {
            print("!!! Error delete notification model !!!")
            print(error.localizedDescription)
        }
    }
    
}

// MARK: - Helpers methods convert from realm object to model and reverse
extension RealmNotificationDatabaseManager {
    
    func toModel(from realm: NotificationRealm) -> NotificationModel {
        var url: URL?
        if let stringURL = realm.imageURL {
            url = URL(string: stringURL)
        }
        return NotificationModel(title: realm.title, text: realm.text, imageURL: url, created: realm.created)
    }
    
    func toRealm(from model: NotificationModel) -> NotificationRealm {
        let realmObject = NotificationRealm()
        realmObject.title = model.title
        realmObject.text = model.text
        realmObject.imageURL = model.imageURL?.absoluteString
        realmObject.created = model.created
        return realmObject
    }
    
}
