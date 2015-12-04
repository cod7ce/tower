# Tower Events

### Ruby

	2.2.0

### Testing

    rake

### Setup

	cp config/application.yml.example config/application.yml
	bundle install
	rake db:setup
	chmod 755 run.h
	chmod 755 kill.h
	./run.h

	# if you wanna stop all servers, just run
	./kill.h

### Details
After setup, we can visit all events we faked by this link -> [http://localhost:4000/team/1/events](http://localhost:4000/team/1/events)

On events page, there is a button named `fire a todo created event`. We will get a pushing notification from server after clicking it.
