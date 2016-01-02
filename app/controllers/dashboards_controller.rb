class DashboardsController < ApplicationController
  before_filter :authorize
  before_filter :all_teams, :all_divers
end
