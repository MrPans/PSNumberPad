# PSNumberPad Change Log
-----

### Upgrade v1.2.0  

**delete** factory method `+pad` and `-numberPad`,and add `-init` method for Swift compatible, also for API unitive.

use `[[PSNumberPad alloc] init]` initialize PSNumberPad in Objective-C, or `PSNumberPad()` in Swift.

### Upgrade v1.1.2

Fix bug — image disappear when number pad show up

### Upgrade v1.1.1

Cause Swift can’t auto-Convert `+pad` to be a convenience initilazer,PSNumberPad provide another way to implement that.

In Swift,use `-numberPad` to initialize your var like that
\`\`\`
var numberPad = PSNumberPad().numberPad()
\`\`\`

# PSNumberPad 更新日志

------

### 更新v1.2.0  

**删除**了两个工厂方法：`+pad` 和 `-numberPad`,添加了 `-init` 作为唯一初始化方法，来保证接口统一，并且兼容Swift.

oc中初始化方法: `[[PSNumberPad alloc] init] `
Swift中初始化方法: `PSNumberPad()`


### 更新v1.1.2

修复BUG — 资源图片未能正确读取

### 更新v1.1.1

由于Swift未能自动将初始化方法`+numberPad`转换成便利初始化方法，且又无法直接当做类方法来调用。此次更新提供了另一个途径来实现PSNumberPad的初始化。

在Swift中，用以下代码来初始化PSNumberPad.
\`\`\`
var numberPad = PSNumberPad().numberPad()
\`\`\`
