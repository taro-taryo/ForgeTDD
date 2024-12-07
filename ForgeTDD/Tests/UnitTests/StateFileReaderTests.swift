//
//  StateFileReaderTests.swift
//  ForgeTDDTests
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
  //  func testStateFileNotFound() {
  //    let filePath = "/invalid/path/to/state.yaml"
  //    do {
  //      _ = try reader.readContents(from: filePath)
  //      XCTFail("ファイルが存在しない場合にエラーがスローされるべきです。")
  //    }
  //    catch {
  //      XCTAssertEqual(
  //        error as? StateFileError,
  //        StateFileError.fileNotFound(ErrorMessages.fileNotFound(filePath))
  //      )
  //    }
  //  }
  //  func testStateFileEmptyContent() {
  //    let testDirectory = FileManager.default.temporaryDirectory.appendingPathComponent(
  //      "TestResources"
  //    )
  //    let filePath = testDirectory.appendingPathComponent("empty_state.yaml").path
  //    try? FileManager.default.createDirectory(
  //      at: testDirectory,
  //      withIntermediateDirectories: true,
  //      attributes: nil
  //    )
  //    FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
  //    defer { try? FileManager.default.removeItem(atPath: filePath) }
  //    do {
  //      _ = try reader.readContents(from: filePath)
  //      XCTFail("空のファイルが存在する場合にエラーがスローされるべきです。")
  //    }
  //    catch {
  //      XCTAssertEqual(
  //        error as? StateFileError,
  //        StateFileError.emptyContent(ErrorMessages.emptyContent(filePath))
  //      )
  //    }
  //  }
  func testStateFileInvalidYAMLFormat() {
    let testDirectory = FileManager.default.temporaryDirectory.appendingPathComponent(
      "TestResources"
    )
    let filePath = testDirectory.appendingPathComponent("invalid_state.yaml").path
    let invalidYAMLContent = "Invalid YAML Content: : :"
    try? FileManager.default.createDirectory(
      at: testDirectory,
      withIntermediateDirectories: true,
      attributes: nil
    )
    FileManager.default.createFile(
      atPath: filePath,
      contents: invalidYAMLContent.data(using: .utf8),
      attributes: nil
    )
    do {
      _ = try reader.readContents(from: filePath)
      XCTFail("無効な YAML フォーマットの場合にエラーがスローされるべきです。")
    }
    catch {
      XCTAssertEqual(
        error as? StateFileError,
        StateFileError.invalidFormat(ErrorMessages.invalidFormat(filePath))
      )
    }
    // 一時ファイル削除
    do { try FileManager.default.removeItem(atPath: filePath) }
    catch { XCTFail("一時ファイルの削除に失敗しました: \(error)") }
  }
}
