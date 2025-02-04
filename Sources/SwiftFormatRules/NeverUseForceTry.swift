//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2018 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import Foundation
import SwiftFormatCore
import SwiftSyntax

/// Force-try (`try!`) is forbidden.
///
/// This rule does not apply to test code, defined as code which:
///   * Contains the line `import XCTest`
///
/// Lint: Using `try!` results in a lint error.
///
/// TODO: Create exception for NSRegularExpression
///
/// - SeeAlso: https://google.github.io/swift#error-types
public struct NeverUseForceTry: SyntaxLintRule {

  public let context: Context

  public init(context: Context) {
    self.context = context
  }

  public func visit(_ node: SourceFileSyntax) -> SyntaxVisitorContinueKind {
    setImportsXCTest(context: context, sourceFile: node)
    return .visitChildren
  }

  public func visit(_ node: TryExprSyntax) -> SyntaxVisitorContinueKind {
    // TODO: Generalize the `isRuleDisabled` check so it doesn't need to be performed manually for
    // each rule.
    guard !context.isRuleDisabled(self.ruleName, node: node) else { return .visitChildren }
    guard !context.importsXCTest else { return .skipChildren }
    guard let mark = node.questionOrExclamationMark else { return .visitChildren }
    if mark.tokenKind == .exclamationMark {
      diagnose(.doNotForceTry, on: node.tryKeyword)
    }
    return .visitChildren
  }
}

extension Diagnostic.Message {
  static let doNotForceTry = Diagnostic.Message(.warning, "do not use force try")
}
