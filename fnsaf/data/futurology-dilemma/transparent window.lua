ffi = require "ffi"

ffi.cdef [[
    typedef int BOOL;
    typedef unsigned char BYTE;
    typedef long LONG;
    typedef unsigned long DWORD;
    typedef DWORD COLORREF;
    typedef void* HANDLE;
    typedef HANDLE HWND;

    HWND GetActiveWindow(void);
    LONG GetWindowLongA(HWND hWnd, int nIndex);
    LONG SetWindowLongA(HWND hWnd, int nIndex, LONG dwNewLong);
    BOOL SetLayeredWindowAttributes(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
    DWORD GetLastError();
]]

-- Constants
local GWL_EXSTYLE = -20
local GWL_STYLE = -16
local WS_EX_LAYERED = 0x00080000
local LWA_COLORKEY = 0x00000001
local WS_POPUP = 0x80000000
local WS_VISIBLE = 0x10000000

local scaleAmount = 0.8

local transparencyStarted = false

local originalStyle = nil
local originalExStyle = nil

function onCreate()
    -- Save original window styles once (window must be active)
    local win = ffi.C.GetActiveWindow()
    if win ~= nil then
        originalStyle = ffi.C.GetWindowLongA(win, GWL_STYLE)
        originalExStyle = ffi.C.GetWindowLongA(win, GWL_EXSTYLE)
    end
end

function startTransparency()
    local win = ffi.C.GetActiveWindow()
    if win == nil then
        debugPrint('Error: could not get game window')
        debugPrint('GetLastError: ' .. tostring(ffi.C.GetLastError()))
        return
    end

    -- Set transparent and borderless
    local newStyle = bit.bor(WS_POPUP, WS_VISIBLE)
    if ffi.C.SetWindowLongA(win, GWL_STYLE, newStyle) == 0 then
        debugPrint('Error: failed to set borderless style')
        debugPrint('GetLastError: ' .. tostring(ffi.C.GetLastError()))
    end
    if ffi.C.SetWindowLongA(win, GWL_EXSTYLE, WS_EX_LAYERED) == 0 then
        debugPrint('Error: failed to set layered window')
        debugPrint('GetLastError: ' .. tostring(ffi.C.GetLastError()))
    end
    if ffi.C.SetLayeredWindowAttributes(win, 0x00303030, 0, LWA_COLORKEY) == 0 then
        debugPrint('Error: failed to set transparency')
        debugPrint('GetLastError: ' .. tostring(ffi.C.GetLastError()))
    end

    -- Create big background sprite
    makeLuaSprite('bg', '', -1000, -1000)
    makeGraphic('bg', 5000, 5000, '303030')
    setScrollFactor('bg', 0, 0)
    setObjectCamera('bg', 'camGame')
    addLuaSprite('bg', false)
    setObjectOrder('bg', 1)  -- second layer

    -- Scale notes (no hovering)
    for i = 0, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'scale.x', scaleAmount)
        setPropertyFromGroup('strumLineNotes', i, 'scale.y', scaleAmount)
        updateHitbox('strumLineNotes', i)
    end

    transparencyStarted = true
end

function restoreWindowBorders()
    local win = ffi.C.GetActiveWindow()
    if win == nil then return end

    if originalStyle ~= nil then
        ffi.C.SetWindowLongA(win, GWL_STYLE, originalStyle)
    end
    if originalExStyle ~= nil then
        ffi.C.SetWindowLongA(win, GWL_EXSTYLE, originalExStyle)
    end
end

function onUpdate(elapsed)
    if curStep == 7652 and not transparencyStarted then
        startTransparency()
    end
    -- No hovering effect here anymore
end

function onEndSong()
    if transparencyStarted then
        restoreWindowBorders()
    end
    return false
end

function onDestroy()
    if transparencyStarted then
        restoreWindowBorders()
    end
end
