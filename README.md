# Bert_2
in Ubuntu WSL setup following the next link
https://docs.microsoft.com/en-us/windows/wsl/install
authenticate following
**Create Personal Access Token on GitHub

## Initial Setup
clone Repo in WSL env:
cd ../project path location
git clone https://github.com/tanyaimt/Bert_2.git

## Activate virtual enviroment 
1) sudo apt install python3-virtualenv
2) virtualenv -p python3 direnv
3) source direnv/bin/activate;clear #validate the (direnv) user@hostnme:~/path/Bert$
To exit the virtual enviroment
4) deactivate 

## validate virtual env:
$ which pip 
should show:
$../Bert_2/direnv/bin/pip
$ pip list

## Install Libraries
python -m pip install bs4
python -m pip install pandas
!pip install bert-for-tf2
--> pip install sentencepiece
--> pip install tf-models-nightly # mejor instalar la versión en desarrollo
!pip install tf-nightly
pip install --upgrade tensorflow
pip install --upgrade tensorflow_hub
pip install pyparsing==2.4.2
pip3 install googletrans


**Create Personal Access Token on GitHub
https://stackoverflow.com/questions/68775869/support-for-password-authentication-was-removed-please-use-a-personal-access-to

From your GitHub account, go to Settings => Developer Settings => Personal Access Token => Generate New Token (Give your password) => Fillup the form => click Generate token => Copy the generated Token, it will be something like ghp_sFhFsSHhTzMDreGRLjmks4Tzuzgthdvfsrta

GIT API
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

git config --global user.name "tanyaimt"
git config --global user.email "tanyaimt@gmail.com"
git config -l

git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
> Cloning into `Spoon-Knife`...

Username for 'https://github.com' : type username

Password for 'https://github.com' : give your personal access token here

git config --global credential.helper cache

If needed, anytime you can delete the cache record by:
git config --global --unset credential.helper 
git config --system --unset credential.helper

##Database setup
>sudo apt install mysql-server
>sudo su
>mysql
>select * from INFORMATION_SCHEMA.USER_ATTRIBUTES
+------------------+-----------+-----------+
| USER             | HOST      | ATTRIBUTE |
+------------------+-----------+-----------+
| debian-sys-maint | localhost | NULL      |
| mysql.infoschema | localhost | NULL      |
| mysql.session    | localhost | NULL      |
| mysql.sys        | localhost | NULL      |
| root             | localhost | NULL      |
+------------------+-----------+-----------+
5 rows in set (0.00 sec)

>CREATE USER 'taroj'@'localhost' IDENTIFIED BY 'k***236'
>GRANT ALL PRIVILEGES ON * . * TO 'taroj'@'localhost';
>CREATE DATABASE jatisdb;
NOTE: posgresql allow multiple schemas in a db but mysql dont

pip install mysql-connector-python
pip install SpeechRecognition
sudo apt-get install python-pyaudio python3-pyaudio

##Audio Setup for wsl
git clone git://code.x2go.org/x2goclient-contrib.git
go to the repo folder \x2goclient-contrib
copy "pulse" folder to C:\ (so you should have e.g. C:\pulse\pulseaudio.exe)
sudo apt install libpulse0
edit bashrc in the user home path with:
sudo vi ~/.bashrc
add at the of the file the next lines: 
export HOST_IP="$(ip route |awk '/^default/{print $3}')"
export PULSE_SERVER="tcp:$HOST_IP"
export DISPLAY="$HOST_IP:0.0
by:
-esc
-ctrl+g
-esc
-ctrl +o
-rigth clic to copy what is in clipboard
-esc
-type ":wq!" to save.

in windows said download:
https://nssm.cc/release/nssm-2.24.zip

in windows powershell (opened as Admin)
run "C:\pulse\nssm.exe install PulseAudio"
in the GUI tab Application type:
    Application path: C:\pulse\pulseaudio.exe
    Startup directory: C:\pulse
    Arguments: -F C:\pulse\config.pa --exit-idle-time=-1
    Service name (should be automatically filled when the NSSM dialog opens): PulseAudio
in the GUI tab Details type:
 "PulseAudio" in the "Display name" field

 NOTE: In case you later want to remove this Windows service, run PowerShell as administrator again, and this time run the following command to remove the service: "C:\pulse\nssm.exe remove PulseAudio"

 In windows services inside taskManager right clic in PulseAdudio service and start it

 NOTE:Since we've installed PulseAudio as a service on Windows 10, once started, it will automatically start when you login to your Windows desktop, so there's no need to start it manually again.

 ##Enable graphic display tkinter in WSL
 https://aaroalhainen.medium.com/working-with-guis-in-wsl2-790ed1653279
 download:
 https://sourceforge.net/projects/vcxsrv/