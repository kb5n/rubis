module Dashboard
  class SequencesController < Dashboard::ApplicationController
    before_action :set_section, only: %i[update]

    layout 'dashboard/application'

    # PATCH/PUT /dashboard/sections/1/sequence
    def update
      if params[:increase]
        update_sequence(1)
      elsif params[:decrease]
        update_sequence(-1)
      end
      redirect_to dashboard_article_url(id: @section.article_id), success: 'Section display order was successfully updated.'
    end

    private

    def update_sequence(direction)
      affected_section = Section.find_by!(article_id: @section.article_id, sequence: @section.sequence + direction)
      ActiveRecord::Base.transaction do
        @section.sequence += direction
        affected_section.sequence += (direction * -1)
        @section.save!
        affected_section.save!
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:section_id])
    end
  end
end
