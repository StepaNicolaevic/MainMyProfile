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
    let imageMain: UIImage// string
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
            .init(name: "Авиарежим", imageMain: .init(systemName: "airplane")!, group: .connection),
            .init(name: "WI-FI", imageMain: .init(systemName: "wifi")!, group: .connection),
            .init(name: "Bluetooth", imageMain: .init(systemName: "scribble")!, group: .connection),
            .init(name: "Сотовая связь", imageMain: .init(systemName: "plus")!, group: .connection),
            .init(name: "Режим модема", imageMain: .init(systemName: "phone")!, group: .connection),
            .init(name: "Уведомления", imageMain: .init(systemName: "app.badge")!, group: .screen),
            .init(name: "Звуки тактильные сигналы", imageMain: .init(systemName: "volume.3.fill")!, group: .screen),
            .init(name: "Не беспокоить", imageMain: .init(systemName: "moon.fill")!, group: .screen),
            .init(name: "Экранное время", imageMain: .init(systemName: "hourglass")!, group: .screen),
            .init(name: "Основные", imageMain: .init(systemName: "gear")!, group: .basic),
            .init(name: "Пункт управления", imageMain: .init(systemName: "textformat.size")!, group: .basic),
            .init(name: "Экран и яркость", imageMain: .init(systemName: "textformat.size")!, group: .basic)
            
            
        
        
        ]
    }
    static func makeSettingsUnGroups() -> [[Setting]] {
        let conection = makeSetings().filter{ $0.group == .connection}
        let screen = makeSetings().filter{ $0.group == .screen}
        let basic = makeSetings().filter{ $0.group == .basic}
        return [conection, screen, basic]
    }
}
