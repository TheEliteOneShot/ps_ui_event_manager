# ps_ui_event_manager
A small powershell UI event manager to help with automatic mouse clicks and keyboard text for UI automation. This needs more work for actual actions via the Windows API to the UI. It could be complimented by an action manager to abstract the UI events with actual actions. For example, instead of "click x and y", call the action "Go To Open Main Open File Button".

Call program via command line with:
`  ./Automation.ps1 `

Expected Output:

```
Starting event # 0  Name:  This is the first
Waiting  1  seconds after last event
Moving the mouse to coordinates X:  50  Y:  100
Doing mouse click at that position
Adding this text at that position:  First text to add
Waiting  1  seconds before next event


Starting event # 1  Name:  This is the second
Waiting  1  seconds after last event
Moving the mouse to coordinates X:  250  Y:  1000
Doing mouse click at that position
Adding this text at that position:  Next text to add
Waiting  1  seconds before next event
```
