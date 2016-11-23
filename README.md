- 项目涉及知识点：
	- 自定义UITabbar
	- 代理事件(点击代理方法做出响应)
	- 设置UINavigationController背景图的两种方法
	- +(void)load 方法当程序一启动是就会调用
	- +（void）initialize 方法当前类或者它的子类第一次使用的时候才会调用

```
//当程序一启动就会调用该方法
+(void)load
{
    
}
//当前类或者他的子类第一次使用的时候才会调用
+(void)initialize
{
    // 获取哪个类下面的导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
}

//把控制器包装成导航控制器
XCNavigationController *nav = [[XCNavigationController alloc]initWithRootViewController:vc];
//    //设置导航空调背景图片，一定要在导航条显示之前设置
//    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//    [self addChildViewController:nav];
```

// @property如果在分类里面只会生成get,set方法的声明，并不会生成成员属性

- imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal 显示默认图片不渲染

- 用代码和storyboard结合加载一个页面并且实现跳转

- 自定义button的样式 改成图片的x在0，title的位置在图片x的后面，详情见xctitleView

- UIButton的图片拉伸只能用纯代码写，只有UIImAageView可以在storyBoard中实现

- 当我们接手一个项目时候，最好把要写的项目功能类似的写在一个自定义得出类里，这样以便于以后产品经理提出产品修改，可以节省大量的重复工作。比如写一个存储类，我们可以直接用系统的NSUserDefaults，但是如果产品经理说咱们用数据区sqlite吧..那你这东西不是白写了，最好是定义一个类，比如我们可以把数据存储都放在这个类里，就算现在用NSUserDefaults，明天换SQLite，那也是继承我们自己写的类，比较方便。（详情请款Tools工具类）

- 自定义两种方式导航控制的left按钮 1.第一种自定义uibarbuttonitem但是此方法会让导航控制侧滑失效，需要把导航控制器的手势代理设置为nil。2.第二种设置bar的颜色，然后把字的位置放在负数的位置

###tableview的封装
 - 1.首先对数据模型的封装
 	- 考虑到如果直接对tableview的section 和indepath.row操作会让代码看起来很乱而且后期不好维护，就创建了一个数据模型类，这个数据模型类里面放的是cell的每个样式。
 	- 创建一个存放数据模型的数组。把模型中的数据放到数组中。
 	
 - 2.对cell的封装
 	- 首先先封装一下cell循环利用
 	- +(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"cell";
    XCSettingItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell ==nil) {
        cell = [[XCSettingItemCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    return cell;
}

 - 3.数据模型中的小控件
  - 每个cell后面都有一个小控件，如果直接对cell加也不好，所以想到写2个继承数据模型的类，然后数据模型
一个是Arrow ，一个是switch。然后让不同的组使用不同arrow，或者switch。最后在cell里面在判断一下是arrow 还是switch 

 - 4.在数据模型中运用block
  - 给模型加一个block 然后，arrow和switch都继承了数据模型类，所以属性也继承过来了。直接用就可以，然后在didselectTableView方法里面 获取选中的那行调block就可以了
  
  
- -(void)loadView方法的作用是用来创建UIViewController的View。先调用loadView 然后调用viewdidload

- help页面的textlabel是加载的bundle的一个json文件，加载的数据放到了字典里，然后通过字典转模型去取出模型，这里有个注意点用kvc的话，有id关键字但是，oc中不允许使用id int等这种特殊的字符串，所以如果用kvc的话，需要重写kvc方法， - (void)setValue:(nullable id)value forKey:(NSString *)key;判断一下key的值 是否包含id，如果包含就[self setValue:value forKey:@"ID"];如果不包含就 调[super setValue:value forKey:key];方法

- oc和js做交互:
	- 需要用webView并且只能在加载网页的时候去做。
	- -(void)webViewDidFinishLoad:(UIWebView *)webView
	
- XCBasicViewController 类
	- 有个XCBasicViewController这个类有 tableview的样式，如果和XCBasicViewController页面差不多可以直接继承用，这也是为什么一些tableview没有设置数据源和一些其他方法，父类已经做而已。