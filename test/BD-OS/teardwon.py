import os

def close_process(self, process_name):
   """Close a process by processname."""
   if process_name[-4:].lower() != ".exe":
       process_name += ".exe"
   os.system("taskkill /f /im " + process_name)

