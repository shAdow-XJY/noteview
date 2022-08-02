# noteview
一个用来存放一些个人资料的仓库，用flutter写web端提供网页访问。

## website
[https://shadowplusing.website/noteview/](https://shadowplusing.website/noteview/)

## debug
1. flutter 打包情况：已有一个github.io域名为https://shadowplusing.website/
2. 这个仓库pages设置后是在https://shadowplusing.website/noteview/
3. 需要注意noteview工程打包后的index.html里面的base href = '/'需要修改为 '/noteview/'
4. 这样进入https://shadowplusing.website/noteview/才会正常获取该项目的index.html,不然按照'/'获取的是https://shadowplusing.website/下github.io的index.html
5. base href = '/'视自己的网页情况，比如pages部署在docs文件下，但我们部署访问的网页依旧是'https://shadowplusing.website/noteview/',base还是'/noteview/'

## pub cmd
flutter build web --web-renderer html --release

> cd /d path
## reference
1. [office web viewer](https://juejin.cn/post/7025400224721928223#comment)
2. [个人之前flutter web打包经验](https://github.com/shAdow-XJY/github_blog/blob/master/WriteDown.md)
3. [Allow different base href in index.html for flutter web app for build #69760](https://github.com/flutter/flutter/issues/69760)

## packages
1. [url_launcher](https://pub.dev/packages/url_launcher)
2. [responsive_builder: ^0.4.2](https://pub.dev/packages/responsive_builder)
