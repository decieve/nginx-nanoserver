# nginx-nanoserver
This dockerfile uses native 64 bit version built manually and installs it to [microsoft/nanoserver](https://hub.docker.com/r/microsoft/nanoserver/) based container.
Official version of nginx cannot be used because it is 32 bit version of binary which is not supported on nano server.

I've added a nginx.zip built manually in the repo so you can test it

##Compile from source code
To achieve the native 64bit nginx i used this [guide](https://ywjheart.wordpress.com/2018/12/05/brief-steps-of-building-nginx-64bit-on-windows/) (bit suspicious but it's a good guide , cheers for this guy/gal) mixed with [this one](https://nginx.org/en/docs/howto_build_on_win32.html) from nginx official site.

###Things that drove me mad!:    >:(
- Prefer [Strawberry perl](https://strawberryperl.com/) over Active perl when building nginx with source code ( For some reason Active perl sucks managing packages and strawberry perl has every package you need to build nginx )
- Install Cygwin and add C:\cygwin64\bin it to PATH Environment Variable 
- Install MSYS ( or install [mingw all in one](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/installer/mingw-w64-install.exe) ) 
- And make sure to overwrite that bulky command starting with auto/configure to the extracted folders from zlib , openssl and pcre ( this did not drove me mad , but it's an advice anyways )
- When you finish building copy folders from [nginx binaries](https://nginx.org/en/download.html) to a folder and overwrite the .exe with your built .exe

## Build
```bash
docker build -t nginx-nanoserver .
