//
//  StateFileError.swift
//  ForgeTDD
//
//  Created by taro-taryo on 2024/12/01
//
//

import Foundation

/// 状態ファイルの操作に関連するエラー
enum StateFileError: Error, Equatable {
  case fileNotFound(String)
  case emptyContent(String)
}
