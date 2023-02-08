class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.first_or_create(email: params[:email],
                                password: params[:password])

    user.deleted = false unless user.nil?

    msg = 'Successfully Registered/Updated User.'
    status = 200

    begin
      user.save!
    rescue ActiveRecord::RecordInvalid
      msg = 'Please pass unique email and with password'
      status = 400
    end

    respond_to do |format|
      format.json { render json: {message: msg }, status: status }
    end
  end

  def unregister
    user = User.find(params[:id])
    user.deleted = params[:deleted]
    user.save!
  end
end
