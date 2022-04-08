---
date: 2022-02-2 20:22
description: 🧪 Quickly test expectations
tags: swift, spm, testing
---
# Testing code with t SPM 📦
*[🔗 Check out t](https://github.com/0xOpenBytes/t)*

<br/>

```shell
git clone git@github.com:0xOpenBytes/t.git
```

<br/>

## What is `t`?
`t` is a simple testing framework using closures and errors. You have the ability to create a suite that has multiple steps, expectations, and asserts. Expectations can be used to expect one or multiple assertions. It can be used to test quickly inside a function to make sure something is working as expected. `t` can also be used in unit test if wanted.

<br/><br/>

### Creating a Test Suite

<br/>

Using `t.suite(...)` you can create a test suite that will return false if any error is thrown. Test suites contains multiple steps, expectations, assertions, and even test suites. All logging will use `t.logger`, which defaults to `print(...)`. 

<br/>

Example Test Suite

<br/>

```swift
// Create Test Suite
t.suite {
    // Add an expectation that asserting true is true and that 2 is equal to 2
    try t.expect {
        try t.assert(true)
        try t.assert(2, isEqualTo: 2)
    }
    
    // Add an assertion that asserting false is not true
    try t.assert(notTrue: false)
    
    // Add an assertion that "Hello" is not equal to "World"
    try t.assert("Hello", isNotEqualTo: "World")
    
    // Log a message
    t.log("📣 Test Log Message")
    
    // Log a t.error
    t.log(error: t.error(description: "Mock Error"))
    
    // Add an assertion to check if a value is nil
    let someValue: String? = nil
    try t.assert(isNil: someValue)
    
    // Add an assertion to check if a value is not nil
    let someOtherValue: String? = "💠"
    try t.assert(isNotNil: someOtherValue)
}
```

<br/>

**Example Test Suite Output**

<br/>

```
🧪 Testing Suite
🔘 Expecting something to be true
📣 Test Log Message
❗️ Mock Error (
    File: tTests.swift
    Function: testExample()
    Line: 25
)
✅ Suite Passed!
```

<br/>

### Making Expectations

<br/>

Using t.expect(...) we can make an expectation with one or multiple assertions. We can create variables and log messages too. The expectation will be true unless some error is thrown. The error might be thrown by an assertion or can be thrown manually too.

<br/>

**Example Expectation**

<br/>

```swift
try t.expect("true is true and that 2 is equal to 2") {
    try t.assert(true)
    try t.assert(2, isEqualTo: 2)
}
```

<br/>

**Example Expectation Output**

<br/>

```
🔘 Expecting true is true and that 2 is equal to 2
```

<br/>

**Making an Assertion**

<br/>

```swift
try t.assert("Hello", isNotEqualTo: "World")
```

<br/>

### Logging Information

<br/>

Test suite information is automatically logged using `t.logger`. The logger is a static variable of type `(String) -> Void` which has a default value of `{ print($0) }`. Feel free to supply your own logging function. Manual logging should use `t.log(String)` or `t.log(error: Error)`.

<br/>

**Example Manual Logging**

<br/>

```swift
// Log a message
t.log("📣 Test Log Message")

// Log a t.error
t.log(error: t.error(description: "Mock Error"))

// Log any error
struct SomeError: Error { }
t.log(error: SomeError())
```

<br/>

**Quick Testing**

<br/>

```swift
t.suite {
    try t.expect {
        let expectedValue = ...
        let value = function()
        try t.assert(value, isEqualTo: expectedValue)
    }
}
```

<br/>

**Unit Tests**

<br/>

**XCTAssert Test Suite**

<br/>

```swift
XCTAssert(
    t.suite {
        // ...
    }
)
```

<br/>

**XCTAssertNoThrow Expectation**

<br/>

```swift
XCTAssertNoThrow(
    try t.expect("true is true and that 2 is equal to 2") {
        try t.assert(true)
        try t.assert(2, isEqualTo: 2)
    }
)
```

<br/>

**XCTAssertNoThrow Assert**

<br/>

```swift
XCTAssertNoThrow(
    try t.assert(true)
)
```

<br/>


<br/>

[⬆️ Back to the Top](/posts/spm-closure/)
