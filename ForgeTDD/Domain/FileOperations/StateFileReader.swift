//
//  StateFileReader.swift
//  ForgeTDD
//
//  Created by taro-taryo on 2024/12/01
//
//

import Foundation

struct StateFileReader {
  /// ファイルの存在を検証
  /// - Parameter path: 検証するファイルパス
  func validateFileExists(at path: String) throws {
    guard FileManager.default.fileExists(atPath: path) else {
      throw StateFileError.fileNotFound("File not found at path: \(path)")
    }
  }

  /// ファイルの内容を読み取る
  /// - Parameter path: 読み取るファイルパス
  /// - Returns: ファイル内容の文字列
  func readContents(from path: String) throws -> String {
    try validateFileExists(at: path)
    return try String(contentsOfFile: path, encoding: .utf8)
  }
}