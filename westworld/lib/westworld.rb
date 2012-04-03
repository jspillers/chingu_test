require 'rubygems'

ROOT_PATH = File.expand_path('../../', __FILE__)
$LOAD_PATH.unshift File.join(ROOT_PATH, 'lib')

require 'gosu'
require 'chingu'
require 'state_machine'

include Gosu

Image.autoload_dirs << File.join(ROOT_PATH, 'media')  

require 'westworld/traits/vocal'
require 'westworld/game_objects/base_object'
require 'westworld/game_objects/miner'
require 'westworld/game_objects/wife'
require 'westworld/game'

