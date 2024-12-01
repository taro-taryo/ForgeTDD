//
//  StateFileReader.swift
//  ForgeTDD
//
//  Created by taro-taryo on 2024/12/01
//
//

import Foundation

enum StateFileError: Error { case fileNotFound }

class StateFileReader {
  func read(from path: String) throws -> String {
    let fileManager = FileManager.default

    guard fileManager.fileExists(atPath: path) else { throw StateFileError.fileNotFound }

    return try String(contentsOfFile: path, encoding: .utf8)
  }
}
