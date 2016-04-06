# PSNumberPad (中文在后)

A number keyboard for input price.

Apple have many keyboard but no one compeletly suitable the scene,which is price input.
PSNumberPad fill this blank.


### Preview 
![image](https://raw.githubusercontent.com/DeveloperPans/PSNumberPad/master/PSNumberPad.gif)

### Getting Start

#####`Recommend` Import with cocoapods
Add follow line in your podfile.

```ruby
pod 'PSNumberPad'  
```   
#####Import manually
Download zip and unarchiver.Drag 'PSNumberPad' folder into your project.


### Usage
**Make a lazy initlazer.**


```objective-c 

@property (nonatomic, strong) PSNumberPad *numberPad;

- (PSNumberPad *)numberPad
{
    if (!_numberPad)
    {
        _numberPad = [[PSNumberPad alloc] init];
    }
    return _numberPad;
}

```
 
**Tell PSNumberPad with is current inputing textField**

```objective-c

self.numberPad.textField = self.textField;

```

###Notice：
1. The only way to init PSNumberPad is `- (instancetype)init`. Other initialzer is useless.

For more，download and see the demo。

==============================中文分割线==========================

# PSNumberPad
一个仅能输入数字和小数点的键盘。常用于需要输入价格的场景。

苹果的键盘类型已经可以满足大多数开发需求了。但遇上O2O类App的开发 仍然有硬伤，那就是没有一个好用的，仅能输入数字和小数点的键盘。如果用其他键盘，会增加许多处理字符的工作量，最主要的是用户体验比较差。PSNumberPad弥补了这一空白。
### Upgrade v1.1.2
修复BUG — 资源图片未能正确读取
### 更新v1.1.1
由于Swift未能自动将初始化方法`+numberPad`转换成便利初始化方法，且又无法直接当做类方法来调用。此次更新提供了另一个途径来实现PSNumberPad的初始化。

在Swift中，用以下代码来初始化PSNumberPad.
```
var numberPad = PSNumberPad().numberPad()
```

### 预览 
![image](https://raw.githubusercontent.com/DeveloperPans/PSNumberPad/master/PSNumberPad.gif)

### 导入

#####`推荐` 通过Cocoapods导入
在你的Podfile文件中加入如下一行

```ruby
pod 'PSNumberPad'
```

#####手动导入
下载zip并解压。将PSNumberPad文件夹拖入你的Xcode工程中。


### 使用方法
**推荐使用懒加载初始化**
 
```objective-c 

@property (nonatomic, strong) PSNumberPad *numberPad;

- (PSNumberPad *)numberPad
{
    if (!_numberPad)
    {
        _numberPad = [[PSNumberPad alloc] init];
    }
    return _numberPad;
}

```
 
**给numberPad的textField赋值**

```objective-c

self.numberPad.textField = self.textField;

```


### 注意：
1. 只能使用`- (instancetype)init`方法初始化PSNumberPad.其他初始化方法是无效的。

更多信息请查看源码。