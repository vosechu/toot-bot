class Listener
  def self.start
    t = Thread.new do
      loop do
        message = gets
        post message
      end
    end
  end
end