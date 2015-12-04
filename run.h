rails s -b 0.0.0.0 -p 4000 -d
echo "Rails server run as a Daemon"

rackup faye.ru -E production -s thin -p 3000 -o 0.0.0.0 -P tmp/pids/faye.pid -D
echo "Faye server run as a Daemon"


echo "To kill all servers, just run \"./kill.h\""
