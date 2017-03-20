module ApplicationHelper
  
  def is_active?(link_path)
    current_page?(link_path) ? "active" : ""
  end
  
end

module ActionView
  module Helpers
    class FormBuilder 

      def date_select(method, options = {}, html_options = {})
        existing_date = @object.send(method) 

        # Set default date if object's attr is nil
        existing_date ||= Time.now.to_date

        formatted_date = existing_date.to_date.strftime("%F") if existing_date.present?
        @template.content_tag(:div, :class => "input-group") do    
          text_field(method, :value => formatted_date, :class => "form-control datepicker", :"data-date-format" => "YYYY-MM-DD") +
          @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
        end
      end

      def datetime_select_time(method, options = {}, html_options = {})
        existing_time = @object.send(method) 

        # Set default date if object's attr is nil
        existing_date ||= Time.now

       formatted_time = existing_time.to_time.strftime("%F %I:%M %p") if existing_time.present?
        @template.content_tag(:div, :class => "input-group") do    
          text_field(method, :value => formatted_time, :class => "form-control datetimepicker", :"data-date-format" => "YYYY-MM-DD hh:mm A") +
          @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
        end
      end
        
      def datetime_select_no_time(method, options = {}, html_options = {})
        existing_time = @object.send(method) 

        # Set default date if object's attr is nil
        existing_date ||= Time.now

       formatted_time = existing_time.to_time.strftime("%F %I:%M %p") if existing_time.present?
        @template.content_tag(:div, :class => "input-group") do    
          text_field(method, :value => formatted_time, :class => "form-control datetimepicker", :"data-date-format" => "MM-DD-YYYY") +
          @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
        end    
      end

      def datetime_select_install1(method, options = {}, html_options = {})
        existing_time = @object.send(method) 

        # Set default date if object's attr is nil
        existing_date ||= Time.now

       formatted_time = existing_time.to_time.strftime("%F %I:%M %p") if existing_time.present?
        @template.content_tag(:div, :class => "input-group") do    
          text_field(method, :value => formatted_time, :class => "form-control datetimepicker install-picker1", :"data-date-format" => "MM-DD-YYYY") +
          @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
        end    
      end

      def datetime_select_install2(method, options = {}, html_options = {})
        existing_time = @object.send(method) 

        # Set default date if object's attr is nil
        existing_date ||= Time.now

       formatted_time = existing_time.to_time.strftime("%F %I:%M %p") if existing_time.present?
        @template.content_tag(:div, :class => "input-group") do    
          text_field(method, :value => formatted_time, :class => "form-control datetimepicker install-picker2", :"data-date-format" => "MM-DD-YYYY") +
          @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
        end    
      end
    end
  end
end
