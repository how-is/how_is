# frozen_string_literal: true

require "how_is/version"
require "how_is/sources"
require "github_api"
require "okay/graphql"

module HowIs
  module Sources
    # Contains configuration information for GitHub-based sources.
    class Github
      class ConfigurationError < StandardError
        def initialize(env_variable)
          super("environment variable #{env_variable} not defined." +
                  " See README.md for details.")
        end
      end

      # A GitHub Personal Access Token.
      ACCESS_TOKEN = ENV["HOWIS_GITHUB_TOKEN"]
      raise ConfigurationError, "HOWIS_GITHUB_TOKEN" if ACCESS_TOKEN.nil?

      # "<github username>:<personal access token>"
      BASIC_AUTH = ENV["HOWIS_BASIC_AUTH"]
      raise ConfigurationError, "HOWIS_BASIC_AUTH" if BASIC_AUTH.nil?

      # Used for the the Authorization header when talking to the
      # GitHub API.
      # https://developer.github.com/v4/guides/forming-calls/#communicating-with-graphql
      AUTHORIZATION_HEADER = "bearer " + ACCESS_TOKEN
    end
  end
end
