class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:content, :song_id, :timestamp))
    @song = Song.find(@comment.song_id)
    if @comment.valid?
      @comment.update(user_id: session[:user_id])
      @comment.timestamp.to_i
      @comment.save


      redirect_to @song
    else
      redirect_to @song
    end
  end
end
