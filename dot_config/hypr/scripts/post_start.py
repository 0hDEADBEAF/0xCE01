import os
import time

cmd = '''hyprctl --batch "\
keyword windowrule workspace unset,librewolf ; \
keyword windowrule workspace unset,youtube-music ; \
'''

time.sleep(5)
os.system(cmd)
