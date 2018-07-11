class CommentsController < ApplicationController
  def create
    @comment = Comment.create(params.require(:comment).permit(:content, :song_id, :timestamp))

    @comment.update(user_id: session[:user_id])

    @song = Song.find(@comment.song_id)

    redirect_to @song
  end
end
