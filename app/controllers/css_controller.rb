class CSSController < ApplicationController
  def index
    render_template 'assets/main.css', as: "text/css"
  end
end
