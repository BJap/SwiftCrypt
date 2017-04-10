# Jap Style
A coding and indent style developer by the Computer Scientist known as [Robert 'Bobby' Jap](https://github.com/BJap). This is a subset of [Allman](https://en.wikipedia.org/wiki/Indent_style#Allman_style) indent style. The purpose here is to meet a middle ground of conciseness and readability both, and to acknowledge the higher resolution displays that are available today that render most other style arguments invalid.

## Braces
Braces should follow Allman style in most cases for readability.

Flow control should be put on one line if there is only one execution statement, and the statement is not excessively long, which reads even nicer.

**Example 1:**
```
if isActive { return settings }
```

**Example 2:**
```
if isActive
{
    settings.add(setting)
    settings.update()
}
else { settings.clear() }
```

**Example 3:**
```
for i in 0...5 { print("\(i)") }
```

Closing braces with no more code to execute between them should have no whitespace between them. This is easier to follow with the eye.

**Example:**
```
func something()
{
    if isActive
    {
        ...
    }
}
```

## Declaration
Variables should be declared in the order that they are used, and not declared until right they will be used. This avoids unnecessary allocation of space in some cases, and makes the code more readable with related parts next to one another.

**Example**
```
func doSomething()
{
    var name = "Joe"
    
    doSomethingName(name)
    
    var phone = "5555551234"
    
    doSomethingPhone(phone)
    
    name = "Fred"
    phone = "5555556789"
    
    doSomethingNamePhone(name, phone)
}
```

## Line length
Lines should be no more than 125 character in length.

Long chaining lines of code, such as those that utilize the builder design pattern or String literals of JSON, should be written on mulitple lines for readability.

**Example 1:**
```
Mananger
    .doSomething()
    .somethingElse()
    .oneLastThing()
    .Build()
```

## Returns
Try to minimize the quanitity of return statements when it makes sense in a given function to ease debuging needs. Multiple return statements are ok for cases such as input parameter validation, and to avoid the pyramid of death (if, if, if, etc). Multiple returns sometimes are optimal for reducing memory allocation also, especially in cases of recursion.

## Whitespace
Be sure to use spaces only not the tab character since various software handles tabs all differently, and it looks bad when some tabs are mixed with some spaces. 'Tabs' should use four spaces. Empty lines should have no whitespace at all.

Empty lines are to exist for readability between:

**Classes and extensions**
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

**Enums**
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

**Enums and structs**
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

**Structs**
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

**Constants and variables**
```
let name = "Bob"
let phone = "5555551212"

var env: Environment
```

**Variables and functions**
```
var env: Environment

public static func testEnvironment()
{
    ...
}
```

**Functions**
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

**Variables that are immediately mutated or utilized**
```
func doSomething()
{
    var name = "test"

    var phone: Phone = phone(name)
    phone.call()
    
    name = "next"
}
```
