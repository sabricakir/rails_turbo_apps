class InteractionsController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    interaction_type = params[:interaction_type]
    interactable_id = params[:interactable_id]
    interactable_type = params[:interactable_type]

    return unless Interaction::INTERACTION_TYPES.include?(interaction_type)

    @interaction = Interaction.find_by(user: Current.user, interactable_id:,
                                       interactable_type:, action: interaction_type)

    if @interaction.present?
      @interaction.destroy
    else
      @interaction = Interaction.create(user: Current.user, interactable_id:,
                                        interactable_type:, action: interaction_type)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("#{interactable_type}_#{interactable_id}_interaction_buttons",
                                                  partial: 'interactions/interaction_buttons',
                                                  locals: { interactable_type:, interactable_id: })
      end
    end
  end
end
