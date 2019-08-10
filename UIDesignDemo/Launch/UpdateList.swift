//
//  UpdateList.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/8/2.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct Update: Identifiable {
    var id = UUID()
    var image: Image
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: .illustration1, title: "SwiftUI", text: "Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.", date: "JUN 26"),
    Update(image: .illustration2, title: "Framer X", text: "Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.", date: "JUN 11"),
    Update(image: .illustration3, title: "CSS Layout", text: "Learn how to combine CSS Grid, Flexbox, animations and responsive design to create a beautiful prototype in CodePen.", date: "MAY 26"),
    Update(image: .illustration4, title: "React Native Part 2", text: "Learn how to implement gestures, Lottie animations and Firebase login.", date: "MAY 15"),
    Update(image: .certificate1, title: "Unity", text: "Unity course teaching basics, C#, assets, level design and gameplay", date: "MAR 19"),
    Update(image: .certificate2, title: "React Native for Designers", text: "Build your own iOS and Android app with custom animations, Redux and API data.", date: "FEB 14"),
    Update(image: .certificate3, title: "Vue.js", text: "Make a dashboard web-app with a complete login system, dark mode, and animated charts for your data.", date: "JAN 23")
]

struct UpdateList: View {
    
    @ObservedObject var store = UpdateStore(updates: updateData)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { item in
                    NavigationLink(destination: UpdateDetail(update: item)) {
                        UpdateRow(update: item)
                    }
                    .padding(.vertical, 8)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(
                leading: Button(action: addUpdate, label: {
                    Text("Add Update")
                }),
                trailing: EditButton()
            )
        }
        .animation(.default)
    }
    
    func addUpdate() {
        
        store.updates.append(Update(image: .certificate2, title: "SwiftUI Advanced", text: "This course will focus on API data.", date: "JUL 26"))
    }
    
    func delete(at indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        store.updates.remove(at: index)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        guard let sourceIndex = source.first else { return }
        store.updates.swapAt(sourceIndex, destination)
    }
}

#if DEBUG
struct UpdateList_Preview: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
#endif

struct UpdateRow: View {
    
    var update: Update
    
    var body: some View {
        HStack(alignment: .top) {
            update.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color.background)
                .cornerRadius(20)
                .padding(.trailing, 4)
            
            VStack(alignment: .leading) {
                Text(update.title)
                    .font(.headline)
                
                Text(update.text)
                    .lineLimit(3)
                    .font(.system(size: 15))
                    .lineSpacing(4)
                    .frame(height: 90)
                
                Text(update.date)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
        }
        .animation(nil)
    }
}

struct UpdateDetail: View {
    
    var update: Update
    
    var body: some View {
        VStack(spacing: 20) {
            Text(update.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            update.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
//                .background(Color.background)
            
            Spacer()
            
            Text(update.text)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .lineLimit(nil)
        }
        .padding(30)
    }
}
