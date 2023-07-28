-- Quick installation script for simple-graphics.
if fs.exists("simple-graphics.lua") then
    print("simple-graphics.lua already exists. Overwrite it? (y/n)")
    local response = io.read()
    if response == "y" or response == "Y" then
        fs.delete("simple-graphics.lua")
        print("Removed simple-graphics.lua.")
    else
        print("Quitting the installation.")
        return
    end
end

shell.execute("wget", "https://raw.githubusercontent.com/andrewlalis/cc-simple-graphics/main/simple-graphics.lua", "simple-graphics.lua")
print("Installed simple-graphics.lua.")
