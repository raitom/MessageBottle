class ApiController < ApplicationController
  include ActionView::Helpers::TextHelper

  respond_to :json, :js

  before_filter :initialisation

  def initialisation
    @reponse = Hash.new
  end

  #Formate la reponse en json et l'envoi
  def reponse msg
    @reponse["msg"] = msg
    respond_with(@reponse) do |format|
      format.js  { render :json => @reponse, :callback => params[:callback] }
    end
  end

  def newMess
    user = User.find_by_uid(params[:uid])
    unless user.nil?
      Message.create!(user_id: Random.new.rand(0..User.count), texte: truncate(params[:texte], length: 140, omission: ''))
      user.incrementNbrMess
      reponse "OK"
    else
      reponse "KO"
    end
  end
end


