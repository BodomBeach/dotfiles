import subprocess
command = 'wmctrl -l'
output = system.exec_command(command, getOutput=True)
if 'Mozilla Firefox' in output:
    window.activate('Firefox',switchDesktop=True)
    keyboard.send_keys("<ctrl>+t")
else:
    subprocess.Popen(["/usr/bin/firefox"])