\# Nova Game Engine



A lightweight, fast game engine written in C++ with Lua scripting support.



\## Features

\- ⚡ Ultra-lightweight (under 5MB)

\- 🎮 2D + 3D rendering via OpenGL

\- 🖱️ Full input: Keyboard, Mouse, Gamepad (up to 4), Touch

\- 🔊 Audio: WAV, MP3, OGG

\- 📦 Export games as single `.nova` file

\- 💻 Nova Core OS coming soon



\## Quick Start



\### Write your game in Lua:



&#x09;```lua

&#x09;-- main.lua

&#x09;x, y = 400, 300



&#x09;function update(dt)

&#x20;   	if nova\_key\_down("right") then x = x + 200 \* dt end

&#x20;   	if nova\_key\_down("left") then x = x - 200 \* dt end

&#x09;end



&#x09;function draw()

&#x20;   	  nova\_2d\_clear(10, 10, 40)

&#x20;  	 nova\_2d\_rect(x, y, 50, 50, 255, 100, 50)

&#x09;end



\*Package with Nova Packer:

\*Run packer\_ui.exe, select game folder, click PACK.



\*Run with Nova Runner:

&#x09;Run nova\_runner.exe and open .nova file.



\*Documentation

&#x09;Full API docs: Nova API Reference



\*Building from Source:



&#x09;g++ src/nova\_runner.cpp -o nova\_runner.exe -IC:/mingw64/include -LC:/mingw64/lib -lmingw32 -lSDL2main -	lSDL2 -lSDL2\_ttf -lSDL2\_image -lSDL2\_mixer -llua54 -lcomdlg32 -lopengl32 -lglu32 -mwindows



\*Requirements

&#x09;MinGW-w64 (GCC)



&#x09;SDL2, SDL2\_ttf, SDL2\_image, SDL2\_mixer



&#x09;Lua 5.4



&#x09;OpenGL



\*License

&#x09;MIT License - Free for any use.

