import os
import subprocess

def init_apps():
    processes = [
        ['picom'],
        ['nitrogen', '--restore'],
        ['nm-applet'],
        ['albert']
        # ['/usr/bin/setxkbmap', '-option', 'caps:swapescape'],
        # [
        #     'xautolock',
        #     '-time', '5',
        #     '-corners',
        #     '-000',
        #     '-cornersize',
        #     '30',
        #     '-locker',
        #     os.path.expanduser('~/.config/qtile/scripts/lock_screen.py')
        # ],
    ]

    for p in processes:
        subprocess.Popen(p)
