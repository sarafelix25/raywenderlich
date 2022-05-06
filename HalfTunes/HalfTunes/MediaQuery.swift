//
//  MediaQuery.swift
//  HalfTunes
//
//  Created by Sara Batista dos Santos Felix on 06/05/22.
//  Copyright © 2022 raywenderlich. All rights reserved.
//

import Foundation
import Combine

class MediaQuery: ObservableObject {
    
    @Published var itunesQuery = ""
    @Published var searchResults: [MusicItem] = []
    var subscriptions: Set<AnyCancellable> = []
    
    init() {
        $itunesQuery
            .debounce(for: .milliseconds(700), scheduler: RunLoop.main)
            .removeDuplicates()
            .compactMap { query in
                let searchUrl = "https://itunes.apple.com/search?media=music&entity=song&term=\(query)"
                return URL(string: searchUrl)
            }
            .flatMap(fetchMusic)
            .receive(on: DispatchQueue.main)
            .assign(to: \.searchResults, on: self)
            .store(in: &subscriptions)
    }
    
    func fetchMusic(for url: URL) -> AnyPublisher<[MusicItem], Never> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MediaResponse.self, decoder: JSONDecoder())
            .map(\.results)
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
