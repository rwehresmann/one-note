class TagsController < ApplicationController
  before_action :set_note, only: [:update, :destroy, :show]

  def add_to_note
    @tag = Tag.find_or_create_by(title: params[:title], user: current_user)
    @note = current_user.notes.find params[:note_id]
    @note.tags << @tag

    render json: {message: "Tag adicionada com sucesso!"}, status: :ok
  end

  def remove_from_note
    @tag = Tag.find_by(title: params[:title], user: current_user)
    @note = current_user.notes.find(params[:note_id])
    @note.tags.delete(@tag.id)
    @tag.destroy if @tag.notes.count == 0

    render json: {message: "Tag removida com sucesso!"}, status: :ok
  end

    private

    def set_note
      @note = Note.find params[:id]
    end

    def note_params
      params.require(:note).permit(:title, :body)
    end
end
