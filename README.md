# Clear-Port

I have encountered this problem on linux os. Sometimes happens that some process catch port and hold it even after user close the app. That is happening usually if some error occur after port is binded. In that case netstat shows that process is still active.

## cp.r
+ Script is written in R, means that you need R interpreter in order to work.
+ uses netstat for process id detection of process that blocks the port. You need this utility too in order this script to work.
+ Run it from shell with command `./cp.r <port number you want to liberate from half dead process>`

## cp.py
+ Script is written in Python, means that you need Python interpreter in order to work.
+ uses fuser. You need this utility too in order this script to work.
+ Run it from shell with command `./cp.py <port number you want to liberate from half dead process>`
