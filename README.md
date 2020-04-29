# 品络音乐程序系统 v1.0 完整版（ACCESS版）

本系统拥有完整的音乐网站功能，可以帮助您快速建立一个功能全面的本地音乐网站。源码开源免费，使用时请保留版权标识，可用于商业，无任何限制。

### 系统说明：

本系统开发于2008年3月，现在开源出来，希望能帮到有需要的人。

支持本程序，请到Gitee和GitHub给我们点Star！

Gitee：https://gitee.com/caozha/pinluo-Music-CMS

GitHub：https://github.com/cao-zha/pinluo-Music-CMS

### 安装方法

直接将源代码上传到您的网站根目录。

第一步，找到根目录下的#pinluo.mdb文件，修改为其他复杂的文件名。

第二步，打开PL_Conn.asp，找到这行代码：

PL_db="/#pinluo.mdb" '数据库文件位置

然后把/#pinluo.mdb修改为您刚才更改的数据库文件名即可，一定要修改，免得网站被黑。

第三步，登陆后台：你的网站地址/admin/login.asp ，管理员帐号：pinluo 密码：pinluo888

立即修改管理员帐号和密码，免得网站被非法登陆和攻击挂木马。

### 注意事项

1、网站服务器的IIS必须 **开启父路径** ，否则程序会执行错误，会提示“不允许的父路径”的错误。[点此查看开启方法](https://my.oschina.net/dengzhenhua/blog/3295146)

2、网站目录必须开启写入权限，否则会安装失败。

### 其他

本程序为v1.0完整版（ACCESS版），如需要使用MSSQL版，请到仓库的master分支下载。

### 版权所有

开发者：草札 www.caozha.com

域名空间：品络 www.pinluo.com

优惠券：穷店 www.qiongdian.com



### 界面预览
![输入图片说明](https://images.gitee.com/uploads/images/2020/0424/212214_ad44b7f9_7397417.png "首页.png")

![输入图片说明](https://images.gitee.com/uploads/images/2020/0424/212228_c222cb25_7397417.png "首页2.png")

![输入图片说明](https://images.gitee.com/uploads/images/2020/0424/212246_d60de705_7397417.png "专辑页.png")

![输入图片说明](https://images.gitee.com/uploads/images/2020/0424/212259_83ecf103_7397417.png "歌手列表页.png")

![输入图片说明](https://images.gitee.com/uploads/images/2020/0424/212307_4d55e154_7397417.png "播放页.png")

![输入图片说明](https://images.gitee.com/uploads/images/2020/0424/212318_23191d69_7397417.png "后台首页.png")

![输入图片说明](https://images.gitee.com/uploads/images/2020/0424/212332_2df4cfc3_7397417.png "专辑管理.png")

![输入图片说明](https://images.gitee.com/uploads/images/2020/0424/212342_13491494_7397417.png "歌曲管理.png")

![输入图片说明](https://images.gitee.com/uploads/images/2020/0424/212354_93973969_7397417.png "会员管理.png")

![输入图片说明](https://images.gitee.com/uploads/images/2020/0424/212408_bff7feb8_7397417.png "评论管理.png")

