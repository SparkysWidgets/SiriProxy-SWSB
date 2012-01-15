# Copyright (C) 2011 by Sparky's Widgets <sparkyswidgets@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


#######
# This is just the basic gem to interface serial ports, siri, and various hardware interfaces
# such as relay boards, temp sensors, fans, pumps and many other things!
#
#######

require 'cora'
require 'siri_objects'
require 'pp'
require 'serialport'
class SiriProxy::Plugin::SWSB < SiriProxy::Plugin  
  def initialize(config)    
    @comport = config["comport"]
    @baudrate = config["baudrate"]
    @databits = config["databits"]
    @stopbits = config["stopbits"]
    @parity = config["parity"]
  end  

listen_for /test smart box/i do
    say "Sparkys Smart Box is AOK!"
       request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

listen_for(/*.on light.*([0-9]+\s*|one|two|three|four|five|six|seven|eight|nine|ten)/i) { |number| turn_on_light(number) }
listen_for(/*.off light.*([0-9]+\s*|one|two|three|four|five|six|seven|eight|nine|ten)/i) { |number| turn_off_light(number) }
listen_for(/*.on all lights/i) { all_lights_on}
listen_for(/*.off all lights)/i) { all_lights_off}

  def turn_on_light(number)
     sp = SerialPort.new(@comport, @baudrate, @databits, @stopbits, @parity)
     $tmp = number
   case $tmp
    when "one"
	say "turning on lab light 1"
 	sp.write "C1H"
    when "two"
	say "turning on lab light 2"
	sp.write "C2H"
    when "two"
	say "turning on lab light 3"
	sp.write "C3H"
    else
	#do nothing
    end
   request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end 

  def turn_off_light(number)
     sp = SerialPort.new(@comport, @baudrate, @databits, @stopbits, @parity)
     $tmp = number
   case $tmp
   when "one"
	say "turning off lab light 1"
 	sp.write "C1L"
    when "two"
	say "turning off lab light 2"
	sp.write "C2L"
    when "two"
	say "turning off lab light 3"
	sp.write "C3L"
    else
	#do nothing
    else
   request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end 

  def all_lights_on
    sp = SerialPort.new(@comport, @baudrate, @databits, @stopbits, @parity)
    say "turning on all lab lights"
    sp.write "CAH"
   request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  def all_lights_on
    sp = SerialPort.new(@comport, @baudrate, @databits, @stopbits, @parity)
    say "turning off all lab lights"
    sp.write "CAL"
   request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
 
end
