# Jap Style
A coding and indent style developer by the Computer Scientist known as [Robert 'Bobby' Jap](https://github.com/BJap). This is a subset of [Allman](https://en.wikipedia.org/wiki/Indent_style#Allman_style) indent style. The purpose here is to meet a middle ground of conciseness and readability both, and to acknowledge the higher resolution displays that are available today that render most other style arguments invalid.

## Braces
Braces should follow Allman style in most cases for readability.

Flow control should be put on one line if there is only one execution statement, and the statement is not excessively long, which reads even nicer.

Example 1:
```
if isActive { return settings }
```

Example 2:
```
if isActive
{
    settings.add(setting)
    settings.update()
}
else { settings.clear() }
```

Example 3:
```
for i in 0...5 { print("\(i)") }
```

Closing braces with no more code to execute between them should have no whitespace between them

Example:
```
func something()
{
    if isActive
    {
        ...
    }
}
```

## Line length
Lines should be no more than 125 character in length.

Long chaining lines of code, such as those that utilize the builder design pattern or String literals of JSON, should be written on mulitple lines for readability.

Example 1:
```
Mananger
    .doSomething()
    .somethingElse()
    .oneLastThing()
    .Build()
```

## Whitespace
Be sure to use spaces only not the tab character. 'Tabs' should use four spaces. Empty lines should have no whitespace at all.

Empty lines are to exist between:

Classes and extensions
```
class Example
{
    ...
}

extension Example
{
    ...
}
```

Enums
```
enum Example
{
    ...
}

enum Use
{
    ...
}
```

Enums and structs
```
enum Example
{
    ...
}

struct Use
{
    ...
}
```

Structs
```
struct Example
{
    ...
}

struct Use
{
    ...
}
```

Constants and variables
```
let name = "Bob"
let phone = "5555551212"

var env: Environment
```

Variables and functions
```
var env: Environment

public static func testEnvironment()
{
    ...
}
```

Functions
```
func doSomething()
{
    ...
}

func doSomethingElse()
{
    ...
}
```

Variables that are immediately mutated or utilized
```
func doSomething()
{
    var name = "test"

    var phone: Phone = phone(name)
    phone.call()
    
    name = "next"
}
```
