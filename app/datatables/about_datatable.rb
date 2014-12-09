class AboutDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate
  
  def_delegators :@view, :truncate, :html_safe, :link_to, :admin_about_path, :edit_admin_about_path

  def sortable_columns
    @sortable_columns ||= ['title', 'description', 'created_at', 'udpated_at']
  end

  def searchable_columns
    @searchable_columns ||= ['title', 'description', 'created_at', 'udpated_at']
  end

  private

  def data
    records.map do |record|
      [
        record.title,
        truncate(record.description, :length => 100).html_safe,
        record.created_at,
        record.updated_at,
        link_to("Show", admin_about_path(record), :class => "btn btn-info"),
        link_to("Edit", edit_admin_about_path(record), :class => "btn btn-success"),
        link_to("Delete", admin_about_path(record), method: :delete, data: { confirm: 'Are you sure?' }, :class => "btn btn-danger")
      ]
    end
  end

  def get_raw_records
    About.all
  end

end
