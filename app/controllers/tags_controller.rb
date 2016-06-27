class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:show, :edit, :update, :destroy]  
  before_action :set_card, only: [:new, :create, :edit, :update, :destroy]
  before_action :all_tags, only: [:index, :create, :edit, :update, :destroy]  
  respond_to :html, :js

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create        
    @tag = Tag.create(tag_params)    
    CardTag.create(card_id: params[:card_id], tag_id: @tag.id)
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    @tag.update(tag_params)
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def all_tags
      @tags = @card.tags
    end

    def set_card
      @card = Card.find(params[:card_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
