require 'bundler'
Bundler.require


morning = LIFX::Color.hsb(29, 1.0, 0.65)
mid_morning = LIFX::Color.hsb(60, 0.2, 0.80)
midday = LIFX::Color.hsb(250, 0.15, 1)
mid_afternoon = LIFX::Color.hsb(60, 0.45, 0.75)
dinner = LIFX::Color.hsb(40, 0.55, 0.55)
night = LIFX::Color.hsb(30, 0.95, 0.30)


label = ARGV.first

lifx = LIFX::Client.lan
lifx.discover!

light = lifx.lights.first
if label
  light = lifx.lights.with_label(label)
end

now = Time.now
puts 'Time : ' + now.inspect

if now.hour == 6
  light.turn_on()
  light.set_color(morning)
elsif now.hour == 9
  light.set_color(mid_morning)
elsif now.hour == 12
  light.set_color(midday)
elsif now.hour == 15
  light.set_color(mid_afternoon)
elsif now.hour == 18
  light.set_color(dinner)
elsif now.hour >= 21
  light.set_color(night)
end



lifx.flush
