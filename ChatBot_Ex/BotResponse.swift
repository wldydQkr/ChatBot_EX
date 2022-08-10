//
//  BotResponse.swift
//  ChatBot_Ex
//
//  Created by 박지용 on 2022/08/10.
//

import Foundation

func getBotResponse(message: String) ->  String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("안녕") {
        return "반가워"
    } else if tempMessage.contains("뭐해") {
        return "공부"
    } else if tempMessage.contains("열심히 해") {
        return "그래"
    } else if tempMessage.contains("주장권 바보") {
        return "정확해"
    } else {
        return "닥쳐"
    }
}
