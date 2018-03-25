# TapticEngineDemo
物理触觉(Haptic)

### 参考：
https://www.jianshu.com/p/d4567dbd7dde


### 代码调用
```
switch (type) {
    case 0:
    {
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [generator prepare];
        [generator impactOccurred];
    }
    break;
    case 1:
    {
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [generator prepare];
        [generator impactOccurred];
    }
    break;
    case 2:
    {
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
        [generator prepare];
        [generator impactOccurred];
    }
    break;
    default:
    break;
}
```

### 截图
![](https://github.com/bjheweihua/TapticEngineDemo/blob/master/ReadMe/imgs/demo.png)  
