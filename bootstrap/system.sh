echo 'LC_ALL="en_US.UTF-8"'  >  /etc/default/locale
apt-get update  --quiet
apt-get install --yes locales
locale-gen en_US.UTF-8

echo "------------------------------ Install various linux tools"

apt-get install --yes  --quiet tmux multitail\
        make npm htop wget inotify-tools\
        build-essential zip unzip\
        git curl gcc g++ vim

echo 16384 | tee /proc/sys/fs/inotify/max_user_watches

echo "------------------------------ Installing Erlang Solutions repo"
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb

dpkg -i erlang-solutions_1.0_all.deb

apt-get update --quiet --yes
echo "------------------------------ Installing Erlang & Elixir"
apt-get install --yes --quiet erlang  erlang-base-hipe elixir

apt-get upgrade --yes  --quiet
apt-get autoclean --yes  --quiet
apt-get autoremove --yes  --quiet
