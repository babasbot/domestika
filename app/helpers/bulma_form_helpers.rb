module BulmaFormHelpers
  class ActionView::Helpers::FormBuilder
    include ActionView::Helpers::FormTagHelper
    include ActionView::Context

    def bulma_text_field_with_label(name)
      content_tag :div, class: 'field' do
        [
          bulma_label(name),
          content_tag(:div, class: 'control') { bulma_text_field(name) },
          bulma_help_text(name)
        ]
          .sum
      end
    end

    def bulma_password_field_with_label(name)
      content_tag :div, class: 'field' do
        [
          bulma_label(name),
          content_tag(:div, class: 'control') { bulma_password_field(name) },
          bulma_help_text(name)
        ]
          .sum
      end
    end

    def bulma_label(name)
      class_name =
        "label is-uppercase is-size-7 #{@object.errors[name].any? ? 'has-text-primary' : ''}"

      label name, name.capitalize, class: class_name
    end

    def bulma_text_field(name)
      class_name = "input #{@object.errors[name].any? ? 'is-primary' : ''}"

      text_field name, class: class_name
    end

    def bulma_password_field(name)
      class_name = "input #{@object.errors[name].any? ? 'is-primary' : ''}"

      password_field name, class: class_name
    end

    def bulma_help_text(name)
      content_tag(:p, class: 'help is-primary has-text-primary') do
        @object.errors[name].first
      end
    end

    def bulma_submit(value)
      submit value, class: 'button is-primary'
    end
  end
end
