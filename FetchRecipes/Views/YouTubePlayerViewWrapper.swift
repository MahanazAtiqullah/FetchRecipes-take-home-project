//
//  YouTubePlayerViewWrapper.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/18/24.
//

import SwiftUI
import YouTubePlayerKit

struct YouTubePlayerViewWrapper: View {
    
    @State var youtubeLink: YouTubePlayer?
    
    @State var isEmpty: Bool
    
//    init(youtubeLink: String?) {
//        isEmpty = (youtubeLink == nil)
//        if !isEmpty {
//            self.youtubeLink = YouTubePlayer(stringLiteral: youtubeLink!)
//        }
//    }
    
    init(youtubeLink: YouTubePlayer?) {
        self.youtubeLink = youtubeLink
        self.isEmpty = youtubeLink == nil
    }
    
    var body: some View {
        if isEmpty {
            EmptyView()
        } else {
            YouTubePlayerView(self.youtubeLink!) { state in
                switch state {
                    case .idle:
                        ProgressView()
                    case .ready:
                        EmptyView()
                    case .error(let error):
                        videoErrorView
                }
            }
        }
    }
    
    var videoErrorView: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: UIScreen.main.bounds.width*0.75, height: UIScreen.main.bounds.width*0.4)).foregroundColor(Color(UIColor.systemBackground)).border(Color(UIColor.secondarySystemBackground), width: 3.5)
            Image(systemName: SFSymbols.videoError.rawValue).resizable().foregroundStyle(.background).padding(15)
        }
    }
    
}


//#Preview {
//    YouTubePlayerViewWrapper(youtubeLink: "https://www.youtube.com/watch?v=eHaev5gmVSo")
//}
