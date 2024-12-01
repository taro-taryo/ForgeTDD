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

  /// ファイルが存在しない場合に適切なエラーがスローされることをテストします。
  func testStateFileNotFound() {
    let filePath = "/invalid/path/to/state.yaml"
    do {
      _ = try reader.readContents(from: filePath)
      XCTFail("存在しないファイルを読み取った場合にエラーがスローされるべきですが、スローされませんでした。")
    }
    catch {
      XCTAssertEqual(
        error as? StateFileError,
        StateFileError.fileNotFound("指定されたパスにファイルが見つかりません: \(filePath)")
      )
    }
  }

  /// ファイルが空の場合に適切なエラーがスローされることをテストします。
  func testStateFileEmptyContent() {
    let testDirectory = FileManager.default.temporaryDirectory.appendingPathComponent(
      "TestResources"
    )
    let filePath = testDirectory.appendingPathComponent("empty_state.yaml").path
    try? FileManager.default.createDirectory(
      at: testDirectory,
      withIntermediateDirectories: true,
      attributes: nil
    )
    FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
    defer { try? FileManager.default.removeItem(atPath: filePath) }
    do {
      _ = try reader.readContents(from: filePath)
      XCTFail("空のファイルを読み取った場合にエラーがスローされるべきですが、スローされませんでした。")
    }
    catch {
      XCTAssertEqual(
        error as? StateFileError,
        StateFileError.emptyContent("指定されたパスのファイルは空です: \(filePath)")
      )
    }
  }
}
