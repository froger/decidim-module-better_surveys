# frozen_string_literal: true

require "rails"
require "decidim/core"
require "deface"
module Decidim
  module BetterSurveys
    ##
    # TrustedAccount Engine, mounted auto-magically by Decidim
    # through `./lib/trusted_account.rb`
    class Engine < ::Rails::Engine
      routes do
        # Add engine routes here
        get "surveys/:component_id", to: "decidim/better_surveys/survey#fullscreen", as: :process_component_fullscreen
      end
    end
  end
end
