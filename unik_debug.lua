print("Debug module loaded") -- debug


function saveDebugLog()
    local logfile = io.open('debug.log', 'w')
    io.output(logfile)
    print('Debug log saved.')
    io.close(logfile)
end

return {
    saveDebugLog = saveDebugLog
}
