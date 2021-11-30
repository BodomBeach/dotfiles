winTitle = window.get_active_title()

if 'Mozilla Firefox' in winTitle:
    keyboard.send_keys('<ctrl>+<tab>')
if 'Vivaldi' in winTitle:
    keyboard.send_keys('<ctrl>+<page_down>')
else:
    keyboard.send_keys('<alt>+e')