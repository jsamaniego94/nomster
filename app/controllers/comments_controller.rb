class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    @place.comments.create(comment_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)

  end
end

<h1>Comments</h1>

<% @place.comments.each do |comment| %>
  <div>
    <blockquote>
      <b><%= comment.rating %></b> -
        <%= comment.message %>
      <small><%= comment.user.email %></small>
    </blockquote>
  </div>
<% end %>