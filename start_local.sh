#!/bin/bash

# 本地开发环境启动脚本
# 使用前请确保已安装 Ruby 和 Bundler

echo "🚀 启动 Jekyll 本地服务器..."
echo ""

# 检查 Ruby
if ! command -v ruby &> /dev/null; then
    echo "❌ 错误: 未检测到 Ruby。请先安装 Ruby:"
    echo "   - macOS: brew install ruby"
    echo "   - Ubuntu: sudo apt-get install ruby-full"
    exit 1
fi

echo "✓ Ruby 版本: $(ruby --version)"

# 检查 Bundler
if ! command -v bundle &> /dev/null; then
    echo "📦 安装 Bundler..."
    gem install bundler --user-install
fi

echo "✓ Bundler 版本: $(bundle --version)"

# 安装依赖
echo ""
echo "📦 安装依赖..."
bundle config set --local path 'vendor/bundle'
bundle install

# 启动服务器
echo ""
echo "🌐 启动服务器..."
echo "   访问地址: http://localhost:4000"
echo "   按 Ctrl+C 停止服务器"
echo ""
bundle exec jekyll serve --livereload

# 提示
# --livereload: 文件更改时自动刷新浏览器
# --drafts: 包含草稿文章
# --future: 包含未来日期的文章