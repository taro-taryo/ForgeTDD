//
//  StateFileReader.swift
//  ForgeTDD
//
//  Created by taro-taryo on 2024/12/01
//
//

import Foundation

/// `StateFileReader` は、状態ファイルの内容を読み取る責務を持つクラスです。
/// ファイルの存在や内容の妥当性の確認は `StateFileValidator` に委譲されます。
struct StateFileReader {
  private let validator = StateFileValidator()

  /// 指定されたパスの状態ファイルを読み取ります。
  /// - Parameter path: 読み取り対象のファイルパス。
  /// - Returns: ファイルの内容を文字列として返します。
  /// - Throws: ファイルが存在しない、または空の場合に `StateFileError` をスローします。
  func readContents(from path: String) throws -> String {
    try validator.validateFileExists(at: path)
    try validator.validateFileNotEmpty(at: path)
    return try String(contentsOfFile: path, encoding: .utf8)
  }
}
