//
//  ContentView.swift
//  ChatBot_Ex
//
//  Created by 박지용 on 2022/08/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var messageText = ""
    @State var messages = ["Welcome to Chat Bot!"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Chat Bot")
                    .font(.largeTitle)
                    .bold()
                Image(systemName: "leaf.fill")
                    .font(.system(size: 30.0))
                    .foregroundColor(.green)
            }
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    if message.contains("[사용자]") {
                        // 새 문자열을 반환
                        let newMessage = message.replacingOccurrences(of: "[사용자]", with: "")
                        
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.green.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            Text(message)
                                .padding()
                                .background(.gray.opacity(0.3))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }
                .rotationEffect(.degrees(180))
            }
            .rotationEffect(.degrees(180))
            .background(Color.gray.opacity(0.10))
            HStack {
                TextField("텍스트 입력", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                Button {
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26.0))
                .padding(.horizontal, 12.0)
                .foregroundColor(.green)
            }
            .padding()
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[사용자]" + message)
            self.messageText = ""
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            messages.append(getBotResponse(message: message))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
