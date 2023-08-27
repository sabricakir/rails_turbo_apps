module InteractionsHelper
  def interaction_button(user:, interactable_id:, interactable_type:, interaction_type:)
    return unless user.present?

    if user.send(interaction_type.pluralize).where(interactable_id:,
                                                   interactable_type:).present?
      button_to "Remove Your #{interaction_type.pluralize}",
                interactions_path(interactable_id:, interactable_type:, interaction_type:),
                class: 'rounded-lg py-3 px-5 bg-red-400 hover:bg-red-200 inline-block font-medium'

    else
      button_to "Add Your #{interaction_type.pluralize}",
                interactions_path(interactable_id:, interactable_type:, interaction_type:),
                class: 'rounded-lg py-3 px-5 bg-lime-400 hover:bg-lime-200 inline-block font-medium'
    end
  end
end
