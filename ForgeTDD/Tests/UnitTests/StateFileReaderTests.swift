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
  private var reader: StateFileReader!

  override func setUp() {
    super.setUp()
    reader = StateFileReader()
  }

  /// ファイルが存在しない場合のエラーをテスト
  func testStateFileNotFound() {
    // Given: 存在しないファイルパス
    let filePath = "/invalid/path/to/state.yaml"

    // When: ファイル読み込みを試みる
    do {
      _ = try reader.readContents(from: filePath)
      XCTFail("Expected error when reading from a non-existent file, but no error was thrown.")
    }
    catch {
      // Then: 適切なエラーがスローされる
      XCTAssertEqual(
        error as? StateFileError,
        StateFileError.fileNotFound("File not found at path: \(filePath)")
      )
    }
  }
}
