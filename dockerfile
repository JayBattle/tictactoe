FROM ubuntu

WORKDIR /home

COPY StartupScript.sh /home/

RUN apt-get update
RUN apt-get -y install dos2unix
RUN dos2unix /home/StartupScript.sh /home/StartupScript.sh
RUN chmod +x /home/StartupScript.sh
RUN apt-get -y install wget
RUN apt-get -y install vim
RUN apt-get -y install curl
RUN apt-get -y install dnsutils
RUN apt-get -y install net-tools
RUN apt-get -y install psmisc
RUN apt-get -y install less
RUN apt-get -y install git
RUN apt-get -y install npm 
RUN apt-get -y install rsync
RUN apt-get update
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN cat /home/StartupScript.sh
RUN mkdir repos
RUN cd repos && git clone https://github.com/JayBattle/tictactoe.git
RUN cd ..
RUN npm install -g n
RUN n latest
RUN npm install -g create-react-app@3.0.1
RUN create-react-app tictactoe
RUN rsync -a repos/tictactoe/ tictactoe/
ENTRYPOINT ["/home/StartupScript.sh"]
CMD [""]
