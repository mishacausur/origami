//
//  CardData.swift
//  Origami
//
//  Created by Misha Causur on 02.01.2022.
//

import Foundation

struct CardData: Identifiable {
    let id = UUID()
    var title: String
    var text: String
    var description: String
    var author: String
    var image: String
}

var datas = [
CardData(title: "Когда кончится ипотека?", text: "Аналитический разбор", description: "Когда-то давно ипотеку боялись все...", author: "Автор: И. Иванов", image: "foreground1"),
CardData(title: "Когда кончится ипотека?", text: "Аналитический разбор", description: "Когда-то давно ипотеку боялись все...", author: "Автор: И. Иванов", image: "foreground2")]
