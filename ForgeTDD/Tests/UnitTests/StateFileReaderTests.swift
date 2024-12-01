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
  // Red Phase: 状態ファイルの内容が空の場合の挙動をテスト
  func testStateFileEmptyContent() {
    // Given: 存在するが内容が空のファイル
    let testDirectory = FileManager.default.temporaryDirectory.appendingPathComponent(
      "TestResources"
    )
    let filePath = testDirectory.appendingPathComponent("empty_state.yaml").path
    // テスト用ディレクトリを作成
    try? FileManager.default.createDirectory(
      at: testDirectory,
      withIntermediateDirectories: true,
      attributes: nil
    )
    // 空のファイルを作成
    FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
    defer {
      // テスト終了後にファイルを削除
      try? FileManager.default.removeItem(atPath: filePath)
    }
    // When: 状態ファイルを読み込む
    do {
      _ = try reader.readContents(from: filePath)
      XCTFail("Expected error when reading an empty file, but no error was thrown.")
    }
    catch {
      // Then: 適切なエラーがスローされる
      XCTAssertEqual(
        error as? StateFileError,
        StateFileError.emptyContent("File at path \(filePath) is empty.")
      )
    }
  }

}
