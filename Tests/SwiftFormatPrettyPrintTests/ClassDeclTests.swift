import SwiftFormatConfiguration

public class ClassDeclTests: PrettyPrintTestCase {

  public func testBasicClassDeclarations() {
    let input =
      """
      class MyClass {
        let A: Int
        let B: Bool
      }
      public class MyClass {
        let A: Int
        let B: Bool
      }
      public class MyLongerClass {
        let A: Int
        let B: Bool
      }
      """

    let expected =
      """
      class MyClass {
        let A: Int
        let B: Bool
      }
      public class MyClass {
        let A: Int
        let B: Bool
      }
      public class
        MyLongerClass
      {
        let A: Int
        let B: Bool
      }

      """

    assertPrettyPrintEqual(input: input, expected: expected, linelength: 25)
  }

  public func testGenericClassDeclarations_noPackArguments() {
    let input =
      """
      class MyClass<T> {
        let A: Int
        let B: Bool
      }
      class MyClass<T, S> {
        let A: Int
        let B: Bool
      }
      class MyClass<One, Two, Three, Four> {
        let A: Int
        let B: Bool
      }
      """

    let expected =
      """
      class MyClass<T> {
        let A: Int
        let B: Bool
      }
      class MyClass<T, S> {
        let A: Int
        let B: Bool
      }
      class MyClass<
        One,
        Two,
        Three,
        Four
      > {
        let A: Int
        let B: Bool
      }

      """

    let config = Configuration()
    config.lineBreakBeforeEachArgument = true
    assertPrettyPrintEqual(input: input, expected: expected, linelength: 30)
  }

  public func testGenericClassDeclarations_packArguments() {
    let input =
      """
      class MyClass<T> {
        let A: Int
        let B: Bool
      }
      class MyClass<T, S> {
        let A: Int
        let B: Bool
      }
      class MyClass<One, Two, Three, Four> {
        let A: Int
        let B: Bool
      }
      """

    let expected =
      """
      class MyClass<T> {
        let A: Int
        let B: Bool
      }
      class MyClass<T, S> {
        let A: Int
        let B: Bool
      }
      class MyClass<
        One, Two, Three, Four
      > {
        let A: Int
        let B: Bool
      }

      """

    let config = Configuration()
    config.lineBreakBeforeEachArgument = false
    assertPrettyPrintEqual(input: input, expected: expected, linelength: 30, configuration: config)
  }

  public func testClassInheritence() {
    let input =
      """
      class MyClass: SuperOne {
        let A: Int
        let B: Bool
      }
      class MyClass: SuperOne, SuperTwo {
        let A: Int
        let B: Bool
      }
      class MyClass: SuperOne, SuperTwo, SuperThree {
        let A: Int
        let B: Bool
      }
      """

    let expected =
      """
      class MyClass: SuperOne {
        let A: Int
        let B: Bool
      }
      class MyClass: SuperOne, SuperTwo {
        let A: Int
        let B: Bool
      }
      class MyClass: SuperOne, SuperTwo,
        SuperThree
      {
        let A: Int
        let B: Bool
      }

      """

    assertPrettyPrintEqual(input: input, expected: expected, linelength: 40)
  }

  public func testClassWhereClause() {
    let input =
      """
      class MyClass<S, T> where S: Collection {
        let A: Int
        let B: Double
      }
      class MyClass<S, T> where S: Collection, T: ReallyLongClassName {
        let A: Int
        let B: Double
      }
      class MyClass<S, T> where S: Collection, T: ReallyLongClassName, U: LongerClassName {
        let A: Int
        let B: Double
      }
      """

    let expected =
      """
      class MyClass<S, T> where S: Collection {
        let A: Int
        let B: Double
      }
      class MyClass<S, T>
      where S: Collection, T: ReallyLongClassName {
        let A: Int
        let B: Double
      }
      class MyClass<S, T>
      where S: Collection, T: ReallyLongClassName,
        U: LongerClassName
      {
        let A: Int
        let B: Double
      }

      """

    assertPrettyPrintEqual(input: input, expected: expected, linelength: 60)
  }

  public func testClassWhereClauseWithInheritence() {
    let input =
      """
      class MyClass<S, T>: SuperOne where S: Collection {
        let A: Int
        let B: Double
      }
      class MyClass<S, T>: SuperOne, SuperTwo where S: Collection, T: Protocol {
        let A: Int
        let B: Double
      }
      """

    let expected =
      """
      class MyClass<S, T>: SuperOne where S: Collection {
        let A: Int
        let B: Double
      }
      class MyClass<S, T>: SuperOne, SuperTwo
      where S: Collection, T: Protocol {
        let A: Int
        let B: Double
      }

      """

    assertPrettyPrintEqual(input: input, expected: expected, linelength: 60)
  }

  public func testClassAttributes() {
    let input =
      """
      @dynamicMemberLookup public class MyClass {
        let A: Int
        let B: Double
      }
      @dynamicMemberLookup @objc public class MyClass {
        let A: Int
        let B: Double
      }
      @dynamicMemberLookup @objc @objcMembers public class MyClass {
        let A: Int
        let B: Double
      }
      @dynamicMemberLookup @available(swift 4.0)
      public class MyClass {
        let A: Int
        let B: Double
      }
      """

    let expected =
      """
      @dynamicMemberLookup public class MyClass {
        let A: Int
        let B: Double
      }
      @dynamicMemberLookup @objc public class MyClass {
        let A: Int
        let B: Double
      }
      @dynamicMemberLookup @objc @objcMembers
      public class MyClass {
        let A: Int
        let B: Double
      }
      @dynamicMemberLookup @available(swift 4.0)
      public class MyClass {
        let A: Int
        let B: Double
      }

      """

    assertPrettyPrintEqual(input: input, expected: expected, linelength: 55)
  }

  public func testClassFullWrap() {
    let input =
      """
      public class MyContainer<BaseCollection, SecondCollection>: MyContainerSuperclass, MyContainerProtocol, SomeoneElsesContainerProtocol, SomeFrameworkContainerProtocol where BaseCollection: Collection, BaseCollection.Element: Equatable, BaseCollection.Element: SomeOtherProtocol {
        let A: Int
        let B: Double
      }
      """

    let expected =

      """
      public class MyContainer<
        BaseCollection, SecondCollection
      >: MyContainerSuperclass, MyContainerProtocol,
        SomeoneElsesContainerProtocol,
        SomeFrameworkContainerProtocol
      where BaseCollection: Collection,
        BaseCollection.Element: Equatable,
        BaseCollection.Element: SomeOtherProtocol
      {
        let A: Int
        let B: Double
      }

      """

    let config = Configuration()
    config.lineBreakBeforeEachArgument = false
    assertPrettyPrintEqual(input: input, expected: expected, linelength: 50, configuration: config)
  }

  public func testEmptyClass() {
    let input = "class Foo {}"
    assertPrettyPrintEqual(input: input, expected: input + "\n", linelength: 50)

    let wrapped = """
      class Foo {
      }

      """
    assertPrettyPrintEqual(input: input, expected: wrapped, linelength: 11)
  }

  public func testEmptyClassWithComment() {
    let input = """
      class Foo {
        // foo
      }
      """
    assertPrettyPrintEqual(input: input, expected: input + "\n", linelength: 50)
  }

  public func testOneMemberClass() {
    let input = "class Foo { var bar: Int }"
    assertPrettyPrintEqual(input: input, expected: input + "\n", linelength: 50)
  }
}
