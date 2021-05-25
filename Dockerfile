FROM mcr.microsoft.com/windows/nanoserver:1903
COPY nginx.zip .


RUN tar -xf nginx.zip


# This actually doesn't make difference (i think) - And nanoserver cant run it


#SHELL ["powershell", "-command"]
# Make sure that Docker always uses default DNS servers which hosted by Dockerd.exe
# RUN Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord; \
#	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ScreenDefaultServers -Value 0 -Type DWord; \
#	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ScreenUnreachableServers -Value 0 -Type DWord
	
 #Shorten DNS cache times
#RUN Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name MaxCacheTtl -Value 30 -Type DWord; \
#	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name MaxNegativeCacheTtl -Value 30 -Type DWord


WORKDIR /nginx
EXPOSE 80
CMD ["nginx","-g","daemon off;"]