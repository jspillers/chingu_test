require 'rubygems'
require 'vector2d'

ROOT_PATH = File.expand_path('../../', __FILE__)
$LOAD_PATH.unshift File.join(ROOT_PATH, 'lib')

require 'gosu'
require 'chingu'
require 'state_machine'

include Gosu

Image.autoload_dirs << File.join(ROOT_PATH, 'media')  

require 'autonomous_agents/traits/seek'
require 'autonomous_agents/game_objects/base_object'
require 'autonomous_agents/game_objects/mobile_object'
require 'autonomous_agents/game_objects/drone'
require 'autonomous_agents/game'

