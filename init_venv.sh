#!/usr/bin/env bash

if [ ! -d ".venv" ]; then
    echo "创建新的虚拟环境..."
    python3 -m venv .venv

    # 激活虚拟环境
    source .venv/bin/activate
    
    trap 'deactivate' EXIT

    # 升级pip
    pip install --upgrade pip

    # 安装pymobiledevice3
    python3 -m pip install -U pymobiledevice3

    echo "虚拟环境已创建并已安装pymobiledevice3。"
else
    echo ".venv目录已存在。"

    # 激活虚拟环境
    source .venv/bin/activate

    trap 'deactivate' EXIT

    # 检查pymobiledevice3是否已安装
    if pip freeze | grep -q pymobiledevice3; then
        echo "pymobiledevice3已安装。"
    else
        echo "安装pymobiledevice3..."
        python3 -m pip install -U pymobiledevice3
    fi
fi

echo "设置完成。"




