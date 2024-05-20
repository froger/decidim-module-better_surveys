# frozen_string_literal: true

module Decidim
  ##
  # Defines version for the module, and compatible decidim version
  module BetterSurveys
    def self.version
      "0.0.1"
    end

    def self.decidim_version
      ">= 0.27"
    end
  end
end
