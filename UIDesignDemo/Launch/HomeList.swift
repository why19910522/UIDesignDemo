//
//  HomeList.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/8/2.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct HomeList: View {
  
  let courses = [
    Course(title: "Build an app with SwiftUI",
           image: .illustration1,
           color: .background3,
           shadowColor: .backgroundShadow3),
    Course(title: "Design Course",
           image: .illustration2,
           color: .background4,
           shadowColor: .backgroundShadow4),
    Course(title: "Swift UI Advanced",
           image: .illustration3,
           color: .background7,
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Framer Playground",
           image: .illustration4,
           color: .background8,
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Flutter for Designers",
           image: .illustration5,
           color: .background9,
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
  ]
  
  @State var isPresented = false
  
  var body: some View {
    ScrollView {
      VStack {
        HStack {
          VStack(alignment: .leading) {
            Text("Courses")
              .font(.largeTitle)
              .fontWeight(.heavy)
            Text("21 courses")
              .foregroundColor(.gray)
          }
          Spacer()
        }
        .padding(.leading, 70)
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack {
            ForEach(courses) { course in
              GeometryReader { geometry in
                CourseView(course: course)
                  .rotation3DEffect(self.angle(from: geometry),
                                    axis: (x: 0, y: 10, z: 0))
                  .padding(.top, 35)
              }
              .frame(width: 246, height: 420)
            }
          }
          .padding(.leading, 30)
          .padding(.trailing, 30)
          .padding(.bottom, 60)
          Spacer()
        }
        .padding(.bottom, 70)
        
        CertificateRow()
        
      }
      .padding(.top, 78)
    }
    
  }
  
  func angle(from geometry: GeometryProxy) -> Angle {
    let degrees = Double(geometry.frame(in: .global).minX - 40) / -30
    return Angle(degrees: degrees)
  }
  
}

#if DEBUG
struct HomeList_Preview: PreviewProvider {
  static var previews: some View {
    Group {
      HomeList().previewDevice("iPhone SE")
      HomeList().previewDevice("iPhone Xʀ")
      HomeList().previewDevice("iPad Pro (9.7-inch)")
    }
  }
}
#endif

struct CourseView: View {
  
  var course: Course
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(course.title)
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(.red)
        .padding(30)
        .lineLimit(4)
        .frame(width: 170)
      Spacer()
      course.image
        .resizable()
        .renderingMode(.original)
        .aspectRatio(contentMode: .fit)
        .frame(width: 246, height: 150)
        .padding(.bottom, 30)
    }
    .background(course.color)
    .cornerRadius(30)
    .frame(width: 246, height: 360)
    .shadow(color: course.shadowColor, radius: 20, x: 0, y: 20)
  }
}

struct Course: Identifiable {
  var id = UUID()
  var title: String
  var image: Image
  var color: Color
  var shadowColor: Color
}

