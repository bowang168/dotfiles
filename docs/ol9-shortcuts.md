# OL9 Keyboard Shortcuts

My keyboard shortcuts for Oracle Linux 9:

![Photo 0](keyboard_shortcuts_ol9/0.png)
![Photo 1](keyboard_shortcuts_ol9/1.png)
![Photo 2](keyboard_shortcuts_ol9/2.png)
![Photo 3](keyboard_shortcuts_ol9/3.png)
![Photo 4](keyboard_shortcuts_ol9/4.png)
![Photo 5](keyboard_shortcuts_ol9/5.png)
![Photo 6](keyboard_shortcuts_ol9/6.png)
![Photo 7](keyboard_shortcuts_ol9/7.png)

## keyd config

```bash
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo mkdir -p /etc/keyd
sudo systemctl enable keyd
sudo systemctl start keyd

sudo .keyd/bin/keyd -m
sudo vim /etc/keyd/default.conf
  [ids]

  *

  [main]

  # Maps capslock to escape when pressed and control when held.
  #capslock = overload(control, esc)
  capslock = overload(meta, esc)
  #capslock = overload(hyper, esc)
  #space    = overload(leftmeta, space)

  # Remaps the escape key to capslock
  #esc = capslock


sudo ./keyd/bin/keyd reload
```
