# grokit

Cookbook for Grokit application.

Notes:
- In OpsWorks console:
  - After making change to recipe: 
    - Open Git Bash in C:\Users\pat\chef-repo\cookbooks\grokit_cookbook
    - berks package grokit.tar.gz
    - Upload to S3.
    - Update custom cookbooks.
    - Then Execute Recipe: grokit::grokit_install, grokit::docker_install, grokit::docker_deploy

Docker Basics:
http://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html
docker ps
docker exec -i -t stupefied_lalande bash

Docker-Nagios notes:
- I had to allow Inbound traffic to port 80 for the "AWS OpsWorks Default server" security group, even though it says "do not change or delete".

sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
bash
docker info
sudo yum install -y git
git clone https://github.com/cpuguy83/docker-nagios
cd docker-nagios/
docker build -t my-dockerhub-username/docker-nagios .
docker images
docker run -d -p 80:80 my-dockerhub-username/docker-nagios

Docker Sensu notes:
- I had to allow Inbound traffic to port 3000 for the "AWS OpsWorks Default server" security group, even though it says "do not change or delete".

docker pull hiroakis/docker-sensu-server
docker run -d -p 10022:22 -p 3000:3000 -p 4567:4567 -p 5671:5671 -p 15672:15672 hiroakis/docker-sensu-server
docker ps
sudo docker exec -i -t 97c45cb4725b bash

Sensu notes:
sudo wget -O /etc/sensu/conf.d/client.json http://sensuapp.org/docs/0.21/files/client.json
yum install rubygems
yum -y install gcc mysql-devel ruby-devel rubygems
gem install sensu-plugins-disk-checks

yum install which
yum install tar
yum install ruby
yum install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
source /usr/local/rvm/scripts/rvm
ruby -v
gem install sensu-plugins-disk-checks
check-disk-usage.rb -w 80 -c 90
sensu-install -p process-checks:0.0.6

git clone https://github.com/sensu-plugins/sensu-plugins-process-checks.git
   60  ls
   61  cd sensu-plugins-process-checks/
   62  ls
   63  vi Gemfile
   64  ls
   65  gem install sensu-plugins-process-checks
   66  gem install sensu-plugin --no-rdoc --no-ri
   67  cd /etc/sensu/conf.d
   68  ls
   69  vi check_cron.json
   70  /etc/sensu/plugins/check-procs.rb -p crond -C 1
   71  pwd
   72  ls
   73  ls /root/sensu-plugins-process-checks/bin/
   74  ls
   75  vi ls/check-process.rb
   76  pwd
   77  vi /root/sensu-plugins-process-checks/bin/check-process.rb
   78  vi /etc/sensu/conf.d/check_cron.json
   79  /root/sensu-plugins-process-checks/bin/check-process.rb -p crond -C 1
   80  ps -ef | grep cron
   81  vi /etc/sensu/conf.d/check_cron.json
   82  vim
   83  vi /etc/sensu/conf.d/client.json
   84  service sensu restart
   85  ps -ef | grep sens
   86  service sensu-server stop
   87  service sensu-api stop
   88  service sensu-server start
   89  service sensu-api start
   90  ls /var/log/sensu
   91  tail -f /var/log/sensu/sensu-server.log
   92  vim /var/log/sensu/sensu-server.log


sudo wget -O /etc/sensu/config.json http://sensuapp.org/docs/0.21/files/config.json

Problem: Sensu server doesn't seem to run the check, even though it knows it shoud from the log.
