//
//  Intro.swift
//  AnimatedIndicator
//
//  Created by Nazar Babyak on 17.01.2022.
//

import SwiftUI

struct Intro: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
    
}

var intros: [Intro] = [

    Intro(image: "Page1", title: "Виберіть щось1", description: "Треба щось написати1", color: Color.orange),
    Intro(image: "Page2", title: "Виберіть щось2", description: "Треба щось написати2", color: Color.blue),
    Intro(image: "Page3", title: "Виберіть щось3", description: "Треба щось написати3", color: Color.yellow),

]
