module MyGarage
  class BaseCar
    attr_accessor :brand, :color, :current_speed, :max_speed
    attr_reader :name, :motion

    def initialize(hsh = {})
      @brand = hsh[:brand] || 'unknown'
      @color = hsh[:color] || 'unknown'
      @current_speed = hsh[:current_speed] || 0
      @max_speed = hsh[:max_speed] || 0
      @name = self.class.name.split('::').last
      @motion = :stop
      @mutex = Mutex.new
      @cv = ConditionVariable.new
      turn_on
    end

    def brake
      unless car_on?
        puts "The brake lights come on. The car isn't running. Try turn_on first"
        return
      end

      if current_speed == 0
        puts "The #{name} is already stopped. You should try drive."
        return
      end
      brake_thread = Thread.new{
        @mutex.synchronize {
          puts "The #{color} colored #{name} begins to slow..."
          decelerate
          @cv.signal
        }
      }
    end

    def drive
      unless car_on?
        puts "Nothing happens. The car isn't running. Try turn_on first."
        return
      end

      if current_speed != 0
        puts "The #{name} is already in motion. You should try brake."
        return
      end
      drive_thread = Thread.new{
        @mutex.synchronize {
          puts "The #{color} colored #{name} roars off down the road..."
          accelerate
          @cv.signal
        }
      }
    end

    def turn_off
      unless car_on?
        puts "The car if already off. Try turn_on first."
        return
      end

      if motion == :stop
        @main_thread.exit
        puts "The #{name}'s engine shuts down."
      else
        puts "Turning off the engine while the car is moving is not safe. Tell the car to brake first."
      end

    end

    def turn_on
      unless @main_thread.nil?
        if @main_thread.alive?
          puts "The car is already running."
          return
        end
      end
      @main_thread = Thread.new {
        @mutex.synchronize {
          puts "The #{name}'s engine jumps to life and begins to idle..."
          loop do
            @cv.wait(@mutex)
            motion == :stop ? idle : moving
          end
        }
      }
    end

    private

    def accelerate
      while current_speed < max_speed
        @current_speed += 1
        @motion = :moving
        print "Current Speed: #{current_speed} \r"
        $stdout.flush
        sleep(0.01)
      end
      puts "The #{name} has hit its max speed of #{max_speed} mph."
    end

    def decelerate
      while current_speed > 0
        @current_speed -= 1
        print "Current Speed: #{current_speed} \r"
        $stdout.flush
        sleep(0.01)
      end
      @motion = :stop
      puts "The #{name} has reached #{current_speed} mph and come to a complete stop."
    end

    def car_on?
      if @main_thread.nil?
        false
      else
        @main_thread.alive?
      end
    end

    def idle
      puts "The #{name}'s engine idles..."
    end

    def moving
      puts "The #{name} is whipping down the road. Objects being passed are a blur."
    end

  end
end