# frozen_string_literal: true

# Import necessary files,
# Mount the engine globally in the decidim Engines ecosystem.
require "decidim/better_surveys/engine"
require "decidim/better_surveys/surveys"

Decidim.register_global_engine(
  :decidim_better_surveys, # this is the name of the global method to access engine routes
  ::Decidim::BetterSurveys::Engine,
  at: "/_"
)
