//
//  PomodoroWorkTimerView.swift
//  prepify
//
//  Created by tia on 6/27/24.
//

import SwiftUI

struct PomodoroWorkTimerView: View {
    @ObservedObject var pomodoroViewModel = PomodoroViewModel()
    @State private var tapped = false
    var body: some View {
        NavigationStack {
    
        ZStack{
            VStack{
                Spacer()
                Text(pomodoroViewModel.secondsToMinutesAndSeconds(pomodoroViewModel.workTimeRemaining))
                    .font(.system(size:90))
                    .foregroundColor(Color("#003f94ff"))
                Spacer()
                HStack(alignment: .center, spacing: 50) {
                    if pomodoroViewModel.workTimerMode == .running || pomodoroViewModel.workTimerMode == .paused {
                        
                        Button(action: {
                            pomodoroViewModel.resetTimers()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .bold()
                                .font(.system(size: 20))
                        }
                    }
                    Button(action: {
                        if pomodoroViewModel.workTimerMode == .running {
                            
                            pomodoroViewModel.pauseTimers()
                            tapped.toggle()
                        } else {
                            pomodoroViewModel.startWorkTimer()
                            tapped.toggle()
                        }
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(Color("#003f94ff"))
                            Image(systemName: pomodoroViewModel.workTimerMode == .running ? "pause.fill" : "play.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 34))
                            
                        }
                    }
                    
                    
                    if pomodoroViewModel.workTimerMode == .running || pomodoroViewModel.workTimerMode == .paused {
                        
                        Button(action: {
                            pomodoroViewModel.advanceOneMinuteForward()
                        }) {
                            Image(systemName: "goforward")
                                .foregroundColor(.black)
                                .bold()
                                .font(.system(size: 20))
                                .rotationEffect(.degrees(60))
                            
                        }
                        
                    }
                    
                }
                
                
                .padding(.top, -10) // Add padding to the top of the buttons
                
                Spacer().frame(height: 140) // Add a
            }
            
            
            
        }
        
        // Bottom Navigation
      
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("#003f94ff"))
                    .frame(height: 90)
                    .padding(.horizontal)
                    .shadow(radius: 5)
                    .overlay(
                        HStack(spacing: 20) {
                            // First back icon
                            NavigationLink(destination: ContentView()) {
                                Image("icons8-home-50")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                            }
                            Spacer()
                            
                            // Second book icon
                            NavigationLink(destination: ResourcesView()) {
                                Image("icons8-book-50")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                            }
                            
                            Spacer()
                            // Third Clock icon
                            NavigationLink(destination: PomodoroView()) {
                                Image("icons8-clock-50")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                            }
                            
                            Spacer()
                            // Fourth Checkmark icon
                            NavigationLink(destination: ToDoView()) {
                                Image("icons8-check-mark-50")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                            }
                            // End icons
                        }
                            .padding(.horizontal, 70)
                    )
            }
            
        }
    }
        struct PomodoroUsView: View {
            var body: some View {
                Text("Home View")
                    .font(.largeTitle)
                    .padding()
            }
        }
        
    }
        #Preview {
            PomodoroWorkTimerView()
        }
        
    
