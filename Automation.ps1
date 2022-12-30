Class AutomationEvent {
    [string]$EventName = "none"
    [int]$TimeToWaitSecondsBeforeEvent = -1
    [int]$TimeToWaitSecondsAfterEvent = -1
    [bool]$DoMoveMouse = $false
    [bool]$DoMouseClick = $false
    [int]$MouseMoveX = -1
    [int]$MouseMoveY = -1
    [bool]$DoAddTextToClickPosition = $false
    [string]$TextToAddToClickPosition = "none"

}

class EventManager {
    [System.Collections.ArrayList]$events = @() 

    [AutomationEvent[]] GetEvents() { return $this.events }

    [void] AddEvent (
    [string]$EventName,
    [int]$TimeToWaitSecondsBeforeEvent,
    [int]$TimeToWaitSecondsAfterEvent,
    [bool]$DoMoveMouse,
    [bool]$DoMouseClick,
    [int]$MouseMoveX,
    [int]$MouseMoveY,
    [bool]$DoAddTextToClickPosition,
    [string]$TextToAddToClickPosition
    ) {
        $obj = New-Object AutomationEvent -Property @{ 
        "EventName" = $EventName;
        "TimeToWaitSecondsBeforeEvent" = $TimeToWaitSecondsBeforeEvent;
        "TimeToWaitSecondsAfterEvent" = $TimeToWaitSecondsAfterEvent;
        "DoMoveMouse" = $DoMoveMouse;
        "DoMouseClick" = $DoMouseClick;
        "MouseMoveX" = $MouseMoveX;
        "MouseMoveY" = $MouseMoveY;
        "DoAddTextToClickPosition" = $DoAddTextToClickPosition;
        "TextToAddToClickPosition" = $TextToAddToClickPosition;
        }
        $this.events.Add($obj)
    }

    [void] StartEvents() {
    for($i = 0; $i -lt $this.events.Count ; $i++) {

        Write-Host "Starting event #" $i " Name: " $this.events[$i].EventName

        if ($this.events[$i].TimeToWaitSecondsBeforeEvent -gt 0) {
            Write-Host "Waiting " $this.events[$i].TimeToWaitSecondsBeforeEvent " seconds after last event"
            Start-Sleep -Seconds $this.events[$i].TimeToWaitSecondsBeforeEvent
        }

        if ($this.events[$i].DoMoveMouse -eq $true) {
            Write-Host "Moving the mouse to coordinates X: " $this.events[$i].MouseMoveX " Y: " $this.events[$i].MouseMoveY
        }

        if ($this.events[$i].DoMouseClick -eq $true) {
            Write-Host "Doing mouse click at that position" 
        }

        if ($this.events[$i].DoAddTextToClickPosition -eq $true) {
            Write-Host "Adding this text at that position: "  $this.events[$i].TextToAddToClickPosition
        }

        if ($this.events[$i].TimeToWaitSecondsAfterEvent -gt 0) {
            Write-Host "Waiting " $this.events[$i].TimeToWaitSecondsAfterEvent " seconds before next event"
            Start-Sleep -Seconds $this.events[$i].TimeToWaitSecondsAfterEvent
        }

        Write-Host "`n"
    }

    }
}

clear

$em = [EventManager]::new()

$EventName = "This is the first"
$TimeToWaitSecondsBeforeEvent = 1
$TimeToWaitSecondsAfterEvent = 1
$DoMoveMouse = $true
$DoMouseClick = $true
$MouseMoveX = 50
$MouseMoveY = 100
$DoAddTextToClickPosition = $true
$TextToAddToClickPosition = "First text to add"

$em.AddEvent($EventName,$TimeToWaitSecondsBeforeEvent,$TimeToWaitSecondsAfterEvent,$DoMoveMouse,$DoMouseClick,$MouseMoveX,$MouseMoveY,$DoAddTextToClickPosition,$TextToAddToClickPosition)


$EventName = "This is the second"
$TimeToWaitSecondsBeforeEvent = 1
$TimeToWaitSecondsAfterEvent = 1
$DoMoveMouse = $true
$DoMouseClick = $true
$MouseMoveX = 50
$MouseMoveY = 100
$DoAddTextToClickPosition = $true
$TextToAddToClickPosition = "Next text to add"

$em.AddEvent($EventName,$TimeToWaitSecondsBeforeEvent,$TimeToWaitSecondsAfterEvent,$DoMoveMouse,$DoMouseClick,$MouseMoveX,$MouseMoveY,$DoAddTextToClickPosition,$TextToAddToClickPosition)

$em.StartEvents()

