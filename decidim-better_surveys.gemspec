# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/better_surveys/version"

Gem::Specification.new do |s|
  s.version = Decidim::BetterSurveys.version
  s.authors = ["Hadrien Froger"]
  s.email = ["hadrien@octree.ch"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/froger/decidim-module-better_surveys"
  s.required_ruby_version = ">= 3.0"

  s.name = "decidim-better_surveys"
  s.summary = "Improve decidim's surveys"
  s.description = "Distribute surveys in fullscreen, surveys submissions in as home page component"

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::BetterSurveys.decidim_version
  s.add_dependency "decidim-forms", Decidim::BetterSurveys.decidim_version
  s.add_dependency "decidim-surveys", Decidim::BetterSurveys.decidim_version
  s.add_dependency "deface", ">= 1.8.1"

  s.add_development_dependency "decidim-dev", Decidim::BetterSurveys.decidim_version
  s.metadata["rubygems_mfa_required"] = "true"
end
