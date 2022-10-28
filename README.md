# zybo-z720-vscode-template
A test project and template to try to develop and debug software applications for Zybo Z7-20 using VS Code

This document explains one way to use VS Code for Zybo Z7 development instead of Vitis which kinda sucks.
You will still be able to use both Vitis and VS Code when needed/desired. Vitis might be necessary for times
you want to debug with more detail since currently I have not figured out how to provide more detailed debug
information like inspecting board memory.


Crude steps required to run application
-----------------------------------------
1.  Clone project
2.  (Optional) if using Z7-10 replace the hardware folder with a hardware folder that contains an xsa file generated for the Z7-10 board
3.  Go to root project directory. For this case it is zybo-z720-vscode-template folder
4.  Run the command: ./initSoftwareProject.sh test-app from the root folder include test-app as shown. test-app can be any app
    but for the template project it must be that since that app name is currently hard coded in other areas which I still need to change.
5.  Now open a new VS Code session and choose the software folder within this repo as the main folder. You should not see the hardware folder in the file explorer
    if you did it right.
6.  Within a terminal in VS Code run the command: vitis -workspace . (make sure to include the dot)
7.  Once vitis opens you might have to click on the 2 small windows icon in the top left area of vitis to open the file/project.
8.  Once the project is open launch a debug session for the hardware. (You have to have your board hooked up ready for debugging)
9.  When the debug session starts go to the Vitis Log terminal
10.  In the log search for a section that starts with --------------XSDB Script-------------- and ends with --------------End of Script----------------
11. Copy the contents between XSDB Script and End of Script. This is a tcl script that will program your board.
12. Create a .tcl file in the software folder the paste the contents you copied. For this case name the tcl file debug_init_zyboz720.tcl
13. Now set a breakpoint in the helloworld.c file
14. Debug by pressing F5
Hopefully you see the magic of VS Code stopping at the breakpoint you set.
