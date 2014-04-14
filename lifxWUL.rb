client = LIFX::Client.lan                  # Talk to bulbs on the LAN
client.discover! do |c|                    # Discover lights. Blocks until a light with the label 'Office' is found
  c.lights.with_label('Office')
end
                                           # Blocks for a default of 10 seconds or until a light is found
client.lights.turn_on                      # Tell all lights to turn on
light = client.lights.with_label('Office') # Get light with label 'Office'

# Set the Office light to pale green over 5 seconds
green = LIFX::Color.green(saturation: 0.5)
light.set_color(green, duration: 5)        # Light#set_color is asynchronous

sleep 5                                    # Wait for light to finish changing
light.set_label('My Office')

light.add_tag('Offices')                   # Add tag to light

client.lights.with_tag('Offices').turn_off

client.flush                               # Wait until all the packets have been sent
