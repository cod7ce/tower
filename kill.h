kill -9 $(cat tmp/pids/server.pid)
echo "Rails server has been killed."

kill -9 $(cat tmp/pids/faye.pid)
echo "Faye server has been killed."
