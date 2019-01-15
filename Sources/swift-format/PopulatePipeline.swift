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

// This file is automatically generated with generate-pipeline. Do Not Edit!
import SwiftFormatCore
import SwiftFormatRules
import SwiftSyntax

/// Populates the provided pipeline with all implemented formatting and linting passes.
///
/// - Parameter pipeline: The pipeline to populate with passes.
func populate(_ pipeline: Pipeline) {
  /// MARK: File Passes
  pipeline.addFileRule(UseOnlySpaces.self)
  pipeline.addFileRule(UseOnlyUTF8.self)
  pipeline.addFileRule(UseSpecialEscapeSequences.self)
  pipeline.addFileRule(ValidFilename.self)

  /// MARK: Formatting Passes

  pipeline.addFormatter(
    BlankLineBetweenMembers.self,
    for:
      MemberDeclBlockSyntax.self
  )

  pipeline.addFormatter(
    CloseBraceWhitespace.self,
    for:
      TokenSyntax.self
  )

  pipeline.addFormatter(
    CollectionLiteralWhitespace.self,
    for:
      TokenSyntax.self
  )

  pipeline.addFormatter(
    ColonWhitespace.self,
    for:
      TokenSyntax.self
  )

  pipeline.addFormatter(
    CommaWhitespace.self,
    for:
      TokenSyntax.self
  )

  pipeline.addFormatter(
    DoNotUseSemicolons.self,
    for:
      CodeBlockSyntax.self,
      SourceFileSyntax.self
  )

  pipeline.addFormatter(
    FullyIndirectEnum.self,
    for:
      EnumDeclSyntax.self
  )

  pipeline.addFormatter(
    GroupNumericLiterals.self,
    for:
      IntegerLiteralExprSyntax.self
  )

  pipeline.addFormatter(
    MaximumBlankLines.self,
    for:
      TokenSyntax.self
  )

  pipeline.addFormatter(
    MultiLineTrailingCommas.self,
    for:
      ArrayExprSyntax.self,
      DictionaryExprSyntax.self
  )

  pipeline.addFormatter(
    NoAccessLevelOnExtensionDeclaration.self,
    for:
      ExtensionDeclSyntax.self
  )

  pipeline.addFormatter(
    NoBlockComments.self,
    for:
      TokenSyntax.self
  )

  pipeline.addFormatter(
    NoCasesWithOnlyFallthrough.self,
    for:
      SwitchStmtSyntax.self
  )

  pipeline.addFormatter(
    NoEmptyAssociatedValues.self,
    for:
      EnumCaseDeclSyntax.self
  )

  pipeline.addFormatter(
    NoEmptyTrailingClosureParentheses.self,
    for:
      FunctionCallExprSyntax.self
  )

  pipeline.addFormatter(
    NoLabelsInCasePatterns.self,
    for:
      SwitchCaseLabelSyntax.self
  )

  pipeline.addFormatter(
    NoParensAroundConditions.self,
    for:
      ConditionElementSyntax.self,
      IfStmtSyntax.self,
      RepeatWhileStmtSyntax.self,
      SwitchStmtSyntax.self
  )

  pipeline.addFormatter(
    NoVoidReturnOnFunctionSignature.self,
    for:
      FunctionSignatureSyntax.self
  )

  pipeline.addFormatter(
    OneCasePerLine.self,
    for:
      EnumDeclSyntax.self
  )

  pipeline.addFormatter(
    OneSpaceAfterKeywords.self,
    for:
      TokenSyntax.self
  )

  pipeline.addFormatter(
    OneSpaceInsideBraces.self,
    for:
      TokenSyntax.self
  )

  pipeline.addFormatter(
    OneVariableDeclarationPerLine.self,
    for:
      AccessorBlockSyntax.self,
      ClosureExprSyntax.self,
      CodeBlockSyntax.self,
      SourceFileSyntax.self
  )

  pipeline.addFormatter(
    OpenBraceWhitespace.self,
    for:
      TokenSyntax.self
  )

  pipeline.addFormatter(
    OperatorWhitespace.self,
    for:
      CompositionTypeElementListSyntax.self,
      ExprListSyntax.self
  )

  pipeline.addFormatter(
    OrderedImports.self,
    for:
      SourceFileSyntax.self
  )

  pipeline.addFormatter(
    ReturnVoidInsteadOfEmptyTuple.self,
    for:
      FunctionTypeSyntax.self
  )

  pipeline.addFormatter(
    UseEarlyExits.self,
    for:
      CodeBlockItemListSyntax.self
  )

  pipeline.addFormatter(
    UseEnumForNamespacing.self,
    for:
      ClassDeclSyntax.self,
      StructDeclSyntax.self
  )

  pipeline.addFormatter(
    UseShorthandTypeNames.self,
    for:
      SimpleTypeIdentifierSyntax.self,
      SpecializeExprSyntax.self
  )

  pipeline.addFormatter(
    UseSingleLinePropertyGetter.self,
    for:
      AccessorBlockSyntax.self
  )

  pipeline.addFormatter(
    UseTripleSlashForDocumentationComments.self,
    for:
      ClassDeclSyntax.self,
      DeinitializerDeclSyntax.self,
      EnumDeclSyntax.self,
      ExtensionDeclSyntax.self,
      FunctionDeclSyntax.self,
      InitializerDeclSyntax.self,
      ProtocolDeclSyntax.self,
      StructDeclSyntax.self,
      SubscriptDeclSyntax.self,
      TypealiasDeclSyntax.self,
      VariableDeclSyntax.self
  )

  pipeline.addFormatter(
    UseWhereClausesInForLoops.self,
    for:
      ForInStmtSyntax.self
  )

  /// MARK: Linting Passes

  pipeline.addLinter(
    AllPublicDeclarationsHaveDocumentation.self,
    for:
      ClassDeclSyntax.self,
      DeinitializerDeclSyntax.self,
      FunctionDeclSyntax.self,
      InitializerDeclSyntax.self,
      ProtocolDeclSyntax.self,
      StructDeclSyntax.self,
      SubscriptDeclSyntax.self,
      TypealiasDeclSyntax.self,
      VariableDeclSyntax.self
  )

  pipeline.addLinter(
    AlwaysUseLowerCamelCase.self,
    for:
      EnumCaseElementSyntax.self,
      FunctionDeclSyntax.self,
      VariableDeclSyntax.self
  )

  pipeline.addLinter(
    AmbiguousTrailingClosureOverload.self,
    for:
      CodeBlockSyntax.self,
      MemberDeclBlockSyntax.self,
      SourceFileSyntax.self
  )

  pipeline.addLinter(
    AvoidInitializersForLiterals.self,
    for:
      FunctionCallExprSyntax.self
  )

  pipeline.addLinter(
    BeginDocumentationCommentWithOneLineSummary.self,
    for:
      ClassDeclSyntax.self,
      DeinitializerDeclSyntax.self,
      EnumDeclSyntax.self,
      FunctionDeclSyntax.self,
      InitializerDeclSyntax.self,
      ProtocolDeclSyntax.self,
      StructDeclSyntax.self,
      SubscriptDeclSyntax.self,
      TypealiasDeclSyntax.self,
      VariableDeclSyntax.self
  )

  pipeline.addLinter(
    CaseIndentLevelEqualsSwitch.self,
    for:
      SwitchStmtSyntax.self
  )

  pipeline.addLinter(
    CommentWhitespace.self,
    for:
      TokenSyntax.self
  )

  pipeline.addLinter(
    DontRepeatTypeInStaticProperties.self,
    for:
      ClassDeclSyntax.self,
      EnumDeclSyntax.self,
      ExtensionDeclSyntax.self,
      ProtocolDeclSyntax.self,
      StructDeclSyntax.self
  )

  pipeline.addLinter(
    IdentifiersMustBeASCII.self,
    for:
      IdentifierPatternSyntax.self
  )

  pipeline.addLinter(
    NeverForceUnwrap.self,
    for:
      AsExprSyntax.self,
      ForcedValueExprSyntax.self,
      SourceFileSyntax.self
  )

  pipeline.addLinter(
    NeverUseForceTry.self,
    for:
      SourceFileSyntax.self,
      TryExprSyntax.self
  )

  pipeline.addLinter(
    NeverUseImplicitlyUnwrappedOptionals.self,
    for:
      SourceFileSyntax.self,
      VariableDeclSyntax.self
  )

  pipeline.addLinter(
    NoLeadingUnderscores.self,
    for:
      AssociatedtypeDeclSyntax.self,
      ClassDeclSyntax.self,
      EnumCaseElementSyntax.self,
      EnumDeclSyntax.self,
      FunctionDeclSyntax.self,
      FunctionParameterSyntax.self,
      GenericParameterSyntax.self,
      IdentifierPatternSyntax.self,
      PrecedenceGroupDeclSyntax.self,
      ProtocolDeclSyntax.self,
      StructDeclSyntax.self,
      TypealiasDeclSyntax.self
  )

  pipeline.addLinter(
    OnlyOneTrailingClosureArgument.self,
    for:
      FunctionCallExprSyntax.self
  )

  pipeline.addLinter(
    UseLetInEveryBoundCaseVariable.self,
    for:
      SwitchCaseLabelSyntax.self
  )

  pipeline.addLinter(
    UseSynthesizedInitializer.self,
    for:
      StructDeclSyntax.self
  )

  pipeline.addLinter(
    ValidateDocumentationComments.self,
    for:
      FunctionDeclSyntax.self
  )
}
