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
  case invalidFormat(String)
}
