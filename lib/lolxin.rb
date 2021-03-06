# dependency
require 'faraday'
require 'json'

require 'lolxin/helpers/api'
require 'lolxin/helpers/api_version'
require 'lolxin/helpers/version'
require 'lolxin/helpers/region'

require 'lolxin/dto/dto'
require 'lolxin/dto/champion_dto'
require 'lolxin/dto/champion_mastery_dto'
require 'lolxin/dto/game_info_dto'
require 'lolxin/dto/league_item_dto'
require 'lolxin/dto/league_list_dto'
require 'lolxin/dto/league_position_dto'
require 'lolxin/dto/mini_series_dto'

require 'lolxin/api/champion_mastery'
require 'lolxin/api/champion'
require 'lolxin/api/league'
require 'lolxin/api/lol_static_data'
require 'lolxin/api/lol_status'
require 'lolxin/api/match'
require 'lolxin/api/spectator'
require 'lolxin/api/summoner'
require 'lolxin/api/third_party_code'
#require 'lolxin/api/tournament_stub'
#require 'lolxin/api/tournament'

require 'lolxin/client'

module Lolxin; end
