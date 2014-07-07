# README

最近要给 Team 的朋友做一次 Rails 相关的分享，所以写了这个示例项目


# Rails 运行环境相关

## 安装 Homebrew

	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

在安装 Homebrew 的过程中，会提示你输入密码，这是正常的。

大家 千万千万 不要 sudo ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" 这样安装，出了问题不要来问我 ：）

## 安装 相关的 package

###  安装 Git

	brew install git
	brew update

Git 是 Rails 标配的版本控制工具，没有它后很东东都安装不好

###  安装 gcc

	brew tap homebrew/dupes
	brew install apple-gcc42

安装编辑器，不用去安装那么庞大的 Xcode 了。

###  安装 XQuartz

安装 ImageMagick 需要用 X11 的支持，所以需要自己下一个安装

[下载地址](http://xquartz.macosforge.org/landing)

###  安装 ImageMagick

	brew install imagemagick
	
这个东东对于后面的图片处理很有用	

### 安装 sqlite3

	brew install sqlite3

### 安装 postgresql

	brew install postgresql

## 安装 RVM

Ruby 是一门快速演进的语言，它有很多版本；同时它的 gems（库）的版本演进也非常快，所以需要一个工具管理不同的 Ruby 版和 Gem 版本。

RVM 是在 Mac 下使用的比较多的一个工具：

	curl -sSL https://get.rvm.io | bash -s stable
	
执行上面的命令会安装好RVM, 执行一下下面的命令，载入 rvm

	source ~/.rvm/scripts/rvm

再执行一下：

	rvm -v

看有没有类似下面的输出：

	rvm 1.22.17 (stable) by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]

## 安装 Ruby

执行下面的命令会自动把 uby 安装好：

	rvm install ruby-2.0.0-p451

把它设成 默认的 Ruby 版本：

	rvm use ruby-2.0.0-p451	--default
	
## 创建 Gemset
	
	rvm gemset create rails4.0.2

因这个项目使用的是 Rails4.0.2, 所以我们创建这么一个 Gemset, 来管理相关的依赖

## 把项目代码抓下来

	git clone https://github.com/liuhui998/oceanfood.git
	
一定要抓下来，后面要用到里面的东东

## 安装所需要的 gems

在命令里进入 oceanfood 的目录，执行下面的命令：

这是加载指定的 Ruby Gemset 环境

	source .rvmrc 
	
安装所有依赖的 gems （这一步可能会花比较多的时间）

	bundle -V

## 测试一下项目可否正常在本地运行

执行数据库的建表操作:

	bundle exec rake db:migrate

启动 Rails 应用服务器：

	bundle exec rails s

最后在浏览器里打开下面的网址：

	http://localhost:3000/
	
Good Luck!

## 安装 Heroku Toolbelt

可通过Homebrew安装：

	brew install heroku-toolbelt

或到下面的网址下载最新的 [Heroku Toolbelt](https://toolbelt.heroku.com/), 在部署时会用到

# 需要申请的帐号

## Amazon Free Tier

每个人都需要申一个 [amazon free 帐号](http://aws.amazon.com/cn/free/)（中间会提示绑信用卡，它会暂扣 $1, 不过后面会还给你）

这样大家可以在一年内免费使用 5G 空间的 s3 和 一台虚拟机（EC2）

## Github 帐号

每个人需要用个人邮箱申请一个 [github](https://github.com/join), 方便大家提交作业

大家记得一定不要把密码、密钥等信息存到 Git 里，有不少公司搞过这样的乌龙：

[10000名用户误上传AWS关键密码到GitHub公共区域](http://www.pchome.com/content-57951.html)

我听小小道消息说 JD 的同学就把内部密码传到过 GitHub. HOHO

有时间的同学可以多看一下 [Try Git](http://www.codeschool.com/courses/try-git)

## Heroku 帐号

[Heroku](https://www.heroku.com) 是一个 SAAS 平台，你只要执行 

	git push heroku master 

就可以快速的把应用部署到公网上

它的服务是收费的，但是它会给你一定数目的免费项目

每个人需要用个人邮箱申请一个 [heroku](https://id.heroku.com/signup)



# 部署配置相关

## 生成 S3 的信息

### 创建 bucket

直接看 Amazon 文档： [http://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html](http://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html)
	
### access_key & secret_key

还是看文档：[http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html](http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html)
	
## 使用 heroku 部署

使用 heroku 创建一个新的 APP, APPNAME 是可以选的，不写的话，系统会给你自动生成一个名字

	heroku create [APPNAME]
	
把代码推到 heroku 上，第一次推时要加 --set-upstream

	git push --set-upstream heroku master
	
在 heroku 上执行数据库  migrate （迁移）操作

	heroku run rake db:migrate

把：'AWS_ACCESS_KEY_ID' ,'AWS_SECRET_ACCESS_KEY'  替换成你从 AWS 拿到的值：

	heroku config:set S3_KEY='AWS_ACCESS_KEY_ID'
	
	heroku config:set S3_SECRET='AWS_SECRET_ACCESS_KEY'

好了，现在打你的 App 看一下：

	heroku open

# Remarks

1. Rails 运行环境相关部分我参考了很多 [Rails101] (http://rails-101.logdown.com/)，谢谢 [Xdite](http://blog.xdite.net/)
2. [RubyChina Wiki](https://ruby-china.org/wiki) 也为我提供了很多帮助





