//
//  StateFileReaderTests.swift
//  ForgeTDD
//
//  Created by taro-taryo on 2024/12/01
//
//

import XCTest

@testable import ForgeTDD

final class StateFileReaderTests: XCTestCase {
  // Red Phase: 状態ファイルが存在しない場合の挙動をテスト
  func testStateFileNotFound() {
    // Given: 存在しないファイルパス
    let filePath = "/invalid/path/to/state.yaml"
    let reader = StateFileReader()

    // When: 状態ファイルを読み込む
    do {
      _ = try reader.read(from: filePath)
      XCTFail("Expected error when reading from a non-existent file, but no error was thrown.")
    }
    catch {
      // Then: 適切なエラーがスローされる
      XCTAssertEqual(error as? StateFileError, StateFileError.fileNotFound)
    }
  }
}
