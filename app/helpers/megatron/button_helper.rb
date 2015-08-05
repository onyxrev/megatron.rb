module Megatron
  module ButtonHelper
    def button(text, options = {})
      tag_name = options[:href].present? ? :a : :button
      opts = {
        class: button_classes(options)
      }
      opts[:href] = options[:href] if options[:href]
      content_tag tag_name, opts do
        if options[:icon]
          concat icon(options[:icon])
          concat ' '
        end
        concat text
      end
    end

    def primary_button(text, options = {})
      button(text, options.merge(type: :primary))
    end

    def destroy_button(text, options = {})
      button(text, options.merge(type: :destroy))
    end

    def primary_destroy_button(text, options={})
      button(text, options.merge(type: :primary_destroy))
    end

    def text_button(text, options = {})
      button(text, options.merge(type: :text))
    end

    def button_classes(options)
      button_type = options[:type] || options[:color]
      classes = button_type.present? ? ["#{button_type.to_s.gsub('_','-')}-btn"] : ["btn"]
      classes << options[:size].to_s.gsub(/xlarge/, 'x-large') if options[:size]
      classes << 'disabled' if options[:disabled]
      classes
    end
  end
end
