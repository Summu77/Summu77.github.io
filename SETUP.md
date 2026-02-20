# 本地开发环境配置指南

## 快速开始

### 方法一：使用启动脚本（推荐）

```bash
chmod +x start_local.sh
./start_local.sh
```

### 方法二：手动配置

#### 1. 安装 Ruby

**macOS:**
```bash
# 使用 Homebrew 安装
brew install ruby

# 添加到 PATH
echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install ruby-full build-essential zlib1g-dev
```

**Windows:**
- 下载安装包: https://rubyinstaller.org/
- 安装时勾选 "Add Ruby to PATH"

#### 2. 配置 Gem 环境（避免使用 sudo）

```bash
# 配置 gem 使用用户目录
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

#### 3. 安装 Bundler

```bash
gem install bundler
```

#### 4. 安装项目依赖

```bash
# 进入项目目录
cd /path/to/summu77.github.io

# 配置 bundle 使用本地路径
bundle config set --local path 'vendor/bundle'

# 安装依赖
bundle install
```

#### 5. 启动本地服务器

```bash
bundle exec jekyll serve

# 或使用实时重载（推荐开发时使用）
bundle exec jekyll serve --livereload
```

服务器启动后访问: http://localhost:4000

## 常用命令

```bash
# 启动服务器（基础）
bundle exec jekyll serve

# 启动服务器（实时重载，文件更改自动刷新）
bundle exec jekyll serve --livereload

# 包含草稿文章
bundle exec jekyll serve --drafts

# 生成站点（不启动服务器）
bundle exec jekyll build

# 清理缓存
bundle exec jekyll clean

# 更新依赖
bundle update
```

## 故障排除

### 问题：bundle install 超时或失败

**解决方案：**
```bash
# 更换 RubyGems 镜像源
gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/

# 或配置 bundle 使用镜像
bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems
```

### 问题：Permission denied (权限错误)

**解决方案：**
确保已正确配置 GEM_HOME 环境变量，使用用户目录安装 gems，不要使用 sudo。

### 问题：端口被占用

**解决方案：**
```bash
# 使用其他端口
bundle exec jekyll serve --port 4001
```

### 问题：依赖版本冲突

**解决方案：**
```bash
# 删除 vendor 目录重新安装
rm -rf vendor
bundle install
```

## 项目结构

```
.
├── _config.yml          # 站点配置
├── _pages/
│   └── about.md         # 主页内容
├── _includes/           # 包含文件
├── _layouts/            # 布局模板
├── _sass/               # SCSS 样式
├── assets/              # 静态资源
├── images/              # 图片
├── start_local.sh       # 启动脚本
└── README.md            # 本文件
```

## 在线预览

GitHub Pages 自动部署地址：
https://summu77.github.io/

## 修改后更新到 GitHub

```bash
# 添加所有更改
git add .

# 提交
git commit -m "你的修改说明"

# 推送到 GitHub
git push origin main
```

推送后约 1-2 分钟，网站会自动更新。