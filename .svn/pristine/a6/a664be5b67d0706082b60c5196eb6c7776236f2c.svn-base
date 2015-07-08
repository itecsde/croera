require 'singleton'

class Broker
  include Singleton
  def initialize queue_size = 20
    @queue = SizedQueue.new queue_size
    @mutex = Mutex.new
  end

  def queue
    return @queue
  end

  def say this
    @mutex.synchronize do
      puts this
    end
  end
end