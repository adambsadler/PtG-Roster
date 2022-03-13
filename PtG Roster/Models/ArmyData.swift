//
//  ArmyData.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import Foundation
import SwiftUI

class ArmyData: ObservableObject {
    @Published var armies: [Army] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("armies.data")
    }
    
    static func load() async throws -> [Army] {
        try await withCheckedThrowingContinuation { continuation in
            load { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let armies):
                    continuation.resume(returning: armies)
                }
            }
        }
    }
    
    static func load(completion: @escaping (Result<[Army], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let currentArmies = try JSONDecoder().decode([Army].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(currentArmies))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    @discardableResult
    static func save(armies: [Army]) async throws -> Int {
        try await withCheckedThrowingContinuation { continuation in
            save(armies: armies) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let armiesSaved):
                    continuation.resume(returning: armiesSaved)
                }
            }
        }
    }
    
    static func save(armies: [Army], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(armies)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(armies.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
