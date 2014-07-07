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

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
