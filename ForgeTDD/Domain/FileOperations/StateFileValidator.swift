//
//  StateFileValidator.swift
//  ForgeTDD
//
//  Created by taro-taryo on 2024/12/01
//
//
import Foundation
import Yams

/// `StateFileValidator` は、状態ファイルの存在確認や内容の妥当性を検証する責務を持つクラスです。
struct StateFileValidator {
  /// 指定されたパスにファイルが存在することを確認します。
  /// - Parameter path: 検証対象のファイルパス。
  /// - Throws: ファイルが存在しない場合に `StateFileError.fileNotFound` をスローします。
  func validateFileExists(at path: String) throws {
    guard FileManager.default.fileExists(atPath: path) else {
      throw StateFileError.fileNotFound(ErrorMessages.fileNotFound(path))
    }
  }

  /// 指定されたパスのファイルが空でないことを確認します。
  /// - Parameter path: 検証対象のファイルパス。
  /// - Throws: ファイルが空の場合に `StateFileError.emptyContent` をスローします。
  func validateFileNotEmpty(at path: String) throws {
    let fileContents = try String(contentsOfFile: path, encoding: .utf8)
    guard !fileContents.isEmpty else {
      throw StateFileError.emptyContent(ErrorMessages.emptyContent(path))
    }
  }

  /// YAML フォーマットを検証します。
  /// - Parameter path: 検証対象のファイルパス。
  /// - Throws: 無効な YAML フォーマットの場合に `StateFileError.invalidFormat` をスローします。
  func validateYamlFormat(at path: String) throws {
    let fileContents = try String(contentsOfFile: path, encoding: .utf8)
    do { _ = try Yams.load(yaml: fileContents) }
    catch { throw StateFileError.invalidFormat(ErrorMessages.invalidFormat(path)) }
  }
}
