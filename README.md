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

 
```objective-c @property (nonatomic, strong) PSNumberPad *numberPad;

- (PSNumberPad *)numberPad
{
    if (!_numberPad)
    {
        _numberPad = [PSNumberPad pad];
    }
    return _numberPad;
}
```
 
**Tell PSNumberPad with is current inputing textField**

```objective-c

self.numberPad.textField = self.textField;

```

###Notice：
1. The only way to init PSNumberPad is `+ (PSNumberPad *)pad`. Other initialzer is useless.

For more，download and see the demo。

==============================中文分割线==========================

# PSNumberPad
一个仅能输入数字和小数点的键盘。常用于需要输入价格的场景。

苹果的键盘类型已经可以满足大多数开发需求了。但遇上O2O类App的开发 仍然有硬伤，那就是没有一个好用的，仅能输入数字和小数点的键盘。如果用其他键盘，会增加许多处理字符的工作量，最主要的是用户体验比较差。PSNumberPad弥补了这一空白。

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
 
```objective-c @property (nonatomic, strong) PSNumberPad *numberPad;

- (PSNumberPad *)numberPad
{
    if (!_numberPad)
    {
        _numberPad = [PSNumberPad pad];
    }
    return _numberPad;
}
```
 
**给numberPad的textField赋值**

```objective-c

self.numberPad.textField = self.textField;

```


### 注意：
1. 只能使用`+ (PSNumberPad *)pad`方法初始化PSNumberPad.其他初始化方法是无效的。

更多信息请查看源码。