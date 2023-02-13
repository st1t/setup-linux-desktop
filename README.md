# setup-linux-desktop

## Install

```shell
$ git clone git@github.com:st1t/setup-linux-desktop.git
$ cd setup-linux-desktop/
$ vim inventory_hosts.yml
$ vim my_pc.yml
$ ansible-playbook -i inventory_hosts.yml my_pc.yml --list-tasks --list-hosts
$ ansible-playbook -i inventory_hosts.yml my_pc.yml -K
```

## Specified task

```shell
$ ansible-playbook -i inventory_hosts.yml my_pc.yml --list-tasks --list-hosts --tags "pyenv"
$ ansible-playbook -i inventory_hosts.yml my_pc.yml --tags "pyenv"
```

## Debug

```shell
# print
$ ansible all -i inventory_hosts.yml -m debug -a 'var=hostvars[inventory_hostname]'
# print gather facts
$ ansible all -i inventory_hosts.yml -m setup
```

## Memo

- Disable beep
    - Terminal > 設定 > プロファイル > 文字 > 端末ベルを鳴らす
- ThinkpadにHDMIケーブルを挿しっぱなしだと起動しない問題(https://nonsensej.xyz/articles/2020/06/01/ubuntu-20-04-hdmi)
    ```
    sudo gedit /etc/default/grub
    sudo update-grub
    ```
- key repeat delay調整(https://askubuntu.com/questions/846030/how-to-set-keyboard-repeat-delay-and-speed-in-ubuntu-gnome-16-10)
