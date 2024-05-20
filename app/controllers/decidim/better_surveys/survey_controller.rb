# frozen_string_literal: true

module Decidim
  module BetterSurveys
    class SurveyController < ApplicationController
      include ::Decidim::Settings
      include ::Decidim::Forms::Concerns::HasQuestionnaire
      include ::Decidim::NeedsPermission
      include ::Decidim::ParticipatorySpaceContext
      include Decidim::ComponentPathHelper

      helper Decidim::ResourceHelper
      helper ::Decidim::Surveys::SurveyHelper
      before_action :verify_manifest!
      delegate :allow_unregistered?, to: :current_settings

      def fullscreen
        @form = form(Decidim::Forms::QuestionnaireForm).from_model(questionnaire)
        render "decidim/forms/questionnaires/show", layout: "decidim/better_surveys/better_surveys"
      end

      def current_component
        @current_component ||= Decidim::Component.find(params.require(:component_id))
      end

      def current_participatory_space
        @current_participatory_space ||= current_component.participatory_space
      end

      def current_manifest
        current_component.manifest
      end

      def questionnaire_for
        survey
      end

      delegate :current_settings, to: :current_component

      def answer_survey_url(survey)
        ::Decidim::ResourceLocatorPresenter.new(survey).path + "/answer"
      end

      protected

      def allow_answers?
        !current_component.published? || (current_settings.allow_answers? && survey.open?)
      end

      def form_path
        main_component_path(current_component)
      end

      private

      def i18n_flashes_scope
        "decidim.surveys.surveys"
      end

      def survey
        @survey ||= ::Decidim::Surveys::Survey.find_by(component: current_component)
      end

      def verify_manifest!
        head :not_found unless current_component.manifest_name == "surveys"
      end
    end
  end
end
