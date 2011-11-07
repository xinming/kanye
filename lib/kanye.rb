require 'httparty'
require 'nokogiri'
require 'mp3info'
require 'sqlite3'
require 'uri'

require 'kanye/page'
require 'kanye/track'
require 'kanye/history'

module Kanye
  DEFAULT_CONFIGURATION_PATH = File.expand_path("~/.kanye_rc")
  DEFAULT_DOWNLOAD_PATH = File.expand_path("~/Music/Kanye/")
  DEFAULT_DB_PATH = File.expand_path("~/Music/Kanye/.history.db")
  BASE_URL = 'h' + 'y' + 'p' + 'e' + 'm' + '.com'

  class << self
    def download_path
      @@download_path ||= DEFAULT_DOWNLOAD_PATH
    end

    def db_path
      @@db_path ||= DEFAULT_DB_PATH
    end
  end
end
