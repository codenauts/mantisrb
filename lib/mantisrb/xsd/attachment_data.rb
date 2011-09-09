module Mantis::XSD

  class AttachmentData
    include Mantis::XSD::DocBuilder
    attr_accessor :id, :filename, :size, :content_type, :date_submitted, :download_url, :user_id

    #def initialize(params={})
      #params.each_key { |p|
        #instance_variable_set("@#{p}", params[p])
      #}
    #end

    #def document(tag_name="attachment")
      #@doc ||= to_doc(tag_name)
    #end

    def to_doc(tag_name)
      builder = Nokogiri::XML::Builder.new { |xml|
        xml.send(tag_name, type: "tns:AttachmentData") do
          xml.id_ @id if @id
          xml.filename @filename if @filename
          xml.size @size if @size
          xml.content_type @content_type if @content_type
          xml.date_submitted @date_submitted if @date_submitted
          xml.download_url @download_url if @download_url
          xml.user_id @user_id if @user_id
        end
      }
      builder.doc
    end # to_doc

    #def to_element_string(tag_name)
      #document(tag_name).root.to_s
    #end # to_element_string
  end # AttachmentData
end # Mantis::XSD
