#!/bin/bash
west init -l app

set -euo pipefail

west update
west zephyr-export
pip3 install -r deps/zephyr/scripts/requirements.txt

west completion bash > $HOME/west-completion.bash
echo 'source $HOME/west-completion.bash' >> $HOME/.bashrc
echo 'source /repo/deps/zephyr/zephyr-env.sh' >> $HOME/.bashrc

python3 -m pip install --upgrade pip
pyocd pack install stm32h563zitx
