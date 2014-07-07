# README

最近要给 Team 的朋友做一次 Rails 相关的分享，所以写了这个示例项目

Things you may want to cover:

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

	[下载地址](http://xquartz.macosforge.org/landing)

安装 ImageMagick 需要用 X11 的支持，所以需要自己下一个安装

###  安装 ImageMagick

	brew install imagemagick
	
这个东东对于后面的图片处理很有用	


## 安装 RVM

## 安装 Ruby

## 创建 Gemset

## 安装所需要的 gems

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
