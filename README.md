# Clear-Port

I have encountered this problem on linux os. Sometimes happens that some process catch port and hold it even after user close the app. That is happening usually if some error occur after port is binded. In that case netstat shows that process is still active.

This script is written in R, means that you need R interpreter in order to work. Run it from shell with command `./cp.r <port number you want to liberate from half dead process>`