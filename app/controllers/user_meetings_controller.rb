class UserMeetingsController < ApplicationController
  before_action :set_user_meeting, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def create
    @user_meeting = UserMeeting.new(user_meeting_params)

    if @user_meeting.save
      flash[:success] = t(:association_created_successfully)
      redirect_to root_path
    else
      flash[:error] = t(:error_creating_association)
    end
  end

  def destroy
    @user_meeting.destroy
    flash[:success] = t(:association_destroyed_successfully)
    redirect_to root_path
  end

  private

    def set_user_meeting
      @user_meeting = UserMeeting.find(params[:id])
    end

    def user_meeting_params
      params.require(:user_meeting).permit(:user_id, :meeting_id)
    end

end
