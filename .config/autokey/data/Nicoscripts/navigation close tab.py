winTitle = window.get_active_title()

if 'Mozilla Firefox' in winTitle:
    keyboard.send_keys('<ctrl>+w')
if 'Brave' in winTitle:
    keyboard.send_keys('<ctrl>+w')
elif 'Vivaldi' in winTitle:
    keyboard.send_keys('<ctrl>+w')
else:
    keyboard.send_keys('<alt>+w')