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
        if let data = ImageCache.data(for: url) {
            completion(UIImage(data: data))
            
            return
        }

        let task = Self.session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            ImageCache.set(data, for: url)

            completion(UIImage(data: data))
        }
        task.resume()
    }
}

private enum ImageCache {
    private static let cachePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first

    static func data(for url: URL) -> Data? {
        Self.filePath(for: url).flatMap {
            try? Data(contentsOf: $0)
        }
    }

    static func set(_ data: Data?, for url: URL) {
        guard let data = data, let filePath = Self.filePath(for: url) else { return }

        do {
            try data.write(to: filePath, options: .atomicWrite)
        }
        catch {
            print(error.localizedDescription)
        }
    }

    private static func filePath(for url: URL) -> URL? {
        cachePath?.appendingPathComponent("\(url.absoluteString.hash)", isDirectory: false)
    }
}
