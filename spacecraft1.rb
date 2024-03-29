class GalacticSpaceCraft
  DIRECTIONS = %w[N S E W Up Down].freeze
  ROTATIONS = %w[l r u d].freeze

  def initialize(x, y, z, direction)
    @position = { x: x, y: y, z: z }
    @direction = direction
  end

  def move(command)
    case command
    when 'f' then move_forward
    when 'b' then move_backward
    end
  end

  def rotate(command)
    case command
    when 'l' then rotate_left
    when 'r' then rotate_right
    when 'u' then rotate_up
    when 'd' then rotate_down
    end
  end

  def execute_commands(commands)
    commands.each do |command|
      if ROTATIONS.include?(command)
        rotate(command)
      else
        move(command)
      end
    end
  end

  def current_position
    @position
  end

  def current_direction
    @direction
  end

  private

  def move_forward
    case @direction
    when 'N' then @position[:y] += 1
    when 'S' then @position[:y] -= 1
    when 'E' then @position[:x] += 1
    when 'W' then @position[:x] -= 1
    when 'Up' then @position[:z] += 1
    when 'Down' then @position[:z] -= 1
    end
  end

  def move_backward
    case @direction
    when 'N' then @position[:y] -= 1
    when 'S' then @position[:y] += 1
    when 'E' then @position[:x] -= 1
    when 'W' then @position[:x] += 1
    when 'Up' then @position[:z] -= 1
    when 'Down' then @position[:z] += 1
    end
  end

  def rotate_left
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % DIRECTIONS.length]
  end

  def rotate_right
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % DIRECTIONS.length]
  end

  def rotate_up
    @direction = 'Up' if @direction != 'Down'
  end

  def rotate_down
    @direction = 'Down' if @direction != 'Up'
  end
end

# Example Usage:
initial_position = { x: 0, y: 0, z: 0 }
initial_direction = 'N'
commands = %w[f r u b l]

craft = GalacticSpaceCraft.new(initial_position[:x], initial_position[:y], initial_position[:z], initial_direction)
craft.execute_commands(commands)

puts "Final Position: #{craft.current_position}"
puts "Final Direction: #{craft.current_direction}"
