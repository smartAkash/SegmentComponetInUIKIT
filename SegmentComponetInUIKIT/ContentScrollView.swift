//
//  ScrollView.swift
//  SegmentComponetInUIKIT
//
//  Created by Akash on 20/10/21.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                ContentScrollView()
                ContentListView()
                ContentListHeaderView()
                ContentCollectionView()
            }
        }
    }
}

struct ContentScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//=================================== Scrollview =================================================
struct ContentScrollView: View {
    @State private var title:String = ""
    private let arrayOfSegment = [ButtonSegmentDataModel.init(title: "Jobs"),
                                  ButtonSegmentDataModel.init(title: "Search", deafultIcon: "hiddenlake",activeIcon: "umbagog", iconPosition: .left),
                                  ButtonSegmentDataModel.init(title: "Connect", deafultIcon: "umbagog", activeIcon: "silversalmoncreek", iconPosition: .right)
    ]
    
    var body: some View {
        NavigationLink("ScrollView") {
            ZStack{
                Color.red.opacity(0.5)
                ScrollView{
                    
                    // center
                    CustomSegmentedView(buttonTitlesArray: arrayOfSegment, tabHeight: 50, buttonTapActionClouser: { dataModel in
                        debugPrint(dataModel.title)
                        title = dataModel.title
                    }).padding(.top, 50)
                    
                    // trealing
                    CustomSegmentedView(buttonTitlesArray: arrayOfSegment, tabHeight: 50,enumStackType: .trealing(10), buttonTapActionClouser: { dataModel in
                        debugPrint(dataModel.title)
                        title = dataModel.title
                    }).padding(.top, 10)
                    
                    // leading
                    CustomSegmentedView(buttonTitlesArray: arrayOfSegment, tabHeight: 50,enumStackType: .leading(10), buttonTapActionClouser: { dataModel in
                        debugPrint(dataModel.title)
                        title = dataModel.title
                    }).padding(.top, 10)
                    
                    Text(title).frame(maxWidth: .infinity, alignment: .center).font(.headline.bold()).padding(.top, 20)
                }
            }.background(Color.red.opacity(0.5)).navigationBarTitleDisplayMode(.inline).navigationTitle("Scrollview")
        }
    }
}

// //=================================== List View =================================================
struct ContentListView: View {
    @State private var title:String = ""
    private let arrayOfSegment = [ButtonSegmentDataModel.init(title: "Jobs"),
                                  ButtonSegmentDataModel.init(title: "Search", deafultIcon: "hiddenlake",activeIcon: "umbagog", iconPosition: .left),
                                  ButtonSegmentDataModel.init(title: "Connect", deafultIcon: "umbagog", activeIcon: "silversalmoncreek", iconPosition: .right)
    ]
    
    var body: some View {
        NavigationLink("List View") {
            ZStack{
                Color.blue.opacity(0.5)
                List{
                    // center position
                    CustomSegmentedView(buttonTitlesArray: arrayOfSegment, tabHeight: 50,enumStackType: .center(0), buttonTapActionClouser: { dataModel in
                        debugPrint(dataModel.title)
                        title = dataModel.title
                    })
                    
                    // leading position
                    CustomSegmentedView(buttonTitlesArray: arrayOfSegment, tabHeight: 50,enumStackType: .leading(0), buttonTapActionClouser: { dataModel in
                        debugPrint(dataModel.title)
                        title = dataModel.title
                    })
                    
                    // trealing position
                    CustomSegmentedView(buttonTitlesArray: arrayOfSegment, tabHeight: 50,enumStackType: .trealing(0), buttonTapActionClouser: { dataModel in
                        debugPrint(dataModel.title)
                        title = dataModel.title
                    })
                    
                    if !title.isEmpty{
                        Text(title).padding(.top, 10).padding(.bottom, 10).frame(maxWidth: .infinity, alignment: .center).font(.headline.bold())
                    }
                }.buttonStyle(.plain).frame(maxWidth: .infinity)
            }.navigationBarTitleDisplayMode(.inline).navigationBarTitleDisplayMode(.inline).navigationTitle("List View")
        }
    }
}

//=================================== List section header ==============================================
struct ContentListHeaderView: View {
    @State private var title:String = ""
    let arrayOfSegment = [ButtonSegmentDataModel.init(title: "Jobs"),
                          ButtonSegmentDataModel.init(title: "Search", deafultIcon: "hiddenlake",activeIcon: "umbagog", iconPosition: .left),
                          ButtonSegmentDataModel.init(title: "Connect", deafultIcon: "umbagog", activeIcon: "silversalmoncreek", iconPosition: .right)
    ]
    
    var body: some View {
        NavigationLink("List Header View") {
            List{
                Section("Header section Trealing") {
                    CustomSegmentedView(buttonTitlesArray: arrayOfSegment, tabHeight: 50, enumStackType: .trealing(0), buttonTapActionClouser: { dataModel in
                        debugPrint(dataModel.title)
                        title = dataModel.title
                    })
                }
                Section("Header section Leading") {
                    CustomSegmentedView(buttonTitlesArray: arrayOfSegment, tabHeight: 50, enumStackType: .leading(0), buttonTapActionClouser: { dataModel in
                        debugPrint(dataModel.title)
                        title = dataModel.title
                    })
                }
                
                Section("Header section Center") {
                    CustomSegmentedView(buttonTitlesArray: arrayOfSegment, tabHeight: 50, enumStackType: .center(0), buttonTapActionClouser: { dataModel in
                        debugPrint(dataModel.title)
                        title = dataModel.title
                    })
                }
                Text(title).frame(maxWidth: .infinity, alignment: .center).font(.headline.bold())
            }.buttonStyle(.plain).frame(maxWidth: .infinity)
        }
    }
}

// Collection View
struct ContentCollectionView: View {
    private let columns = [
        GridItem(.flexible(minimum: .infinity, maximum: .infinity))
    ]
    
    var body: some View {
        NavigationLink("Collection View") {
        }
    }
}
