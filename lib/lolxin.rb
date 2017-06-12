# dependency
require 'faraday'
require 'json'

require 'lolxin/helpers/version'
require 'lolxin/helpers/api_version'
require 'lolxin/helpers/region'

require 'lolxin/dto/dto'
require 'lolxin/dto/champion_dto'
require 'lolxin/dto/game_info_dto'

require 'lolxin/api/champions'
require 'lolxin/api/champion_mastery'
require 'lolxin/api/league'
require 'lolxin/api/static_data'
require 'lolxin/api/lol_status'
require 'lolxin/api/match'
require 'lolxin/api/stats'
require 'lolxin/api/summoner'
require 'lolxin/api/spectator'

require 'lolxin/client'

module Lolxin; end
