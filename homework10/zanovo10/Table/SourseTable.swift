//
//  SourseTable.swift
//  zanovo10
//
//  Created by qeqwe on 20.11.2023.
//

import Foundation
import UIKit

struct Setting {
    let name: String
    let imageMain: String?
    let group: Group
}
enum Group {
    case connection
    case screen
    case basic
}

struct SourseTable {
    static func makeSetings() -> [Setting] {
        [
            .init(name: "Авиарежим", imageMain: "airplane", group: .connection),
            .init(name: "WI-FI", imageMain: "wifi", group: .connection),
            .init(name: "Bluetooth", imageMain: "scribble", group: .connection),
            .init(name: "Сотовая связь", imageMain:  "antenna.radiowaves.left.and.right", group: .connection),
            .init(name: "Режим модема", imageMain: "phone", group: .connection),
            .init(name: "Уведомления", imageMain: "app.badge", group: .screen),
            .init(name: "Звуки тактильные сигналы", imageMain: "volume.3.fill", group: .screen),
            .init(name: "Не беспокоить", imageMain: "moon.fill", group: .screen),
            .init(name: "Экранное время", imageMain: "hourglass", group: .screen),
            .init(name: "Основные", imageMain: "gear", group: .basic),
            .init(name: "Пункт управления", imageMain: "square.topthird.inset.filled", group: .basic),
            .init(name: "Экран и яркость", imageMain: "textformat.size", group: .basic)
            
            
        
        
        ]
    }
    static func makeSettingsUnGroups() -> [[Setting]] {
        let conection = makeSetings().filter{ $0.group == .connection}
        let screen = makeSetings().filter{ $0.group == .screen}
        let basic = makeSetings().filter{ $0.group == .basic}
        return [conection, screen, basic]
    }
}
