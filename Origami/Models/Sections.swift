//
//  Sections.swift
//  Origami
//
//  Created by Misha Causur on 01.01.2022.
//

import SwiftUI

struct Sections: Identifiable {
    let id = UUID()
    var title: String
    var desctription: String
    var text: String
    var image: String
}

var modules = [
Sections(title: "Методология", desctription: "Основные термины и понятия", text: "Нормативная база, используемая при регистрационных действиях с недвижимостью", image: "Illustration 2"),
Sections(title: "Практика", desctription: "Судебные решения по делам", text: "с недвижимостью, связанные с электронной регистрацией", image: "Illustration 1"),
Sections(title: "Навыки", desctription: "Правоприменительная практика", text: "Собрание кейсоы применения норм законодательства", image: "Illustration 4"),
Sections(title: "Редкие кейсы", desctription: "С разбором и комментариями", text: "Различия в субъектах и территориальных отделах", image: "Illustration 6"),
Sections(title: "Иностранный опыт", desctription: "Регистрация за рубежом", text: "Основные различия и сходства", image: "Illustration 3")]


