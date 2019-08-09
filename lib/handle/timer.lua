
timer = {}

local Timer = {}
Timer.__index = Timer
timer.metatable = Timer


local allTimers = {}

---@param callback fun(t:Timer):any
function timer.create(callback)
    local t = CreateTimer()
    local wrapper = setmetatable({}, Timer)

    allTimers[GetHandleId(t)] = wrapper
    wrapper.handle = t
    wrapper.callback = callback
    wrapper._isPaused = true
    wrapper._isPeriodic = false

    return wrapper
end

function Timer:destroy()
    local t = self.handle
    allTimers[GetHandleId(t)] = nil
    PauseTimer(t)
    DestroyTimer(t)
    self.handle = nil
end


local function onExpire() 
    local t = allTimers[GetHandleId(GetExpiredTimer())]
    local callback = t.callback
    if callback then
        local success,error = pcall(callback, t)
        if not success then print(error) end
    end
    if t._isPeriodic then
        if t._wasResumed then
            TimerStart(t.handle, t._timeOut, true, onExpire)
        end
    else
        t._timeOut = nil
        t._isPaused = true
    end
end

--- Starts a timer. You can optionally define a new callback for the timer.
---@param callback fun(t:Timer):any
function Timer:start(timeout, boolPeriodic, callback)
    TimerStart(self.handle, timeout, boolPeriodic, onExpire)
    self._isPaused = false
    self._isPeriodic = boolPeriodic
    self._wasResumed = nil
    self._timeOut = timeout
    if callback then
        self.callback = callback
    end
end

function Timer:getElapsed()
    return TimerGetElapsed(self.handle)
end

function Timer:getRemaining()
    return TimerGetRemaining(self.handle)
end

--- Returns nil if the timer has not been started, or after it has expired. 
--- In the callback funtion, this value is not nil, it is the original timeout.
function Timer:getTimeout()
    return self._timeOut
end

function Timer:isStarted()
    return self._timeOut ~= nil
end

function Timer:isPaused()
    return self._isPaused
end

function Timer:isPeriodic()
    return self._timeOut ~= nil and self._isPeriodic
end


function Timer:pause()
    PauseTimer(self.handle)
    self._isPaused = true
end

--- Resumes a timer. You can optionally define a new callback for the timer.
---@param callback fun(t:Timer):any
function Timer:resume(callback)
    if self._timeOut and self._isPaused then
        TimerStart(self.handle, self:getRemaining(), false, onExpire)
        self._wasResumed = true
        self._isPaused = false
        if callback then
            self.callback = callback
        end
    end
end