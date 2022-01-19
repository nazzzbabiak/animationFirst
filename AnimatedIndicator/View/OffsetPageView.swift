//
//  OffsetPageView.swift
//  AnimatedIndicator
//
//  Created by Nazar Babyak on 17.01.2022.
//


import SwiftUI

struct OffsetPageView<Content: View>: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return OffsetPageView.Coordinator(parent: self)
    }
    

    var content: Content
    @Binding var offset: CGFloat
    
    init(offset: Binding<CGFloat>,
         @ViewBuilder content: @escaping ()-> Content){
        
        self.content = content()
        self._offset = offset
        
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        let hostview = UIHostingController(rootView: content)
        hostview.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            
            hostview.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            hostview.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostview.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            hostview.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        
            
        
        ]
        scrollView.addSubview(hostview.view)
        scrollView.addConstraints(constraints)
        
        
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        
        scrollView.delegate = context.coordinator
        
        return scrollView
        
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        let currentOffset = uiView.contentOffset.x
        
        if currentOffset != offset{
        print("updating")
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: OffsetPageView
        
        init(parent: OffsetPageView) {
            self.parent = parent
            
        }
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
        }
    }
    
}

struct OffsetPageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
