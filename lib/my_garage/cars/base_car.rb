module MyGarage
  class BaseCar
    attr_accessor :color, :max_speed
    attr_reader :brand, :current_speed, :name, :motion

    def initialize(hsh = {})
      @brand = hsh[:brand] || 'unknown'
      @color = hsh[:color] || 'unknown'
      @current_speed = hsh[:current_speed] || 0
      @max_speed = hsh[:max_speed] || 0
      @name = self.class.name.split('::').last
      @motion = :stop
      @mutex = Mutex.new
      @cv = ConditionVariable.new
    end

    def brake
      unless car_on?
        puts "The brake lights come on. The car isn't running. You need to turn it on first."
        return
      end

      if motion == :stop
        puts "The #{name} is already stopped. You should try drive."
        return
      end
      brake_thread = Thread.new{
        @mutex.synchronize {
          puts "You apply the brake and the #{name} begins to slow..."
          decelerate
          @cv.signal
        }
      }
      brake_thread.join
    end

    def drive
      unless car_on?
        puts "Nothing happens. The car isn't running. You need to turn it on first."
        return
      end

      if current_speed != 0
        puts "The #{name} is already in motion. You should apply the brake."
        return
      end
      drive_thread = Thread.new{
        @mutex.synchronize {
          puts "A light push on the gas peddle causes the #{name} to roar off down the road..."
          accelerate
          @cv.signal
        }
      }
      drive_thread.join
    end

    def go_for_a_ride
      puts "You get behind the wheel of a #{color} colored #{brand} #{name} in the garage."
      turn_on
      sleep(2)
      drive
      sleep(2)
      puts 'Time to slow down before you get a ticket.'
      brake
      sleep(2)
      turn_off
    end

    def turn_off
      unless car_on?
        puts "The car if already off. Try turn_on first."
        return
      end

      if motion == :stop
        @main_thread.exit
        puts "You turn the key and shuf off the #{name}'s engine."
      else
        puts "Turning off the engine while the car is moving is not safe. You should apply the brake first."
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
          puts "When you turn the key, the #{name}'s engine jumps to life and begins to idle."
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
        sleep(0.05)
      end
      puts "The #{name} has hit its max speed of #{max_speed} mph."
    end

    def decelerate
      while current_speed > 0
        @current_speed -= 1
        print "Current Speed: #{current_speed} \r"
        $stdout.flush
        sleep(0.05)
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
      puts "Objects being passed are a blur as the #{name} whips down the road."
    end

  end
end