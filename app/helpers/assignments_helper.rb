module AssignmentsHelper
  def markdown(text)
    options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
        fenced_code_blocks: true
    }

    extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def active?(assignment)
    assignment.date < DateTime.now
  end

  def past?(assignment)
    assignment.due < DateTime.now
  end

  def draw_status(assignment, student)
    if status(assignment, student) == 'complete'
      content_tag(:span, 'COMPLETE', class: "radius success label")
    elsif status(assignment, student) == 'up_for_review'
      content_tag(:span, 'UP FOR REVIEW', class: "radius regular label")
    elsif status(assignment, student) == 'no_submission'
      content_tag(:span, 'NO SUBMISSION', class: "radius alert label")
    else
      content_tag(:span, 'ERROR', class: "radius alert label")
    end
  end

  # def link_button_status(assignment, student)
  #   s = assignment.get_submission(student)
  #   r = edit_assignment_submission_path(assignment.id, s)
  #
  #   if status(assignment, student) == 'complete'
  #     content_tag(:div, class: "button-bar") do
  #       content_tag(:ul, class: "button-group round") do
  #         content_tag(:li, link_to "Submitted URL", s.url, class: "tiny button secondary")
  #         content_tag(:li, link_to "Review", r, class: "tiny button success")
  #       end
  #     end
  #
  #
  #   elsif status(assignment, student) == 'up_for_review'
  #     content_tag(:div, class: "button-bar") do
  #       content_tag(:ul, class: "button-group round") do
  #         content_tag(:li, link_to "Submitted URL", s.url, class: "tiny button secondary")
  #         content_tag(:li, link_to "Review", r, class: "tiny button success")
  #       end
  #     end
  #   elsif status(assignment, student) == 'no_submission'
  #   else
  #   end
  # end

  def status(assignment, student)
    s = assignment.get_submission(student)
    if s
      if s.complete?
        return 'complete'
        # content_tag(:span, 'COMPLETE', class: "radius success label")
        # link_to "Submitted URL", s.url
        # link_to "Review", edit_assignment_submission_path(assignment.id, s)
      else
        return 'up_for_review'
        # content_tag(:span, 'UP FOR REVIEW', class: "radius regular label")
        # link_to "Submitted URL", s.url
        # link_to "Review", edit_assignment_submission_path(assignment.id, s)
      end
    else
      return 'no_submission'
      # content_tag(:span, 'NO SUBMISSION', class: "radius alert label")
    end
  end

end
