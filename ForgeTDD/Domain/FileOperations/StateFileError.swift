//
//  StateFileError.swift
//  ForgeTDD
//
//  Created by taro-taryo on 2024/12/01
//
//
import Foundation

/// `StateFileError` は、状態ファイル操作時に発生する可能性のあるエラーを表します。
enum StateFileError: Error, Equatable {
  /// ファイルが見つからなかった場合に発生するエラー。
  case fileNotFound(String)
  /// ファイルが空の場合に発生するエラー。
  case emptyContent(String)
  /// 無効な YAML フォーマットの場合に発生するエラー。
  case invalidFormat(String)
}

/// エラーメッセージを定義する構造体
struct ErrorMessages {
  static func fileNotFound(_ path: String) -> String { "指定されたパスにファイルが見つかりません: \(path)" }

  static func emptyContent(_ path: String) -> String { "指定されたパスのファイルは空です: \(path)" }

  static func invalidFormat(_ path: String) -> String { "無効な YAML フォーマットです: \(path)" }
}
