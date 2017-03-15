class PagesController < ApplicationController
    def home
        redirect_to feed_path if logged_in?
    end
end