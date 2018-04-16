def one_thousand_lights(lights)
  initiator = 1
  switches = {}

  lights.times { |switch_pos| switches[switch_pos + 1] = 'off' }

  lights.times do
    if initiator == 1
      switches.each_pair do |pos, status|
        switches[pos] = toggle_switch(switches[pos])
      end
    else
      switches.each_pair do |pos, status|
        switches[pos] = toggle_switch(switches[pos]) if pos % initiator == 0
      end
    end

    initiator += 1
  end

  switches.select { |_, value| value == 'on' }.keys
end

def toggle_switch(status)
  status == 'on' ? 'off' : 'on'
end
