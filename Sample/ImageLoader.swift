//
//  ImageLoader.swift
//  Sample
//
//  Created by Tony Tran on 2021-01-27.
//

import SwiftUI

// MARK: - ImageLoader

/// Loads an image from some URL and caches it on disk.
class ImageLoader: ObservableObject {
    @Published var image: UIImage = UIImage()

    private static let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let urlCache = URLCache(memoryCapacity: 60 * 1024 * 1024, diskCapacity: 50 * 1024 * 1024)
        configuration.urlCache = urlCache
        configuration.requestCachePolicy = .returnCacheDataElseLoad

        return URLSession(configuration: configuration)
    }()

    func load(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = Self.session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

//            ImageCache.set(data, for: url)
            completion(UIImage(data: data))
        }
        task.resume()
    }
}
