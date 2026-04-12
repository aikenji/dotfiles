#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title window capture
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description 窗口区域截图同时保存文件和剪贴板
# @raycast.author aikenji
# @raycast.authorURL https://raycast.com/aikenji

set -euo pipefail

mkdir -p "$HOME/Downloads"

file="$HOME/Downloads/Window-Screenshot-$(date +%Y%m%d-%H%M%S).jpg"

# 交互式窗口选择并保存为 JPG
screencapture -i -W -t jpg "$file"

# 如果没有取消，就把同一张图复制到剪贴板
if [ -f "$file" ]; then
  osascript -e 'set the clipboard to (read (POSIX file "'"$file"'") as JPEG picture)'
  echo "$file"
fi
