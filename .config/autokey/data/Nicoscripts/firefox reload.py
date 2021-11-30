winTitle = window.get_active_title()

if 'Mozilla Firefox' in winTitle:
    keyboard.send_keys('<f5>')
else:
    keyboard.send_keys('<alt>+r')