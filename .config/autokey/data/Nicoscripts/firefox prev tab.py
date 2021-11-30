winTitle = window.get_active_title()

if 'Mozilla Firefox' in winTitle:
    keyboard.send_keys('<ctrl>+<shift>+<tab>')
if 'Vivaldi' in winTitle:
    keyboard.send_keys('<ctrl>+<page_up>')
else:
    keyboard.send_keys('<alt>+q')