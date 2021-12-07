winTitle = window.get_active_title()

if 'Mozilla Firefox' in winTitle:
    keyboard.send_keys('<ctrl>+<tab>')
elif 'Vivaldi' in winTitle:
    keyboard.send_keys('<ctrl>+<page_down>')
elif 'GEDERRA' in winTitle:
    keyboard.send_keys('<ctrl>+a')
    keyboard.send_keys('<ctrl>+l')
else:
    keyboard.send_keys('<alt>+e')