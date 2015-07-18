class ReferencesController < ApplicationController
  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @reference = Reference.new(reference_params)
    current_user.reference = @reference
    respond_to do |format|
      format.js
    end
  end

  private
  def reference_params
    params.require(:reference).permit(:recommendation)
  end
end
