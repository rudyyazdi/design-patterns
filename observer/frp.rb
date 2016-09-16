class Stream
end

class Button
  def push
    emit(:pushed) # emit sends a value into the stream
  end
end

button = Button.new
stream = Stream.new(button)

counter = stream
          .map { |event| event == :pushed ? 1 : 0 } # convert events to ints
          .inject(0) { |sum, n| sum + n } # add them up

counter.now # => 0

button.push
button.push
button.push

counter.now # => 3

button.push

counter.now
